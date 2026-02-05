function scr_get_item_rarity(_item)
{
	enum ITEM_RARITY
	{
		VERY_RARE,
		RARE,
		UNCOMMON,
		COMMON
	}
	
	switch(_item)
	{	
		case ITEM.RICE:
		case ITEM.ORAN_BERRY:
		case ITEM.CHERI_BERRY:
		case ITEM.COLBUR_BERRY:
			return ITEM_RARITY.COMMON;
			
		case ITEM.SWEET_POTATOES:
		case ITEM.PECHA_BERRY:
		case ITEM.SITRUS_BERRY:
			return ITEM_RARITY.UNCOMMON;
			
		case ITEM.KEBIA_BERRY:
		case ITEM.BELUE_BERRY:
		case ITEM.QUALOT_BERRY:
			return ITEM_RARITY.RARE;
			
		case ITEM.SWAP_SHROOMS:
		case ITEM.ENIGMA_BERRY:
			return ITEM_RARITY.VERY_RARE;
	}
}