/// @desc scr_create_item(item_id, amount)
function scr_create_item(argument0, argument1) {

	var _item = argument0;
	var _item_count = argument1;
	
	if(_item_count <= 0) return;

	var _slot_id = -1;
	var _first_empty_spot = -1;
	
	for(var _i = 0; _i < global.inventory_slots; _i++)
	{
		if(global.ds_inventory[# 0, _i] == _item && global.ds_inventory[# 1, _i])
		{
			_slot_id = _i;
		}
		if(global.ds_inventory[# 0, _i] ==ITEM.NONE && _first_empty_spot == -1)
		{
			_first_empty_spot = _i;
		}
	}
	
	if(_slot_id != -1)
	{
		global.ds_inventory[# 1, _slot_id] += _item_count;
	}
	else
	{
		global.ds_inventory[# 0, _first_empty_spot] = _item;
		global.ds_inventory[# 1, _first_empty_spot] += _item_count;
		global.ds_inventory[# 2, _first_empty_spot] = scr_get_item_description(_item, false);
	}
}