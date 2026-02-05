function scr_get_item_description(_item_id, _cooking) 
{
	switch(_item_id)
	{
		case ITEM.RICE:
			if(!_cooking) { return "Rice\nFresh grains of nutritious white rice.\nNot the most exciting, but a solid base for meals."; }
			else { return "Rice\nA solid base for meals.\nSlightly replenishes Arousal."; }
		case ITEM.SWEET_POTATOES:
			if(!_cooking) { return "Sweet Potatoes\nA highly popular ingredient for cooking.\nFew 'Mons can resist its mellowy sweet goodness!"; }
			else { return "Sweet Potatoes\nAdds a lovely mellow flavor.\nIncreases Encounter Chance."; }
		case ITEM.SWAP_SHROOMS:
			if(!_cooking) { return "Swap Shrooms\nA mix of suspiciously shaped glowing shrooms.\nThey taste great, but may induce a gender swap."; }
			else { return "Swap Shrooms\nSwaps gender of all 'Mons and boosts Arousal."; }
			
		case ITEM.ORAN_BERRY:
			if(!_cooking) { return "Oran Berry\nNature's gifts came together in this Berry.\nIt has a wondrous mix of flavors."; }
			else { return "Oran Berry\nImparts various rich flavors.\nBlue 'Mons seem to like it."; }
		case ITEM.CHERI_BERRY:
			if(!_cooking) { return "Cheri Berry\nThis Berry has a spicy and provocative flavor.\nIt blooms with delicate, pretty flowers."; }
			else {  return "Cheri Berry\nAdds a delicious spicy taste.\nFire 'Mons seem to like it.";  }
		case ITEM.COLBUR_BERRY:
			if(!_cooking) { return "Colbur Berry\nThis strange spiky berry sticks to 'Mon's fur.\nIt's got a distinct sour flavor and vibrant color."; }
			else {  return "Colbur Berry\nAdds a distinct sour taste.\nDark 'Mons seem to like it.";  }
			
		case ITEM.KEBIA_BERRY:
			if(!_cooking) { return "Kebia Berry\nA brilliant green berry with a sweet dark inside.\nFemale 'Mons seem to especially like these berries."; }
			else {  return "Kebia Berry\nAdds an earthy sweet taste.\nAttracts female 'Mons.";  }
		case ITEM.BELUE_BERRY:
			if(!_cooking) { return "Belue Berry\nA juicy hard berry with a strong taste.\nIt's by far most popular among male 'Mons."; }
			else {  return "Belue Berry\nAdds a juicy sour taste.\nAttracts male 'Mons.";  }
			
		case ITEM.PECHA_BERRY:
			if(!_cooking) { return "Pecha Berry\nAn easy to obtain and delicious berry.\nIts sweet flavor is loved by many."; }
			else { return "Pecha Berry\nSweet, boosts Encounter Chance and Affection of wild 'Mons."; }
		case ITEM.SITRUS_BERRY:
			if(!_cooking) { return "Sitrus Berry\nFamily of the Oran Berry, but smoother and juicier.\nIt gives overwhelming energy when eaten."; }
			else {  return "Sitrus Berry\nHas a juicy energizing taste.\nBoost Arousal of all 'Mons.";  }
		case ITEM.QUALOT_BERRY:
			if(!_cooking) { return "Qualot Berry\nThis berry grows in wet climates and is a symbol for love.\nIt's got a spicy skin, but sweet flavor inside."; }
			else {  return "Qualot Berry\nImparts a nice sweet taste.\nBoosts Affection of all 'Mons.";  }
			
		case ITEM.ENIGMA_BERRY:
			if(!_cooking) { return "Enigma Berry\nA strange berry that tastes different each time you eat it.\nIt supposedly has the power of the stars in it."; }
			else {  return "Enigma Berry\nInfluence on taste varies.\nGuaranties Species based on slot.";  }
		default:
			return "";
	}
}