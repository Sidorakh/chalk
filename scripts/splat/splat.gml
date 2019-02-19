///@func splat(x,y,spd,dir,color,scale)
///@args x,y,spd,dir,color,scale
var _new=[];
_new[@Paint.X]=argument[0];
_new[@Paint.Y]=argument[1];
_new[@Paint.S]=argument[2];
_new[@Paint.D]=argument[3];
_new[@Paint.C]=make_color_hsv(argument[4],100,255);
_new[@Paint.SC]=argument[5];
ds_list_add(global.splatters,_new);
return;