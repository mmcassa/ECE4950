clear all
close all
clc

cam = webcam('HP USB Webcam');
types = [  [ 1 , 2 , 4 ] ;
            [ 5 , 3 , 6 ] ;
            [ 11 , 12 , 14 ] ;
            [ 15 , 13 , 16 ] 
         ];
 preview(cam)