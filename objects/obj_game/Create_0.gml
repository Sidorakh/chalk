/// @description
//Define "lightweight object format" for paint splatters
enum Paint{
	X,
	Y,
	S,
	D,
	C,
	SC,
}
#macro size 32
global.splatters=ds_list_create();
global.col_list=ds_list_create();
trashcan=ds_queue_create();