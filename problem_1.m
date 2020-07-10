import compute_stereo_calib.*
import get_world_points.*

P1 = load('pts_world.mat').P;
p2 = load('pts_viewL.mat').pl;
p3 = load('pts_viewR.mat').pr;
[Kl,Tl,Kr,Tr] = compute_stereo_calib(P1,p2,p3)
point = get_world_points(Tl,p2,Tr,p3);
point = point(1:3,:)';

nor = point - P1;
mean2(nor)
min(min(nor))
max(max(nor))
std2(nor)
     