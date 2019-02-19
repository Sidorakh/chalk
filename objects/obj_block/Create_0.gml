/// @description
mysurf=surface_create(size*image_xscale,size*image_yscale);
mybuff = buffer_create(size*image_xscale*size*image_yscale*4,buffer_fixed,1);
buffer_fill(mybuff,0,buffer_u8,0,size*image_xscale*size*image_yscale*4);
clear=true;