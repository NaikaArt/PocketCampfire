/// @description Insert description here
// You can write your code in this editor
if(!selected || locked) { return; }

switch(mode)
{
	case 0:
		scr_create_confirmation("Are you sure you want to quit the game?", scr_quit_game); 
	break;
	case 1:
		url_open("https://twitter.com/PawPunch");
	break;
}