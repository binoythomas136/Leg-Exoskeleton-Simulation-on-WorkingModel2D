%newton-euler
a=csvread('data.csv');% get data
L1=0.40;
L2=0.40;%length of hip
L3=0.15;%length of calf
R(:,:,4)=[1 0 0;
            0 1 0;
            0 0 1;];

for i=1:101
    theta=[a(i,2),a(i,5),a(i,8)]    %rotation
    thetadot=[a(i,3),a(i,6),a(i,9)];%velocity
    thetaddot=[a(i,4),a(i,7),a(i,10)];%acceleration
    for j=1:3
    R(:,:,j)=[cos(theta(j)) -sin(theta(j)) 0;
            sin(theta(j)) cos(theta(j)) 0;
            0 0 1;];
    end
    
    
    %Translational matrices
    p(:,:,1)=[0;0;0];
    p(:,:,2)=[L1;0;0];
    p(:,:,3)=[L2;0;0];
    p(:,:,4)=[0.05;L3;0];
    
    %the displacement of link from COM
    s(:,:,1)=[0.14;0;0];
    s(:,:,2)=[0.12;0;0];
    s(:,:,3)=[0.025;0.025;0];
    
    %mass of body plus exoskeleton
    m=[18.01,6.51,5]
    
    %initial values
    w(:,:,1)=[0;0;0];      
    wdot(:,:,1)=[0;0;0];       
    vdot(:,:,1)=[-9.8;0;0];
    f(:,:,4)=[0;0;0];
    n(:,:,4)=[0;0;0];
    
    %moment of inertias
    I(:,:,1)=[0.03 0 0;
            0 0.3 0;
            0 0 0.3;];
    I(:,:,2)=[0.01,0,0;0,0.13,0;0,0,0.13;];
    I(:,:,3)=[0.023,0,0;0,0.011,0;0,0,0.011;];
    
    %outward recursion
    for k=2:4
    w(:,:,k)=R(:,:,k-1)'*w(:,:,k-1) + [0;0;thetadot(k-1)]
    wdot(:,:,k)=R(:,:,k-1)'*wdot(:,:,k-1) + R(:,:,k-1)*(cross(w(:,:,k-1),[0;0;thetadot(k-1)])) + [0;0;thetaddot(k-1)]
    vdot(:,:,k)=R(:,:,k-1)'* (vdot(:,:,k-1) +cross(wdot(:,:,k-1),p(:,:,k-1)) + cross(w(:,:,k-1),cross(w(:,:,k-1),p(:,:,k-1))))
    vdotc(:,:,k)=vdot(:,:,k)+ cross(wdot(:,:,k),s(:,:,k-1))+cross(w(:,:,k),cross(w(:,:,k),s(:,:,k-1))) 
    F(:,:,k)=m(k-1)*vdotc(:,:,k)
    N(:,:,k)=I(:,:,k-1)*wdot(:,:,k)+cross(w(:,:,k),I(:,:,k-1)*w(:,:,k));
    end
    
    %inward recursion
    for o=4:-1:2
    f(:,:,o-1)=R(:,:,o)*f(:,:,o) + F(:,:,o)
    n(:,:,o-1)=R(:,:,o)*n(:,:,o)+cross(p(:,:,o), R(:,:,o)*f(:,:,o))+cross(s(:,:,o-1),F(:,:,o))++ N(:,:,o)
    tau(o-1)=n(3,1,o-1)
    end
    tau_final(:,:,i)=tau(:);
end




%saving the torque values
fileID = fopen('datafile.txt','w');
for i=1:101
    fprintf(fileID,'%6.2f %6.2f %6.2f %6.2f\n',a(i,1),tau_final(1,1,i),tau_final(2,1,i),tau_final(3,1,i));
end