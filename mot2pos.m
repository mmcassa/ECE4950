function [ x y ] = mot2pos(x,y)
move_motors(x,y,75000,0);
pause(1);
move_motors(x,0,80000,1);
move_motors(x,0,16000,1);
pause(.6);
move_motors(-.5,0,16000,1);
move_motors(-.5,0,16000,0);