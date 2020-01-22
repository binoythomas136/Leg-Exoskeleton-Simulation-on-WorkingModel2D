%computed rotation values
rot_act1=[];%add values from bthomas7_angles_velocities.xlsx folder through workspace
rot_act2=[];
rot_act3=[];

%desired rotation values
for i=1:101;
    rotf1(i)=rot1(i);       
    rotf2(i)=rot1(i)+rot2(i);
    rotf3(i)=rot1(i)+rot2(i)+rot3(i);
end
x=0:0.01:1;
figure(1)
plot(x,rotf1);
hold on
plot(x,rot_act1);
title('hip angles');
xlabel('time');
ylabel('angles');
legend('desired rotation','actual rotation');


figure(2)
plot(x,rotf2);
hold on
plot(x,rot_act2);
title('calf angles');
xlabel('time');
ylabel('angles');
legend('desired rotation','actual rotation');


figure(3)
plot(x,rotf3);
hold on
plot(x,rot_act3);
title('foot angles');
xlabel('time');
ylabel('angles');
legend('desired rotation','actual rotation');

%computed velocity values
rot_act1=[];%add values from bthomas7_angles_velocities.xlsx folder through workspace
rot_act2=[];
rot_act3=[];

%desired rotation values
for i=1:101
    velf1(i)=vel1(i);
     velf2(i)=vel1(i)+vel2(i);
     velf3(i)=vel1(i)+vel2(i)+vel3(i);
end

figure(4)
plot(x,velf1);
hold on
plot(x,vel_act1);
title('hip velocities');
xlabel('time');
ylabel('velocity');
legend('desired velocity','actual velocity');


figure(5)
plot(x,velf2);
hold on
plot(x,vel_act2);
title('calf velocities');
xlabel('time');
ylabel('velocity');
legend('desired velocity','actual velocity');


figure(6)
plot(x,velf3);
hold on
plot(x,vel_act3);
title('foot velocities');
xlabel('time');
ylabel('velocity');
legend('desired velocity','actual velocity');


