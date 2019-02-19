/// @description
//Coordinates are based on the room size
var width=720;
var cx = room_width div 2;
var cy = room_height div 2;
var _interval = 30;

//Splat the title
for(var i=0;i<_interval;i++) {
	for(var m=0;m<10;m++) {
		splat(cx-(width/2)+(width/_interval)*i,cy-60+(m*12),24,irandom(360),i*10,3);
	}
}

//Splat the menu options
for (var _x =0;_x<80;_x+=4){ 
	for (var _y=0;_y<20;_y+=2) {
		//ystart=542
		splat(cx/2 - ((_x-40)/40)*160,542 + ((_y-10)/10)*5,24,irandom(360),_x*10,2);
		splat(cx/2+cx - ((_x-40)/40)*160,542 + ((_y-10)/10)*5,24,irandom(360),_x*10,2);
	}	
}

//Init the surface and corresponding buffer
menu_surf = noone;
menu_buff = buffer_create(room_width*room_height*4,buffer_fixed,1);
init = false;