/// @description Paint blob logic
//Settings (middle click)
for(var i=0;i<ds_list_size(global.splatters);i++) {
	//Grab the array of the current blob
	var _paint=global.splatters[|i];
	_paint[@Paint.X]+=lengthdir_x(_paint[@Paint.S],_paint[@Paint.D]);
	_paint[@Paint.Y]+=lengthdir_y(_paint[@Paint.S],_paint[@Paint.D]);
	_paint[@Paint.S]*=random_range(blob_speed_change_min,blob_speed_change_max);
	_paint[@Paint.SC]*=random_range(blob_size_change_min,blob_size_change_max);
	
	//Destroy small paint blobs
	if (_paint[@Paint.SC]<0.1) {
		_paint=-1;
		ds_queue_enqueue(trashcan,i);
	}
}
//Delete destroyed blobs from the list
while(ds_queue_size(trashcan)>0) {
	ds_list_delete(global.splatters,ds_queue_dequeue(trashcan));
}