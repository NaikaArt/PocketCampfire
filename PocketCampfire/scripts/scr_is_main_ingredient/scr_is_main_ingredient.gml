function scr_is_main_ingredient(_item_type)
{
	switch(_item_type)
	{
		case ITEM.RICE:
		case ITEM.SWEET_POTATOES:
		case ITEM.SWAP_SHROOMS:
			return true;
	}
	
	return false;
}