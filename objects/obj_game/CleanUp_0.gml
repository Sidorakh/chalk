/// @description Garbage collection
ds_list_destroy(global.col_list);
ds_list_destroy(global.splatters);
ds_queue_destroy(trashcan);