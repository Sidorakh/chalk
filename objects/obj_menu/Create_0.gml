/// @description
var width=720;
var cx=room_width div 2;
var cy=room_height div 2;
for(var i=0;i<25;i++)
	{
	for(var m=0;m<10;m++)
		{
		splat(cx-(width/2)+(width/25)*i,cy-60+(m*12),24,irandom(360),i*10,3);
		}
	}