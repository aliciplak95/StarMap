clc; clear all; close all;
%%
%read image
starmap = rgb2gray(imread('StarMap.png'));
smallarea = rgb2gray(imread('Small_area.png'));
%smallarea = rgb2gray(imread('Small_area_rotated.png'));
%%
%find features
points1 = detectSURFFeatures(starmap);
points2 = detectSURFFeatures(smallarea);
%%
%extractFeatures
[f1,vpts1] = extractFeatures(starmap, points1);
[f2,vpts2] = extractFeatures(smallarea, points2);
%%
%find location
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));
%%
%display
figure(1); 
showMatchedFeatures(starmap, smallarea, matchedPoints1, matchedPoints2);
© 2020 GitHub, Inc.