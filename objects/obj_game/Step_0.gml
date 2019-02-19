/// @description Paint blob things
for(var i=0;i<ds_list_size(global.splatters);i++) {
	//Grab the array of the current blob
	var _paint=global.splatters[|i];
	_paint[@Paint.X]+=lengthdir_x(_paint[@Paint.S],_paint[@Paint.D]);
	_paint[@Paint.Y]+=lengthdir_y(_paint[@Paint.S],_paint[@Paint.D]);
	_paint[@Paint.S]*=0.85;
	_paint[@Paint.SC]*=0.70;
	//Destroy small paint blobs
	if (_paint[@Paint.SC]<0.1) {
		_paint=-1;
		ds_queue_enqueue(trashcan,i);
	}
}
while(ds_queue_size(trashcan)>0) {
	ds_list_delete(global.splatters,ds_queue_dequeue(trashcan));
}