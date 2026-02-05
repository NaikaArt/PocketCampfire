/// @description Update Text Array

// This is the text and option branch of the Interaction Textbox. Regular line is as follows:
// [x,0] = Text (string), [x,1] = Next Page Index (int) [-1 means option, -2 means exit interaction]

// We can also denote an Option Box Prompt like in Line 1, format for this is as follows:
// [Text, Affection Requirement, Arousal Requirement, Arousal Cost, Target page, Functions]
// Now the format is [x,y], where y is the a Choice Entry (follows the format above).

// Main interaction menu
text[0,0] = "What will you do with $?"; text[0,1] = -1;		
text[1,0] = ["Chat", 0, 5, 0, 2, scr_chat]; text[1,1] = ["Examine", 0, 0, 0, 3]; text[1,2] = ["Interact...", 0, 0, 0, 4]; text[1,3] = ["Go Back", 0, 0, 0, -2, scr_goto_camp];

// Chat and examine prompts, these are generated based on active mon stats
text[2,0] = prompt_chat; text[2,1] = 0;		
text[3,0] = prompt_examine; text[3,1] = 0;

// Interact menu
text[4,0] = "I'll ask $ to..."; text[4,1] = -1;
text[5,0] = ["Pet", 0, 10, 0, 6, scr_pet]; text[5,1] = ["Show Off", 20, 35, 0, 7, scr_showoff]; text[5,2] = ["Get Intimate", 45, 70, 0, 8, scr_get_intimate]; text[5,3] = ["Have sex", 80, 70, 0, 9]; text[5,4] = ["Go back...", 0, 0, 0, 0];

// Pet, Show Off and Get Intimate pormpts, these have affection requirements as well
text[6,0] = prompt_pet; text[6,1] = 4;
text[7,0] = prompt_showoff; text[7,1] = 4;
text[8,0] = prompt_intimate; text[8,1] = 4;

// Sex confirmation prompt
text[9,0] = "Take $ to your tent for sex?"; text[9,1] = -1;
text[10,0] = ["Yes", 0, 0, 0, -2, scr_start_scene]; text[10,1] = ["Go back...", 0, 0, 0, 4];

// Response when 'Mon doesn't have enough Arousal
text[low_arousal_page,0] = "$ doesn't seem in the mood for that right now..."; text[low_arousal_page,1] = 0;