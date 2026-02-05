function scr_generate_text_prompt(_type, _name) 
{
	enum TEXT_PROMPT_TYPE
	{
		CHAT,
		EXAMINE,
		PET,
		SHOW_OFF,
		GET_INTIMATE,
		SCENE_START,
		SCENE_END_A,
		SCENE_END_B,
		COOKING_SEQUENCE
	}
	
	var _affection = 0;
	var _arousal = 0;
	var _species = 0;
	var _gender = 0;

	if(global.active_mon != noone)
	{
		_affection = global.active_mon[? "affection"];
		_arousal = global.active_mon[? "arousal"];
		_species = global.active_mon[? "species"];
		_gender = global.active_mon[? "gender"];
	}
	
	var _affection_level = scr_get_affection_level(_affection);
	var _arousal_level = scr_get_arousal_level(_arousal)
	var _mon_count = ds_list_size(global.ds_mon);
	
	var _lines = [];
	
	switch(_type)
	{
		case TEXT_PROMPT_TYPE.CHAT:
			switch(_affection_level)
			{
				case AFFECTION_LEVEL.NEW:
					// Regular
					array_push(_lines, "I coo some soft, kind words towards NAME. For a moment HE_SHE_L puts down HIS_HER_L walls, but only briefly.");
					array_push(_lines, "I tell NAME I think HE_SHE_L look gorgeous. HE_SHE stares at me hesitantly before turning away.");
					array_push(_lines, "NAME came up to me carefully and made a little sound, I think HE_SHE_L's starting to show some interest!");
					array_push(_lines, "I gently reach my hand towards NAME to let HIM_HER_L get used to my scent. HE_SHE cautiously sniffs it, but backs off again quite fast.");
					array_push(_lines, "I get a berry from my ingredient stash and offer it to NAME... HE_SHE looks at me before carefully nibbling on it!");
					array_push(_lines, "I hum a little song to try and soothe NAME. HE_SHE looks at me intrigued, I think that worked somewhat!");
					array_push(_lines, "I sit down next to NAME to just hang out. HE_SHE's hesitant at first, but sits with me for some time!");	
					
					array_push(_lines, "FAIL I tell NAME HE_SHE_L can trust me, but HE_SHE_L gives me the cold shoulder... I don't think HE_SHE_L's convinced yet.");
					array_push(_lines, "FAIL I try to chatter with NAME about anything that comes to mind, but HE_SHE_L's stone cold ignoring me...");
					array_push(_lines, "FAIL I reach out my hand to try and have NAME sniff it, but HE_SHE_L frowns and turns away immediately!");
					array_push(_lines, "FAIL I try to coax NAME over with some food, but HE_SHE_L's not having it right now...");
					
					// Gendered
					if(_gender == GENDERS.M) 
					{
						array_push(_lines, "I bow down to NAME and HE_SHE_L glances at me... This often works for showing male mons respect!");
						array_push(_lines, "I blink and yawn at NAME to put HIM_HER_L at ease. This works to show most male 'Mons you're not a threat!");
					}
					else 
					{
						array_push(_lines, "I give NAME a sweet piece of fruit to eat. It's a great way to show female 'Mons you're a provider!");
						array_push(_lines, "I take a piece of my clothing and offer NAME to smell it. HE_SHE does and looks up at me with interest. Females smelling male scents can get them interested!");
					}
					
					// Species Specific
					switch(_species)
					{
						case SPECIES.ALOLANVULPIX:
							array_push(_lines, "I take some of the snow NAME scattered around and put it on my head. HE_SHE seems amused at my silly attempt to communicate!");
							array_push(_lines, "FAIL I reach my hand out to let NAME sniff my hand,\nbut HE_SHE huffs an icy gust at it! COLD!");
						break;
						case SPECIES.BRAIXEN:
							array_push(_lines, "I pick up a stick and make some sweeping motions with it. NAME looks puzzled at first, but joins in to mimic me! This trick is a great way to bond with their species.");
							array_push(_lines, "FAIL I try and reach my hand to NAME so SHE can sniff it, but HE_SHE_L whacks it with HIM_HER_L stick! Ouch, rude!");
						break;
						case SPECIES.CINDERACE:
							array_push(_lines, "I get a ball from my tent and kick it towards NAME. HE_SHE looks down and kicks it back gently from a distance. Playing ball for a bit made us bond a little!");
							array_push(_lines, "FAIL I get closer to NAME to let HE_HIM_L get used to my smell, but HE_HIM_L feints kicks at me to back me off!");
						break;
						case SPECIES.LUCARIO:
							array_push(_lines, "I see NAME do some yoga poses and I join in. HE_SHE looks at me weird at first, but quickly starts to sync up to my calm aura and grows a bit friendlier!");
							array_push(_lines, "FAIL I try to sync up with NAME's aura, but apparently a bit too eagerly... HE_SHE sends a shock to tell me to back off!");
						break;
						case SPECIES.NICKIT:
							array_push(_lines, "I get a broom from my tent and start sweeping the campsite, mimicking NAME cleaning HIS_HER_L tracks with HIS_HER_L tail. HE_SHE enjoys the exchange, it's almost like a little dance!");
							array_push(_lines, "FAIL I reach my hand for NAME to get HIM_HER_L used to my smell. I was too fast and got my face whacked with HIS_HER_L big tail!");
						break;
						case SPECIES.VULPIX:
							array_push(_lines, "I give a spicy berry to NAME, their species loves them. Giving one is a token of appreciation, and it seems to work like a charm! This should definitely help us bond.");
							array_push(_lines, "FAIL I try to approach NAME with my hand, but HE_SHE_L shoots cinders at it! Ouch, quick! Lukewarm water!");
						break;
						case SPECIES.ZOROARK:
							array_push(_lines, "NAME is occasionally performing illusions of other 'Mons in the forest. In turn I try to mimick HIS_HER_L illusions, which turns into a funny bonding exercise!");
							array_push(_lines, "FAIL I lower to a crouch and try to get closer to NAME, but HE_SHE_L's not having it and snarls at me!");
						break;
					}
				break;
				
				case AFFECTION_LEVEL.LOW:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I chatter some compliments in a sweet voice, NAME smiles and displays content body language!");
						array_push(_lines, "I offer my hand too fast and NAME goes into high alert mode, but HE_SHE_L calms and sniffs it curiously. HE_SHE seems at ease and recognizes my scent!");
						array_push(_lines, "I sit down next to NAME and we stare at the water for a while. Not much is said, but it's a nice experience anyways!");
						array_push(_lines, "I watch some videos on my phone and NAME curiously comes up to investigate the sound. HE_SHE looks at the videos, but quickly loses interest...");
						array_push(_lines, "I get a berry from my ingredient stash and offer it to NAME. HE_SHE delightedly takes it and gobbles it up, after which HE_SHE_L tries to say thanks in HIS_HER_L language!");
						array_push(_lines, "I sing the lyrics of some song I have stuck in my head, and NAME seems entranced by it!");
						array_push(_lines, "I ask NAME how HE_SHE_L's feeling. HE_SHE gives me a smile and a small yip to express HE_SHE_L's content!");			
						array_push(_lines, "I try to chatter with NAME about anything that comes to mind. It's a pretty one-sided conversation, but NAME is happy to just listen!");
						array_push(_lines, "I play a game of memory with NAME using a deck of cards with fruits on it, and I lost... I sometimes forget these creatures have human-level intelligence!");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "I introduce NAME to one of the other 'Mons at my camp. They hit it off and begin to play in the grass!");
							array_push(_lines, "Another 'Mon walks by and interupts my talk with NAME.\nHE_SHE seems more interested in interacting with them right now...");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I play-wrestle with NAME a bit and get some bite marks on my arm! Strange how males are awkward about touch, but will roundhouse with no issue...");
							array_push(_lines, "I play some tug-o-war with NAME using an old rope I had laying around. I stage a dramatic defeat and NAME gloats over HIS_HER_L victory!");
						}
						else 
						{
							array_push(_lines, "I help NAME groom and HE_SHE_L tries to groom my hair in return! Despite not being very touchy yet, grooming seems less out-of-bounds.");
							array_push(_lines, "I put on some music for me and NAME and HE_SHE_L's wobbling along to it! It's curious how females tend to be especially receptive to music.");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I ask NAME for some help with re-freezing my cool box, and HE_SHE_L obliges. HE_SHE looks proud and I've got cool drinks again!");
								array_push(_lines, "It's especially hot outside today, so I hang out close to NAME to cool off. It works wonderfully, but HE_SHE_L's pouting about personal space!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME is doing a little dance rehearsal and I join in.\nShe giggles and we have a silly little dance session!");
								array_push(_lines, "I find a stick from the woods and challenge NAME to a swordfight! HE_SHE accepts and proceeds to kick my ass at it... The bruises were worth the fun!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I get a ball from my tent and NAME gets excited!\nWe kick the ball back and forth, HE_SHE_L's shockingly good at keeping posession of the ball and aiming HIS_HER_L shots!");
								array_push(_lines, "I notice NAME's pants are sagging a bit and I politely pull them back up for HIM_HER_L. HE_SHE blushes and looks a little embarrased about it!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I notice NAME practising some stances and movements.\nI try to join in but it ends in disaster, much to NAME's uproarious amusement!");
								array_push(_lines, "NAME and I sit down to meditate at the pond together. We share a nice moment of quiet and we can feel our auras meld together for just a moment!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I catch NAME red-handed stealing snacks from my tent again... I decide to be nice and let HIM_HER_L keep it and HE_SHE_L's grateful enough to do a cat-like love headbutt!");
								array_push(_lines, "NAME and I continue our habit of sweeping the camping grounds together and playfully whip some sand at each other! It's a very fun ritual.");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "I give NAME a ball of red yarn for the occasion a one would show up, HE_SHE_L starts playing with it immediately! They're not really feline, but NAMEes love this stuff.");
								array_push(_lines, "I ask NAME to help me light up the campfire and HE_SHE_L takes care of it without much effort. HE_SHE gloats proudly, that saves a lot of work!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "NAME is occasionally performing illusions of other 'Mons in the forest. I try to mimick HIS_HER_L illusions as well, which turns into a funny bonding exercise!");
								array_push(_lines, "NAME and I try to climb a nearby tree for fun, but HE_SHE_L's way better at it than me... I can hear HIM_HER_L snicker from above as I slide back to the ground!");
								array_push(_lines, "NAME and I play a game of hide and seek, it's much like that prop hunting game I recently saw... Needless to say, I lost this one embarassingly hard.");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I try to get some chatter going with NAME, but HE_SHE_L's looking away in embarassment while hiding HIS_HER_L privates...\nAh, bad time. Gotcha.");
						array_push(_lines, "I offer NAME some food from my stash, but HE_SHE_L doesn't dare get close... I think HE_SHE_L's thinking of something else to put in HIM_HER_L mouth!");
						array_push(_lines, "NAME blushes profusely and shuffles away when I try to sit next to HIM_HER_L. I think showing arousal is still a little scary!");
						array_push(_lines, "NAME is clearly horny, so I get bold and show HIM_HER_L my dick. HE_SHE gasps and hides HIS_HER_L face in embarassment before turning away! Little too soon, almost there...");
						array_push(_lines, "I try to make some naughty talk with NAME and compliment HIM_HER_L on HIM_HER_L attractiveness! HE_SHE's still VERY shy about the attention, but secretly enjoys it!");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I can clearly see NAME is trying HIS_HER_L best to hide a serious erection, so I decide to cut HIM_HER_L some slack and not get pushy!");
							array_push(_lines, "My dick is starting to get hard at the sight of NAME's poorly concealed erection. HE_SHE notices the scent of my throbbing erection and blushes profusely!");
						}
						else 
						{
							array_push(_lines, "I can clearly see a droplets of fluid trailing behind NAME,\nso I decide to cut HIM_HER_L some slack and not get pushy!");
							array_push(_lines, "My dick is starting to get hard at the sight of NAME's poorly concealed swolen pussy. HE_SHE notices the scent of my throbbing erection and blushes profusely!");
						}
					}	
				break;
				
				case AFFECTION_LEVEL.MEDIUM:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I talk to NAME in an excited tone and it's rubbing off on HIM_HER_L! HE_SHE looks at me like a puppy waiting for me to throw a stick.");
						array_push(_lines, "I offer NAME my hand and HE_SHE_L immediately recognizes my scent. HE_SHE smiles at me and makes happy vocalizations!");
						array_push(_lines, "NAME and I sit down next to the water together, after which HE_SHE_L starts leaning against me... It's very cute, almost romantic even!");
						array_push(_lines, "I play some games on my portable console and let NAME watch. HE_SHE doesn't really understand the game, but HIS_HER_L eyes are darting around the screen!");
						array_push(_lines, "I get two berries from my stash and share a quick snack with NAME. Eating food together is such a primitive but effective way to bond!");
						array_push(_lines, "There's this stupid song that I can't get out of my head, so I start singing it. Despite not being an great singer, NAME joins in... It's adorable!");
						array_push(_lines, "I lower to NAME's eye level and ask HIM_HER_L how HE_SHE_L's doing. HE_SHE gives a happy chirp and licks my face!");			
						array_push(_lines, "NAME looks at me with big eyes, so I give HIM_HER_L a big hug. HE_SHE's a bit taken aback, but enjoys it and leans into me!");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "I try to talk to NAME, but another 'Mon caught HIS_HER_L attention and HE_SHE_L starts playing with them instead...\nI don't mind though, it's great to see them all get along!");
							array_push(_lines, "I get other 'Mons at my camp together and play improv soccer with them. NAME and I are a team and we have a blast just chasing the ball!");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME and I play-wrestle for a bit and knock over some stuff in the process... We both laugh and roll around some more!");
							array_push(_lines, "NAME seems to have a lot of excess energy, so I train with HIM_HER_L for a bit! Humans are no match for 'Mons, but it's great exercise to just spar!");
							array_push(_lines, "I have some real talk with NAME and tell HIM_HER_L how much I appreciate HIM_HER_L. HE_SHE bashfully gloats and looks like HE_SHE_L will remember that compliment forever!");
						}
						else 
						{
							array_push(_lines, "NAME and I have an extensive grooming session and I use some 'Mon-friendly product to make HIM_HER_L gleam. HE_SHE's incredibly thankful and relaxed now!");
							array_push(_lines, "I put some music on speaker and NAME seems to really enjoy listening to it! Females just seem to love music, it might have some evolutionary reason.");
							array_push(_lines, "I swoon over and worship NAME over how gorgeous HE_SHE_L is. HE_SHE smiles and blushes like crazy, putting HIM_HER_L paw on my mouth to stop!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I ask NAME for some help with re-freezing my cool box, and HE_SHE_L obliges. HE_SHE looks proud and I've got cool drinks again!");
								array_push(_lines, "I get some snow NAME sneezed up earlier and throw a snowball at HIM_HER_L. HE_SHE looks shocked, but then smirks and proceeds to kick my ass in a snow fight!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME stares at my portable speaker and looks at me with puppy eyes... I turn the thing on, put on a playlist and dance to a few songs with HIM_HER_L! ");
								array_push(_lines, "I find a stick from the woods and challenge NAME to a swordfight! HE_SHE accepts and proceeds to kick my ass at it... The bruises were worth the fun!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I get a ball from my tent and NAME gets excited!\nWe kick the ball back and forth, HE_SHE_L's shockingly good at keeping posession of the ball and aiming HIS_HER_L shots!");
								array_push(_lines, "NAME seems hot and sweaty, so I take off my pants and offer to do a pants-less afternoon! HE_SHE flusters, but joins in and enjoys some open nudity with me!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I offer NAME to train together and HE_SHE_L hesitantly agrees! We trade held-back punches and kicks, but it's obvious I don't stand a chance. NAME treats my injuries after!");
								array_push(_lines, "NAME and I sit down to meditate at the pond together. We share a nice moment of quiet, and we can feel our auras meld intimately! It makes NAME blush profusely...");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I challenge NAME to a game of cops and robbers:\nI let HIM_HER_L keep berries HE_SHE_L steals if HE_SHE_L can get past me untouched! HE_SHE's quite fast and keeps winning though...");
								array_push(_lines, "NAME and I continue our habit of sweeping the camping grounds together and playfully whip some sand at each other! It's a very fun pastime.");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "I give NAME a ball of red yarn for the occasion a one would show up, HE_SHE_L starts playing with it immediately! They're not really feline, but NAMEes love this stuff.");
								array_push(_lines, "I get a fantasy book I've been reading from my tent and narrate for NAME while HE_SHE_L lays on my lap. HE_SHE pays close attention at first, but starts nodding off after a while!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "NAME and I try to climb a nearby tree for fun, but HE_SHE_L's way better at it than me... I can hear HIM_HER_L snicker from above as I slide back to the ground!");
								array_push(_lines, "NAME and I play a game of hide and seek, it's much like that prop hunting game I recently saw... Needless to say,\nI lost this one embarassingly hard.");
								if(_mon_count > 2)
									array_push(_lines, "NAME and I help resolve some petty fights and groom other 'Mons together. It's almost as if we're parents, it gives me a strange sense of butterflies in my stomach!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I try to chatter with NAME, but HIS_HER_L genitals are making it hard to maintain eye contact while HE_SHE_L's turned on... HE_SHE notices and tries to hide a chuckle!");
						array_push(_lines, "I notice NAME is aroused, so I'm taking the opportunity to give HIM_HER_L a steamy bath! I get to scrub and clean ALL HIS_HER_L parts... It's VERY intimate and HE_SHE_L loves it! ");
						array_push(_lines, "I inspect NAME's enraged privates and try some dirty talk on HIM_HER_L... HE_SHE covers HIS_HER_L face in embarassment, but I can tell HE_SHE_L likes it!");
						array_push(_lines, "I ask NAME who's got HIM_HER_L all worked up and HE_SHE_L pouts in response! HE_SHE looks at me and then away in shame, which tells me all I need to know!");
						
						if(_mon_count > 2)
							array_push(_lines, "Another 'Mon beats me to the chase and takes NAME to a nearby bush! I spy on them and find HIM_HER_L receiving oral, it's making me very jealous...");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME is having a serious erection and seems restless to have something done about it. I know it's a little early, but maybe HE_SHE_L'll let me help HIM_HER_L out...");
							array_push(_lines, "I just can't resist NAME's hard dick and pretend I need check it for medical reasons. HE_SHE buys it and lets me feel it all over, it's making me feel a little evil!");
						}
						else 
						{
							array_push(_lines, "NAME seems to be seriously in heat and restless to have something done about it. I know it's a little early, but maybe HE_SHE_L'll let me help HIM_HER_L out...");
							array_push(_lines, "I can't just can't resist NAME's wet pussy and pretend I need check HIM_HER_L temp. HE_SHE buys it and lets me repeatedly slide a thermometer in it... I feel a little evil!");
						}
					}
				break;
				
				case AFFECTION_LEVEL.HIGH:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I greet NAME excitedly and chatter with HIM_HER_L a bit, HE_SHE_L loves it and tries to chatter back! I can't understand much of it, but HE_SHE_L's very excited regardless.");
						array_push(_lines, "I offer NAME my hand and HE_SHE_L immediately recognizes my scent. HE_SHE smiles at me and makes happy vocalizations!");
						array_push(_lines, "NAME and I sit down next to the water together, after which HE_SHE_L starts leaning against me and puts HIS_HER_L paw on my hand... It's very romantic and cute!");
						array_push(_lines, "I tell NAME HE_SHE_L looks beautiful today and give HIM_HER_L a peck on HIS_HER_L forehead! HE_SHE blushes profusely and gives me a lick back!");
						array_push(_lines, "There's this stupid song that I can't get out of my head, so I start singing it. Despite not being an great singer, NAME joins in... It's adorable!");
						array_push(_lines, "I lower to NAME's eye level and ask HIM_HER_L how HE_SHE_L's doing. HE_SHE makes an affirming noise and rubs HIM_HER_Lself against me!");		
						array_push(_lines, "NAME comes up close to me and I give HIM_HER_L a big hug. HE_SHE smiles and holds onto me to HIS_HER_L best ability!");
						array_push(_lines, "I lay down in the grass with NAME for a while as we look at the clouds together. I point out some that looks like certain things, it makes HIM_HER_L giggle!");
						array_push(_lines, "NAME and I play a game of tag! HE_SHE_L's very fast, but I eventually catch HIM_HER_L and we tumble on the ground... We burst into laughter and dust ourselves off!");		
						array_push(_lines, "I get two berries from my stash and share a quick snack with NAME. Eating food together is such a primitive but effective way to bond!");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "I try to talk to NAME, but another 'Mon caught HIS_HER_L attention and HE_SHE_L starts playing with them instead... I don't mind though, it's great to see them all get along!");
							array_push(_lines, "I get other 'Mons at my camp together and play improv soccer with them. NAME and I are a team and we have a blast just chasing the ball!");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME and I play-wrestle for a bit and knock over some stuff in the process... We both laugh and roll around some more!");
							array_push(_lines, "NAME seems to have a lot of excess energy, so I train with HIM_HER_L for a bit! Humans are no match for 'Mons, but it's great exercise to just spar!");
							array_push(_lines, "I have some real talk with NAME and tell HIM_HER_L how much I appreciate HIM_HER_L. HE_SHE bashfully gloats and looks like HE_SHE_L will remember that compliment forever!");
							
							if(_mon_count > 2)
								array_push(_lines, "NAME and I sit back and look at the other 'Mons, playing a game of 'smash or pass'. We enjoy a bit of guy talk and feel a real sense of brothership!");
						}
						else 
						{
							array_push(_lines, "NAME and I have an extensive grooming session and I use some 'Mon-friendly product to make HIM_HER_L gleam. HE_SHE's incredibly thankful and relaxed now!");
							array_push(_lines, "I put some music on speaker and NAME seems to really enjoy listening to it! Females just seem to love music, it might have some evolutionary reason.");
							array_push(_lines, "I swoon over and worship NAME over how gorgeous HE_SHE_L is. HE_SHE smiles and blushes like crazy, putting HIM_HER_L paw on my mouth to stop!");
							
							if(_mon_count > 2)
								array_push(_lines, "NAME and I sit back and look at the other 'Mons, sharing which ones we're hot for!. We enjoy a bit of girl talk and feel a real sense of connection!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I ask NAME if HE_SHE_L wants to build a snowman and HE_SHE_L excitedly blasts snow everywhere! I roll the big parts and NAME does the head... I'd say we did a good job!");
								array_push(_lines, "I get some snow NAME sneezed up earlier and throw a snowball at HIM_HER_L. HE_SHE looks shocked, but then smirks and proceeds to kick my ass in a snow fight!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME stares at my portable speaker and looks at me with puppy eyes... I turn the thing on, put on a playlist and dance to a few songs with HIM_HER_L! ");
								array_push(_lines, "I remember I brought this fictional spellbook I borrowed and study it with NAME. We play pretend wizards, but NAME ACTUALLY manages to pulls off a few fire spells!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I get my phone and put on a soccer match that's currently live, NAME watches is religiously... We chat about what's happening and cheer whenever a goal is made!");
								array_push(_lines, "NAME seems hot and sweaty, so I take off my pants and offer to do a pants-less afternoon! HE_SHE flusters, but joins in and enjoys some open nudity with me!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I offer NAME to train together and HE_SHE_L hesitantly agrees! We trade held-back punches and kicks, but it's obvious I don't stand a chance. NAME treats my injuries after!");
								array_push(_lines, "NAME and I communicate better physically, so I put on a yoga workout tape on my phone and do a 20 minute session with HIM_HER_L! It's a very relaxing shared experience.");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I challenge NAME to a game of cops and robbers: I let HIM_HER_L keep the berries HE_SHE_L steals if HE_SHE_L can get past me untouched! HE_SHE's quite fast and keeps winning though...");
								array_push(_lines, "I try to chatter with NAME for a bit, but HE_SHE_L's too energetic! We just end up play-wrestling a bit and I get a few light bite marks out of it. Good fun!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME seems more interested in playing rather than talking, so I get a feather-like string toy from my tent and play with HIM_HER_L! Man, NAMEes really are just fire cats...");
								array_push(_lines, "I get a fantasy book I've been reading from my tent and narrate for NAME while HE_SHE_L lays on my lap. HE_SHE pays close attention at first, but starts nodding off after a while!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "NAME and I talk about stuff to do and we're feeling a little mischievous. We go to a nearby route and prank some unsuspecting travelers with NAME's illusions!");
								array_push(_lines, "NAME and I play a game of hide and seek, it's much like that prop hunting game I recently saw... Needless to say, I lost this one embarassingly hard.");
								if(_mon_count > 2)
									array_push(_lines, "NAME and I help resolve some petty fights and groom other 'Mons together. It's almost as if we're parents, it gives me a strange sense of butterflies in my stomach!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I try to chatter with NAME, but HIS_HER_L genitals are making it hard to maintain eye contact while HE_SHE_L's turned on... HE_SHE notices and tries to hide a chuckle!");
						array_push(_lines, "I notice NAME is aroused, so I'm taking the opportunity to give HIM_HER_L a steamy bath! I get to scrub and clean ALL HIS_HER_L parts... It's VERY intimate and HE_SHE_L loves it! ");
						array_push(_lines, "NAME notices HE_SHE_L gave me an erection and blushes, pawing at it to tell me HE_SHE_L's into it! I rub it against HIM_HER_L body while I dirty talk with HIM_HER_L a bit!");
						array_push(_lines, "I compliment NAME on HIS_HER_L hot physique and say some naughty things to make HIM_HER_L blush. HE_SHE swoons over me as well and non-verbally returns the compliment!");
						array_push(_lines, "I try to think of stuff to say or things to do with NAME, but I can only think about fucking HIM_HER_L senseless and blasting a fat load inside HIM_HER_L...");
						
						if(_mon_count > 2)
							array_push(_lines, "Another 'Mon from my camp notices NAME being in heat and hits it off with HIM_HER_L right in front of me! I watch and touch myself... They don't seem to mind!");
									
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME is having a throbbing erection again and seems desperate to release... I think HE_SHE_L's more interested in physical intimacy than words right now!");
							array_push(_lines, "I'm simply too distracted by NAME's taunting erection to think of anything to say or do, other than breeding until we pass out!");
						}
						else 
						{
							array_push(_lines, "NAME seems to be in serious heat again and seems desperate to release... I think HE_SHE_L's more interested in physical intimacy than words right now!");
							array_push(_lines, "I'm simply too distracted by NAME's taunting wet vulva to think of anything to say or do, other than breeding until we pass out!");
						}
					}
				break;
				
				case AFFECTION_LEVEL.MAX:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I greet NAME excitedly and chatter with HIM_HER_L a bit, HE_SHE_L loves it and tries to chatter back! I can't understand much of it, but HE_SHE_L's very excited regardless.");
						array_push(_lines, "I offer NAME my hand and HE_SHE_L immediately recognizes my scent. HE_SHE smiles at me and makes happy vocalizations!");
						array_push(_lines, "NAME and I sit down next to the water together, after which HE_SHE_L starts leaning against me and puts HIS_HER_L paw on my hand... It's very romantic and cute!");
						array_push(_lines, "I tell NAME HE_SHE_L looks beautiful today and give HIM_HER_L a peck on HIS_HER_L forehead! HE_SHE blushes profusely and gives me a lick back!");
						array_push(_lines, "There's this stupid song that I can't get out of my head, so I start singing it. Despite not being an great singer, NAME joins in... It's adorable!");
						array_push(_lines, "I lower to NAME's eye level and ask HIM_HER_L how HE_SHE_L's doing. HE_SHE makes an affirming noise and rubs HIM_HER_Lself against me!");		
						array_push(_lines, "NAME comes up close to me and I give HIM_HER_L a big hug. HE_SHE smiles and holds onto me to HIS_HER_L best ability!");
						array_push(_lines, "I lay down in the grass with NAME for a while as we look at the clouds together. I point out some that looks like certain things, it makes HIM_HER_L giggle!");
						array_push(_lines, "NAME and I play a game of tag! HE_SHE_L's very fast, but I eventually catch HIM_HER_L and we tumble on the ground... We burst into laughter and dust ourselves off!");		
						array_push(_lines, "I get two berries from my stash and share a quick snack with NAME. Eating food together is such a primitive but effective way to bond!");
						array_push(_lines, "NAME and I reminisce of when we just met, HE_SHE_L was so sceptical of me at first! I do most the talking, but it's a lovely moment regardless.");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "I try to talk to NAME, but another 'Mon caught HIS_HER_L attention and HE_SHE_L starts playing with them instead... I don't mind though, it's great to see them all get along!");
							array_push(_lines, "I get other 'Mons at my camp together and play improv soccer with them. NAME and I are a team and we have a blast just chasing the ball!");
							array_push(_lines, "To celebrate our time together, NAME and I organize a big feast by the campfire with everyone! There's food, music and fun... This is what I do it for!");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME and I play-wrestle for a bit and knock over some stuff in the process... We both laugh and roll around some more!");
							array_push(_lines, "NAME seems to have a lot of excess energy, so I train with HIM_HER_L for a bit! Humans are no match for 'Mons, but it's great exercise to just spar!");
							array_push(_lines, "I have some real talk with NAME and tell HIM_HER_L how much I appreciate HIM_HER_L. HE_SHE bashfully gloats and looks like HE_SHE_L will remember that compliment forever!");
							
							if(_mon_count > 2)
								array_push(_lines, "NAME and I sit back and look at the other 'Mons, playing a game of 'smash or pass'. We enjoy a bit of guy talk and feel a real sense of brothership!");
						}
						else 
						{
							array_push(_lines, "NAME and I have an extensive grooming session and I use some 'Mon-friendly product to make HIM_HER_L gleam. HE_SHE's incredibly thankful and relaxed now!");
							array_push(_lines, "I put some music on speaker and NAME seems to really enjoy listening to it! Females just seem to love music, it might have some evolutionary reason.");
							array_push(_lines, "I swoon over and worship NAME over how gorgeous HE_SHE_L is. HE_SHE smiles and blushes like crazy, putting HIM_HER_L paw on my mouth to stop!");
							
							if(_mon_count > 2)
								array_push(_lines, "NAME and I sit back and look at the other 'Mons, sharing which ones we're hot for!. We enjoy a bit of girl talk and feel a real sense of connection!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I ask NAME if HE_SHE_L wants to build a snowman and HE_SHE_L excitedly blasts snow everywhere! I roll the big parts and NAME does the head... I'd say we did a good job!");
								array_push(_lines, "I get some snow NAME sneezed up earlier and throw a snowball at HIM_HER_L. HE_SHE looks shocked, but then smirks and proceeds to kick my ass in a snow fight!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME stares at my portable speaker and looks at me with puppy eyes... I turn the thing on, put on a playlist and dance to a few songs with HIM_HER_L! ");
								array_push(_lines, "I remember I brought this fictional spellbook I borrowed and study it with NAME. We play pretend wizards, but NAME ACTUALLY manages to pulls off a few fire spells!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I get my phone and put on a soccer match that's currently live, NAME watches is religiously... We chat about what's happening and cheer whenever a goal is made!");
								array_push(_lines, "NAME seems hot and sweaty, so I take off my pants and offer to do a pants-less afternoon! HE_SHE flusters, but joins in and enjoys some open nudity with me!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I offer NAME to train together and HE_SHE_L hesitantly agrees! We trade held-back punches and kicks, but it's obvious I don't stand a chance. NAME treats my injuries after!");
								array_push(_lines, "NAME and I communicate better physically, so I put on a yoga workout tape on my phone and do a 20 minute session with HIM_HER_L! It's a very relaxing shared experience.");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I challenge NAME to a game of cops and robbers: I let HIM_HER_L keep the berries HE_SHE_L steals if HE_SHE_L can get past me untouched! HE_SHE's quite fast and keeps winning though...");
								array_push(_lines, "I try to chatter with NAME for a bit, but HE_SHE_L's too energetic! We just end up play-wrestling a bit and I get a few light bite marks out of it. Good fun!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME seems more interested in playing rather than talking, so I get a feather-like string toy from my tent and play with HIM_HER_L! Man, NAMEes really are just fire cats...");
								array_push(_lines, "I get a fantasy book I've been reading from my tent and narrate for NAME while HE_SHE_L lays on my lap. HE_SHE pays close attention at first, but starts nodding off after a while!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "NAME and I talk about stuff to do and we're feeling a little mischievous. We go to a nearby route and prank some unsuspecting travelers with NAME's illusions!");
								array_push(_lines, "NAME and I play a game of hide and seek, it's much like that prop hunting game I recently saw... Needless to say, I lost this one embarassingly hard.");
								if(_mon_count > 2)
									array_push(_lines, "NAME and I help resolve some petty fights and groom other 'Mons together. It's almost as if we're parents, it gives me a strange sense of butterflies in my stomach!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I try to chatter with NAME, but HIS_HER_L genitals are making it hard to maintain eye contact while HE_SHE_L's turned on... HE_SHE notices and tries to hide a chuckle!");
						array_push(_lines, "I notice NAME is aroused, so I'm taking the opportunity to give HIM_HER_L a steamy bath! I get to scrub and clean ALL HIS_HER_L parts... It's VERY intimate and HE_SHE_L loves it! ");
						array_push(_lines, "NAME notices HE_SHE_L gave me an erection and blushes, pawing at it to tell me HE_SHE_L's into it! I rub it against HIM_HER_L body while I dirty talk with HIM_HER_L a bit!");
						array_push(_lines, "I compliment NAME on HIS_HER_L hot physique and say some naughty things to make HIM_HER_L blush. HE_SHE swoons over me as well and non-verbally returns the compliment!");
						array_push(_lines, "I try to think of stuff to say or things to do with NAME, but I can only think about fucking HIM_HER_L senseless and blasting a fat load inside HIM_HER_L...");
						
						if(_mon_count > 2)
							array_push(_lines, "Another 'Mon from my camp notices NAME being in heat and hits it off with HIM_HER_L right in front of me! I watch and touch myself... They don't seem to mind!");
							array_push(_lines, "I'm not getting a chance to chat, NAME's heat attracted multiple other 'Mons and it devolves into a big animalistic orgy. I just sit back and knock one out instead!");
									
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME is having a throbbing erection again and seems desperate to release... I think HE_SHE_L's more interested in physical intimacy than words right now!");
							array_push(_lines, "I'm simply too distracted by NAME's taunting erection to think of anything to say or do, other than breeding until we pass out!");
						}
						else 
						{
							array_push(_lines, "NAME seems to be in serious heat again and seems desperate to release... I think HE_SHE_L's more interested in physical intimacy than words right now!");
							array_push(_lines, "I'm simply too distracted by NAME's taunting wet vulva to think of anything to say or do, other than breeding until we pass out!");
						}
					}
				break;
			}
		break;
		
		case TEXT_PROMPT_TYPE.EXAMINE:
			switch(_affection_level)
			{
				case AFFECTION_LEVEL.NEW:
					// Regular
					array_push(_lines, "NAME is looking around somewhat restlessly...");
					array_push(_lines, "NAME seems content to hang out at the camp, but HE_SHE_L's still very suspicious of me.");
					array_push(_lines, "NAME doesn't seem very comfortable with me just yet... Maybe chatting a bit with HIM_HER_L would help?");
					array_push(_lines, "I'm not sure if HE_SHE_L will let me, but maybe I can warm NAME up to me by petting HIM_HER_L...");
					array_push(_lines, "It's very obvious NAME is still a wild 'Mon, HE_SHE_L needs a lot more time before I can mate HIM_HER_L...");
					array_push(_lines, "NAME needs a lot more time to adjust. Interacting with HIM_HER_L a bit now and then should help!");
					
					if(_mon_count > 2)
						array_push(_lines, "NAME has gotten proposals to play from the other 'Mons, but HE_SHE_L's snarling all of them away!");
						array_push(_lines, "NAME is acting restless around the other 'Mons,\nmaybe I can confide HIM_HER_L in me first by interacting with HIM_HER_L\na bit more.");
					
					// Gendered
					if(_gender == GENDERS.M) 
					{
						array_push(_lines, "NAME is acting quite stand-offish towards me. It's not unusual for males to exhibit this behavior, I need to earn HIS_HER_L respect before doing anything with HIM_HER_L.");
						array_push(_lines, "I can't help but glance at NAME's shaft and balls between HIS_HER_L legs, but HE_SHE_L gives me a VERY angry look when HE_SHE_L catches me staring...");
					}
					else 
					{
						array_push(_lines, "NAME is showing me a pretty vain attitude... This happens often with females, it's because HE_SHE_L doesn't consider me worthy of HIM_HER_L attention yet.");
						array_push(_lines, "I can't help but glance at NAME's pussy between HIM_HER_L legs, but HE_SHE_L gives me a VERY angry look when HE_SHE_L catches me staring...");
					}
					
					// Species Specific
					switch(_species)
					{
						case SPECIES.ALOLANVULPIX:
							array_push(_lines, "Poetically, NAME are know for initially showing a cold demeanor towards humans. This one's no exception...\nHowever, when they warm up they become mates for life!");
							array_push(_lines, "NAME blows ice cold snow in my face whenever I get too close to HIM_HER_L... Yep, needs more time.");
							array_push(_lines, "I'm surprised I lured an NAME around these parts. Their cold insides provide an AMAZING experience when you fuck them... Can't wait until HE_SHE_L's ready.");
						break;
						case SPECIES.BRAIXEN:
							array_push(_lines, "I definitely know what people mean with NAME generally having a fiery temper at first... HE_SHE scolds me constantly!");
							array_push(_lines, "NAME is sitting alone on a treestump, drawing some scribbles in the sand with HIS_HER_L stick. Maybe I should go chat a bit with HIM_HER_L.");
							array_push(_lines, "NAME are somewhat common around these woods. I've had sex with them before, something about their charismatic energy is so incredibly captivating...");
						break;
						case SPECIES.CINDERACE:
							array_push(_lines, "The way NAME behaves reminds me of a high school sports jock... I'm gonna need to soften HIM_HER_L up to me if I don't want to get bullied!");
							array_push(_lines, "NAME is trying to keep a pebble high with HIS_HER_L feet, HE_SHE_L looks a little bored... Maybe I should go and hang out\nwith HIM_HER_L or something.");
							array_push(_lines, "NAME used to be rare in the wild, but their numbers spiked due to breeding. I don't mind though, the way their 'pants' can undo makes them VERY attractive to humans...");
						break;
						case SPECIES.LUCARIO:
							array_push(_lines, "NAME can sense the auras of 'Mons and humans, it's like a less accurate form of telepathy. HE_SHE's giving me the stink eye when dirty thoughts about HIM_HER_L pop up...");
							array_push(_lines, "NAME is acting quite territorial, which is normal for them. It does mean HE_SHE_L doesn't trust me yet though, I should take it easy with HIM_HER_L and show I'm no threat.");
							array_push(_lines, "NAME are quite rare, especially in the wild! Such a shame, they make for amazing sexual partners. They can use their aura to share their own pleasure with you!");
						break;
						case SPECIES.NICKIT:
							array_push(_lines, "NAMEs are known for being little thieves, I already caught HIM_HER_L stealing from my tent... It's a sign HE_SHE_L doesn't respect me yet, I should interact with HIM_HER_L more.");
							array_push(_lines, "NAME is sniffing around the campsite, looking for stuff to store in HIS_HER_L big tail. Maybe by interacting with HIM_HER_L I can distract HIM_HER_L from stealing my stuff...");
							array_push(_lines, "NAMEs are super common in these woods, but that doesn't make them any less fun! I love having angry sex with them as punishment for stealing my shit...");
						break;
						case SPECIES.VULPIX:
							array_push(_lines, "NAME are known for being vain and skittish in the wild, but they can become very faithful mates if given time. This one? Yeah, definitely still vain.");
							array_push(_lines, "NAME is spewing cinders at the grass in boredom...\nI should distract HIM_HER_L with some attention before my camp goes up in flames.");
							array_push(_lines, "NAME are common around here and a personal favourite of mine! Their internal body heat always makes me cum almost instantly, it's like they're MADE to be fucked...");
						break;
						case SPECIES.ZOROARK:
							array_push(_lines, "Wow, a NAME! Never thought I'd find one, they are masters at hiding where they live. They can be dangerous though, I should approach this one with caution.");
							array_push(_lines, "NAME is trying to untangle some of the clumps that formed in HIS_HER_L hair, but to little avail. Maybe I can earn HIM_HER_L trust by helping out?");
							if(_gender == GENDERS.F)
								array_push(_lines, "It's weird seeing a female NAME without HIM_HER_L young.\nLikely means HE_SHE_L's a virgin, which is turning me on...\nI'd gladly help put some kids inside HIM_HER_L!");
							else
								array_push(_lines, "It's weird seeing a male NAME without HIS_HER_L mate.\nLikely means HE_SHE_L's a virgin, which is turning me on...\nI'd gladly help HIM_HER_L get HIS_HER_L dick wet!");
						break;
					}
				break;
				
				case AFFECTION_LEVEL.LOW:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "NAME seems to have warmed up to me a bit!\nHE_SHE accepts me now, but I shouldn't push HIM_HER_L too hard.");
						array_push(_lines, "NAME has gotten comfortable enough to not cover up their privates anymore. I can't help but look...");
						array_push(_lines, "I'm making progress in earning NAME's trust!\nI should keep doing what I'm doing and slowly build up to more intimate stuff.");
						array_push(_lines, "I can tell it's too early to get intimate with NAME, but I can probably start getting HIM_HER_L used to sharing HIS_HER_L body with me!");
						array_push(_lines, "NAME seems pretty at ease, but still gets a little antsy when I get too close.");
						array_push(_lines, "NAME is showing initiative in coming to me instead now, but HE_SHE_L's still a little wary of me.");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "NAME has gotten friendlier with the other 'Mons. HE_SHE's starting to feel comfortable around this place!");
							array_push(_lines, "I've seen NAME start hanging out with the others, it's a good sign HE_SHE_L's building trust!");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME isn't nearly as hostile anymore and seems to feel respected by me. It's incredibly important to make males feel respected! ");
							array_push(_lines, "Now that HE_SHE_L's not covering up anymore, I can get a way better look at NAME's shaft, balls and ass.\nIt's incredibly hypnotizing to watch...");
							array_push(_lines, "I'm starting to have thoughts about jerking off NAME's dick and having HIM_HER_L cum HIS_HER_L cute little nuts empty.\nNeed to resist the urge a little longer...");
						}
						else 
						{
							array_push(_lines, "NAME is getting more curious of scent and changed HIM_HER_L attitude significantly. I'm slowly starting to become worthy of HIM_HER_L attention!");
							array_push(_lines, "Now that HE_SHE_L's not covering up anymore, I can get a way better look at NAME's cute pussy and ass.\nIt's incredibly hypnotizing to watch...");
							array_push(_lines, "I'm starting to have thoughts about fingering NAME's cute little pussy and have HIM_HER_L orgasm until HIM_HER_L head spins. Need to resist the urge a little longer...");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "NAME has grown to trust me with fixing HIS_HER_L tail fur with a hairbrush. Very good progress!");
								array_push(_lines, "NAME still blows ice cold snow in my face whenever I get too close to HIM_HER_L... Tough crowd.");
								array_push(_lines, "I'm surprised I lured an NAME around these parts. Their cold insides provide an AMAZING experience when you fuck them... Can't wait until HE_SHE_L's ready!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME and I occasionaly get together for little dance performances now! We're not on hugging terms yet, but we're bonding rapidly!");
								array_push(_lines, "NAME is sitting alone on a treestump, drawing some scribbles in the sand with HIS_HER_L stick. Maybe I should go chat a bit with HIM_HER_L.");
								array_push(_lines, "NAME are somewhat common around these woods. I've had sex with them before, something about their charismatic energy is so incredibly captivating...");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I've been playing soccer with NAME a few times now and HE_SHE_L loves having a someone to play with! It's really speeding up bonding with HIM_HER_L.");
								array_push(_lines, "NAME is trying to keep a pebble high with HIS_HER_L feet, HE_SHE_L looks a little bored... Maybe I should go and hang out\nwith HIM_HER_L or something.");
								array_push(_lines, "NAME used to be rare in the wild, but their numbers spiked due to breeding. I don't mind though, the way their 'pants' can undo makes them VERY attractive to humans...");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "NAME can sense the auras of 'Mons and humans, it's like a less accurate form of telepathy. HE_SHE's giving me the stink eye when dirty thoughts about HIM_HER_L pop up...");
								array_push(_lines, "I've been continuing to meditate so NAME can attune to me, HE_SHE_L's joined in a few times now! I'm no NAME, but I can kind of feel our auras starting to play nice!");
								array_push(_lines, "NAME are quite rare, especially in the wild! Such a shame, they make for amazing sexual partners. They can use their aura to share their own pleasure with you!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "NAME has started helping out with cleaning up and sweeping around the campsite. Doing chores together is a fun way to bond, and the help is appreciated!");
								array_push(_lines, "NAME is sniffing around the campsite, looking for stuff to store in HIS_HER_L big tail. Maybe by interacting with HIM_HER_L I can distract HIM_HER_L from stealing my stuff...");
								array_push(_lines, "NAMEs are super common in these woods, but that doesn't make them any less fun! I love having angry sex with them as punishment for stealing my shit...");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME has recently shown a tendency to sit on my lap when I pull out the comfy blanket. Taking naps together has been a great bonding experience!");
								array_push(_lines, "NAME is spewing cinders at the grass in boredom...\nI should distract HIM_HER_L with some attention before my camp goes up in flames.");
								array_push(_lines, "NAME are common around here and a personal favourite of mine! Their internal body heat always makes me cum almost instantly, it's like they're MADE to be fucked...");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "Still can't believe I found a NAME, they are masters at hiding their habitat. They can be dangerous though, I should approach this one with caution.");
								array_push(_lines, "I didn't expect NAME to get along so well with the other 'Mons, it seems to take a kind of nurturing position towards them, it's very cute!");
								if(_gender == GENDERS.F)
									array_push(_lines, "It's weird seeing a female NAME without HIM_HER_L young.\nLikely means HE_SHE_L's a virgin, which is turning me on...\nI'd gladly help put some kids inside HIM_HER_L!");
								else
									array_push(_lines, "It's weird seeing a male NAME without HIS_HER_L mate.\nLikely means HE_SHE_L's a virgin, which is turning me on...\nI'd gladly help HIM_HER_L get HIS_HER_L dick wet!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "Now that the edge is off for NAME, I've noticed HIM_HER_L displaying signs of arousal around the camp. Looks like it's happening again, poor thing must be pent up!");
						array_push(_lines, "NAME is trying to act like nothing's up, but HE_SHE_L's covering HIS_HER_L genitals while blushing. Terrible attempt at hiding arousal, but very cute regardless.");
						array_push(_lines, "It's obvious NAME is struggling with some hormones...\nMaybe now's my chance to get HIM_HER_L more comfortable showing HIM_HER_Lself off!");
						array_push(_lines, "How cute, NAME is trying to hide the fact HE_SHE_L is horny! Maybe if I'm gentle about it I can ask HIM_HER_L to show me a little more...");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME is trying to hide an erection, but is doing a pretty bad job at it. I should exercise patience, but it's so tempting to indulge...");
							array_push(_lines, "I can occasionally peek behind NAME's cover and see HIS_HER_L erect penis, it's incredibly arousing!");
						}
						else 
						{
							array_push(_lines, "NAME is trying to hide HIM_HER_L swolen wet pussy, but is doing a pretty bad job at it. I should exercise patience, but it's so tempting to indulge...");
							array_push(_lines, "I can occasionally peek behind NAME's cover and see HIM_HER_L wet pussy, it's incredibly arousing!");
						}
					}
				break;
				
				case AFFECTION_LEVEL.MEDIUM:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "NAME and I have grown really fond of eachother! HE_SHE excitedly greets me whenever we cross paths, which is quite often around here.");
						array_push(_lines, "I've made a lot of progress in earning NAME's trust, HE_SHE_L's gotten pretty comfortable being intimate with me!\nMaybe we can take things a little further...?");
						array_push(_lines, "I can tell NAME is starting to see me as a potential mate... A little more patience and HE_SHE_L'll be ready to breed with me, I can't wait!");
						array_push(_lines, "I rarely have to call NAME over anymore, HE_SHE_L just comes to me instead now!");
						array_push(_lines, "NAME seems really happy to spend time at my camp and has grown to really like me! The feeling is mutual, it's so wonderful to bond with 'Mons like HIM_HER_L.");
						array_push(_lines, "NAME and I have become good friends, and we're not shy about being a bit intimate anymore either! I think we're ready to spice things up a bit...");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "I've caught NAME secretly getting off with another 'Mon, it was so hot to just watch them go at it! I wonder if I can convince HIM_HER_L to let ME get HIM_HER_L off as well...");
							array_push(_lines, "NAME has gotten a lot more attention from the other 'Mons lately, I think they're after the same thing...");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME used to still stand HIS_HER_L ground towards me as another male, but HE_SHE_L's getting increasingly respectful and affectionate towards me!");
							array_push(_lines, "I get an unobstructed view of NAME's shaft, balls and hole by default now, it's getting incredibly hard to ignore... Maybe I can try stuff once HE_SHE_L's aroused enough!");
						}
						else 
						{
							array_push(_lines, "NAME definitely deems me worthy of HIM_HER_L attention now, HE_SHE_L's asking for it constantly. HE_SHE's such a sweet girl!");
							array_push(_lines, "I get an unobstructed view of NAME's pussy and ass by default now, it's getting incredibly hard to ignore...\nMaybe I can try stuff once HE_SHE_L's aroused enough!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "NAME has become quite affectionate towards me! It's a rare feat for their kind to bond with humans, they usually live in secluded mountain areas.");
								array_push(_lines, "NAME is displaying signs of seeing me as a potential mate, you can tell from their posture and the way they start swaying their big white tails when they walk!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME has become very prolific at hugging me and dragging me off to show things! It's incredibly cute.");
								array_push(_lines, "It's becoming increasingly obvious that NAME has a crush on me! HIM_HER species shows signs of attraction very similarly to humans, but with more energy and excitement.");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "NAME has started to really look out for me! HE_SHE's like my team captain, HE_SHE_L often brings food and water to make sure I stay healthy and content. It's incredibly sweet!");
								array_push(_lines, "Playing ball with NAME has started to get more and more intense! NAME show affection primarily through play, so I'm pretty sure HE_SHE_L's into me...");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "Me and NAME have started to form a really strong bond, it feels like such an honor for a NAME to respect you like this! Lucarios are known for being quite judgemental.");
								array_push(_lines, "Meditation sessions have become a frequent pastime for me and NAME. I imagine jamming with a band gives a similar non-verbal sensation, it's a very special feeling!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "NAME has actually made me look forward to sweeping and cleaning up the campsite! The way HE_SHE_L helps out with chores is so cute, I could watch it for hours...");
								array_push(_lines, "NAME has started to bring me little gifts from the forest!\nI always fear they haven't been obtained ethically, but this behavior is a pretty clear sign a NAME really likes you!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME has started to sneak into my tent at night to lay together with me on my comfy bed! HE_SHE's just like a cat, and HE_SHE_L's so warm... I absolutely love it.");
								array_push(_lines, "NAME has started to help out with maintaining the campfire more often. NAMEes are normally pretty lazy,\nso HIM_HER_L putting in the effort like that is a sign of respect!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "NAME has started to act kind of like a parent to me and the other 'Mons! HE_SHE grooms us, snarls to stop fights and helps me do the cooking. Such a misunderstood species!");
								array_push(_lines, "I've gotten to the point where I'm allowed to take naps on NAME's hair! It's so incredibly soft and comforting, it makes me feel like a sleepy little Zorua...");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "NAME is aroused again, it's been happening a lot more frequently lately. It's too soon for breeding, but I could help the poor thing release some steam!");
						array_push(_lines, "NAME isn't even hiding HIS_HER_L arousal anymore, my underwear is stained with precum because of it... HE_SHE's almost ready to breed, just a little longer!");
						array_push(_lines, "It's so strangely personal and genuine to be around 'Mons who are okay with seeing each other's junk and arousal! It's a big reason I like being a nudist around my campsite.");
						array_push(_lines, "NAME seems to have REALLY taken a liking to me... 'Mons being cool with you staring at their 'activated' privates is a sign of substantial trust!");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME isn't even hiding HIS_HER_L erections anymore, HE_SHE_L's become very comfortable with me seeing them!");
							array_push(_lines, "It's becoming increasingly hard to contain myself with NAME having HIS_HER_L hard dick out like that... I want to stroke and suck it off SO bad...");
						}
						else 
						{
							array_push(_lines, "NAME isn't even hiding HIM_HER_L in-heat pussy anymore, HE_SHE_L's become very comfortable with me seeing it!");
							array_push(_lines, "It's becoming increasingly hard to contain myself with NAME having HIM_HER_L tender holes out like that... I want to finger and tongue fuck them SO bad...");
						}
					}
				break;
				
				case AFFECTION_LEVEL.HIGH:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "Me and NAME have built an incredibly strong bond and we're comfortable doing anything in each other's presence now!");
						array_push(_lines, "NAME has started taking initiative in being intimate with me now. Occasionally HE_SHE_L'll rub against me or put HIS_HER_L paw on my body to ask for attention!");
						array_push(_lines, "I think it's safe to say NAME has finally accepted me as their mate, and we are ready to redeem the perks that come with that!");
						array_push(_lines, "NAME has grown very close to me, I think the last step in our relationship is ready to be sealed by breeding HIM_HER_L. I'm getting all worked up thinking about it!");
						array_push(_lines, "It hasn't been that long yet, but I already feel such an incredibly real connection with NAME. There's something so special about bonding with 'Mons like this!");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "I've caught NAME getting touchy with some of the other 'Mons more often as of late, it's so hot to peek in on it... HE_SHE just might be ready to give me a chance as well!");
							array_push(_lines, "NAME is on very good terms with the other 'Mons now, HE_SHE_L's built a lot of trust and affection with them!");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME has really turned from a stand-offish defiant male into a lap dog! We cuddle often and love to just hang out, there's incredible mutual respect!");
							array_push(_lines, "Ever since getting intimate with NAME I can't stop staring at HIS_HER_L shaft and balls... I've had a taste of them already, but I keep wanting more!");
						}
						else 
						{
							array_push(_lines, "NAME has really turned from a cold vain female into a cuddle bug! We groom and cuddle with each other often, it really feels like I'm HIM_HER_L mate!");
							array_push(_lines, "Ever since getting intimate with NAME I can't stop staring at HIM_HER_L pussy and rear... I've had a taste of them already, but I keep wanting more!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I can't believe how reluctant and vain NAME used to be when I see HIM_HER_L now... It's such a rewarding transformation to see!");
								array_push(_lines, "It's now pretty obvious NAME has accepted me as HIS_HER_L mate, which is a huge deal for HIS_HER_L species! I feel incredibly honored, rest assured we'll be mates for life!");
								array_push(_lines, "I've really fallen in love with NAME and can't wait to have some fun with HIM_HER_L... The cold tingling sensation of fucking one is so incredibly nice!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME is constantly excited to do things with me and lights up whever I'm near. I think HE_SHE_L's my biggest fan, it's incredibly flattering!");
								array_push(_lines, "I'm absolutely positively sure NAME is into me now, HE_SHE_L's asking for my attention constantly and holds my hand whenever HE_SHE_L can!");
								array_push(_lines, "I've really fallen in love with NAME's bubbly personality and I'm melting at the thought of slamming my fat dick inside such a charismatic sweetheart...");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "NAME is always really looking out for me! HE_SHE's like my team captain, HE_SHE_L often brings food and water to make sure I stay healthy and content. It's incredibly sweet!");
								array_push(_lines, "I play soccer with NAME pretty often now, but most of the time it just turns into wrestling, laughing and hanging out together. We've become true companions!");
								array_push(_lines, "I've really fallen in love with NAME and I'm SO tempted to just rip HIS_HER_L pants off, grab HIS_HER_L hips and fuck HIM_HER_L absolutely senseless...");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I can feel a strange warm feeling come over me when NAME comes up to me... I think that's HIS_HER_L way of saying HE_SHE_L loves me using telepathy!");
								array_push(_lines, "I've become so in tune with NAME, I actually feel like we can communicate non-verbally now! I don't really hear anything, but can understand NAME's thoughts somehow.");
								array_push(_lines, "I've really fallen in love with NAME, I get butterflies in my stomach thinking about feeling each other's auras while I make love to HIM_HER_L... It's such an intimate experience!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "NAME is definitely the most mischievous of the 'Mons I've had at my camp so far, but I can never stay mad at a face like that...");
								array_push(_lines, "One time, NAME left for a few hours and returned with a wedding ring of all things... I don't want to know where or how HE_SHE_L got it, but the gesture is clear!");
								array_push(_lines, "I've really fallen in love with NAME, the little troublemaker has poëtically stolen my heart... Though I can't wait to 'punish' HIM_HER_L for all the OTHER stuff HE_SHE_L's stolen!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME no longer has to sneak into my tent anymore, it's now normal for HIM_HER_L to sleep against my naked body during the night or naps. It's so incredibly cute and pleasant!");
								array_push(_lines, "I'm pretty sure I've fully earned NAME's respect, which is no small feat considering HIM_HER_L species' usually vain temper!");
								array_push(_lines, "I've really fallen in love with NAME, I feel like I can't sleep without HIS_HER_L soft warm body anymore! That, and I'm REALLY excited to stick my dick in it as well...");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I've gotten to the point where I'm allowed to sleep on NAME's hair during the night! It's so incredibly soft and comforting, it makes me feel like a sleepy little Zorua...");
								array_push(_lines, "NAME and I have basically become the unofficial parents of all 'Mons at the camp, it makes me feel so attracted to HIM_HER_L... It's a very fulfilling feeling!");
								array_push(_lines, "I've really fallen in love with NAME, HIS_HER_L parental nature and loving personality awaken a feeling inside me... I can't wait to take HIS_HER_L virginity, I'd have kids with HIM_HER_L if I could...");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I feel like I see NAME being aroused more often than not as of late, and all shame around it has dissipated completely. It's a sign of complete trust!");
						array_push(_lines, "I keep going hard over the sight of NAME strutting around aroused, genitals for the world to see... I sometimes secretly jerk off at the sight of it!");
						array_push(_lines, "The way NAME has been so open and intimate with me leads me to believe HE_SHE_L's ready to be bred by me. The anticipation is killing me, I think it's about time!");
						array_push(_lines, "We've made so much progress now and NAME is aroused around me so often... I should really seal the deal and fuck HIM_HER_L already!");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I'm going absolutely mad over the sight of NAME's hard dick and cute boy pussy... I need to empty my nuts inside HIM_HER_L pronto, I can't hold back anymore!");
							array_push(_lines, "I've fallen in love with NAME so bad that I've had dreams about HIS_HER_L delicious juicy cock and gorgeous ass... I'm craving for more, and I think HE_SHE_L does too!");
						}
						else 
						{
							array_push(_lines, "I'm going absolutely mad over the sight of NAME's soaking pussy and ass... I need to empty my nuts inside HIM_HER_L pronto, I can't hold back anymore!");
							array_push(_lines, "I've fallen in love with NAME so bad that I've had dreams about HIM_HER_L delicious pussy and gorgeous ass... I'm craving for more, and I think HE_SHE_L does too!");
						}
					}
				break;
				
				case AFFECTION_LEVEL.MAX:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I'm pretty sure I've maxed out my relationship with NAME, HE_SHE_L's totally comfortable with doing anything at any time now!");
						array_push(_lines, "NAME has started taking the initiative to be intimate with me ever since we mated. Occasionally HE_SHE_L'll try to undo my pants to send a message!");
						array_push(_lines, "I think it's safe to say NAME has finally accepted me as their mate, and we're ready to redeem the perks that come with that!");
						array_push(_lines, "NAME and I have fallen in love with each other, now it's time to enjoy what we've built up!");
						array_push(_lines, "It hasn't been that long yet, but I already feel such an incredibly real connection with NAME. There's something so special about bonding with 'Mons like this!");
					
						// If 2+ Other Mons Are Present
						if(_mon_count > 2)
						{
							array_push(_lines, "NAME is having sex with the other 'Mons regularly now, it's so hot to watch them breed together... Though it is making me a little jealous sometimes!");
							array_push(_lines, "The other 'Mons have grown to love NAME as much as I do, and the same goes for their unbridled lust for HIM_HER_L!");
						}
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME has really turned from a stand-offish defiant male into a lap dog! We cuddle often and love to just hang out, there's incredible mutual respect!");
							array_push(_lines, "Ever since mating with NAME I can't stop staring at HIS_HER_L shaft and balls... I've had a taste of them already, but I keep wanting more!");
						}
						else 
						{
							array_push(_lines, "NAME has really turned from a cold vain female into a cuddle bug! We groom and cuddle with each other often, it really feels like I'm HIM_HER_L mate!");
							array_push(_lines, "Ever since mating with NAME I can't stop staring at HIM_HER_L pussy and rear... I've had a taste of them already, but I keep wanting more!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I can't believe how reluctant and vain NAME used to be when I see HIM_HER_L now... It's such a rewarding transformation to see!");
								array_push(_lines, "It's now pretty obvious NAME has accepted me as HIS_HER_L mate, which is a huge deal for HIS_HER_L species! I feel incredibly honored, rest assured we'll be mates for life!");
								array_push(_lines, "I've really fallen in love with NAME and can't wait to have some fun with HIM_HER_L... The cold tingling sensation of fucking one is so incredibly nice!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "NAME is constantly excited to do things with me and lights up whever I'm near. I think HE_SHE_L's my biggest fan, it's incredibly flattering!");
								array_push(_lines, "I'm absolutely positively sure NAME is into me now, HE_SHE_L's asking for my attention constantly and holds my hand whenever HE_SHE_L can!");
								array_push(_lines, "I've really fallen in love with NAME's bubbly personality and I'm melting at the thought of slamming my fat dick inside such a charismatic sweetheart...");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "NAME is always really looking out for me! HE_SHE's like my team captain, HE_SHE_L often brings food and water to make sure I stay healthy and content. It's incredibly sweet!");
								array_push(_lines, "I play soccer with NAME pretty often now, but most of the time it just turns into wrestling, laughing and hanging out together. We've become true companions!");
								array_push(_lines, "I've really fallen in love with NAME and I'm SO tempted to just rip HIS_HER_L pants off, grab HIS_HER_L hips and fuck HIM_HER_L absolutely senseless...");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I can feel a strange warm feeling come over me when NAME comes up to me... I think that's HIS_HER_L way of saying HE_SHE_L loves me using telepathy!");
								array_push(_lines, "I've become so in tune with NAME, I actually feel like we can communicate non-verbally now! I don't really hear anything, but can understand NAME's thoughts somehow.");
								array_push(_lines, "I've really fallen in love with NAME, I get butterflies in my stomach thinking about feeling each other's auras while I make love to HIM_HER_L... It's such an intimate experience!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "NAME is definitely the most mischievous of the 'Mons I've had at my camp so far, but I can never stay mad at a face like that...");
								array_push(_lines, "One time, NAME left for a few hours and returned with a wedding ring of all things... I don't want to know where or how HE_SHE_L got it, but the gesture is clear!");
								array_push(_lines, "I've really fallen in love with NAME, the little troublemaker has poëtically stolen my heart... Though I can't wait to 'punish' HIM_HER_L for all the OTHER stuff HE_SHE_L's stolen!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME no longer has to sneak into my tent anymore, it's now normal for HIM_HER_L to sleep against my naked body during the night or naps. It's so incredibly cute and pleasant!");
								array_push(_lines, "I'm pretty sure I've fully earned NAME's respect, which is no small feat considering HIM_HER_L species' usually vain temper!");
								array_push(_lines, "I've really fallen in love with NAME, I feel like I can't sleep without HIS_HER_L soft warm body anymore! That, and I'm REALLY excited to stick my dick in it as well...");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I've gotten to the point where I'm allowed to sleep on NAME's hair during the night! It's so incredibly soft and comforting, it makes me feel like a sleepy little Zorua...");
								array_push(_lines, "NAME and I have basically become the unofficial parents of all 'Mons at the camp, it makes me feel so attracted to HIM_HER_L... It's a very fulfilling feeling!");
								array_push(_lines, "I've really fallen in love with NAME, HIS_HER_L parental nature and loving personality awaken a feeling inside me... I can't wait to take HIS_HER_L virginity, I'd have kids with HIM_HER_L if I could...");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I feel like NAME is aroused permanently ever since we mated, and all shame around it has dissipated completely. It's a sign of love and complete trust!");
						array_push(_lines, "I keep going hard over the sight of NAME strutting around aroused, genitals for the world to see... I sometimes secretly jerk off at the sight of it!");
						array_push(_lines, "The sight of NAME being in heat will never get old, and I'll never stop popping boners over it...");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I'm going absolutely mad over the sight of NAME's hard dick and cute boy pussy... I need to empty my nuts inside HIM_HER_L pronto, I can't hold back anymore!");
							array_push(_lines, "I've fallen in love with NAME so bad that I've had dreams about HIS_HER_L delicious juicy cock and gorgeous ass... I'm craving for more, and I think HE_SHE_L does too!");
						}
						else 
						{
							array_push(_lines, "I'm going absolutely mad over the sight of NAME's soaking pussy and ass... I need to empty my nuts inside HIM_HER_L pronto, I can't hold back anymore!");
							array_push(_lines, "I've fallen in love with NAME so bad that I've had dreams about HIM_HER_L delicious pussy and gorgeous ass... I'm craving for more, and I think HE_SHE_L does too!");
						}
					}
				break;
			}
		break;
		
		case TEXT_PROMPT_TYPE.PET:
			switch(_affection_level)
			{
				case AFFECTION_LEVEL.NEW:
					// Regular
					array_push(_lines, "I gently offer NAME my hand and I get close enough to touch HIM_HER_L! It doesn't go much further than touching with my fingers, but contact was made!");
					array_push(_lines, "NAME acts brave and comes up to me to inspect me.\nHE_SHE sniffs my hand and I carefully scritch HIS_HER_L chin.\nWow, that went really well!");
					array_push(_lines, "I sit down next to NAME, who is laying on the grass lazily. I carefully start petting HIM_HER_L and HE_SHE_L's too comfortable to object to it. Cute!");
					array_push(_lines, "I hold my hand out, palm facing up to try and communicate. NAME stares at it hesitantly, but briefly puts HIS_HER_L paw on it! That counts as petting, right?");
					array_push(_lines, "I'm busy cleaning some stuff up and NAME curiously investigates. I smile and give HIM_HER_L a head pat, HE_SHE_L was too focussed to notice and looks at me sheepishly!");
					array_push(_lines, "I make some reassuring sounds and gently reach to pet NAME... Surprisingly, HE_SHE_L lets me for a bit!");
					
					array_push(_lines, "FAIL I try to get close and pet NAME, but am greeted with a snarl! Guess I moved too boldly...");			
					array_push(_lines, "FAIL NAME is facing away as I try to pet HIM_HER_L... HE_SHE_L instantly jumps up and scolds me for trying!");
					array_push(_lines, "FAIL NAME frowns at me as soon as I raise my hand, letting me know HE_SHE_L's NOT in the mood. Okay, noted.");
					
					// Species Specific
					switch(_species)
					{
						case SPECIES.ALOLANVULPIX:
							array_push(_lines, "NAME seems a bit wobbly and overheated... I get an ice pack and cooled water bottle for HIM_HER_L, HE_SHE_L's so thankful HE_SHE_L lets me pet HIM_HER_L all over!");
						break;
						case SPECIES.BRAIXEN:
							array_push(_lines, "NAME dropped HIS_HER_L stick, so I walk up to HIM_HER_L to return it. I put it back in HIS_HER_L tail and give HIM_HER_L a head pat. HE_SHE looks both embarassed and grateful!");
						break;
						case SPECIES.CINDERACE:
							array_push(_lines, "NAME tripped during a training session and got HIS_HER_L knee scratched. HE_SHE allows me to treat it with some first aid and lets me pet HIM_HER_L as thanks!");
						break;
						case SPECIES.LUCARIO:
							array_push(_lines, "I try some meditation to calm my aura for NAME and it seems to work. HE_SHE carefully comes to inspect me and lets me briefly scritch HIS_HER_L head!");
						break;
						case SPECIES.NICKIT:
							array_push(_lines, "NAME has a piece of garbage stuck in HIS_HER_L tail and I offer to help. HE_SHE's very wary, but lets me remove it and gently pet HIS_HER_L tail. Seems like HE_SHE_L's starting to trust me!");
						break;
						case SPECIES.VULPIX:
							array_push(_lines, "NAME's fur has been rough and tangled since HE_SHE_L came to the camp! HE_SHE lets me carefully fix it up with a comb... Rare for a NAME to be this trusting right away!");
						break;
						case SPECIES.ZOROARK:
							array_push(_lines, "NAME got HIS_HER_L hair all tangled up, so I get a comb.\nHE_SHE seems to understand my intention and reluctantly lets me fix it, not really petting but still great for bonding!");
						break;
					}
				break;
				
				case AFFECTION_LEVEL.LOW:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "As my hand glides through HIS_HER_L fur, NAME's eyes soften from suspicion to enjoyment!");
						array_push(_lines, "I reach out to pet NAME and notice some tension, but HE_SHE_L mellows out fast and begins to lean into my hand!");
						array_push(_lines, "I reach my hand under NAME's chin and gently scritch it with my nails. It's got an almost hypnotizing effect on HIM_HER_L and HE_SHE_L forgets to be wary!");
						array_push(_lines, "NAME comes close enough for me to gently caress HIS_HER_L soft cheecks. HE_SHE's still a little bit hesitant, but blushes and smiles regardless!");
						array_push(_lines, "NAME is feeling suprisingly cuddly right now and I'm allowed to touch HIS_HER_L body! I can feel the tension melt away with every stroke...");
						array_push(_lines, "I give NAME a warm smile and pat HIM_HER_L on the head. HE_SHE smiles proudly, I think HE_SHE_L's interpreting it as praise!");
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I give NAME an affirming pat on the back in a comradery kind of way. It's seems to work, NAME chuckles and smiles at me!");
						}
						else 
						{
							array_push(_lines, "I get on my knees and rub NAME's face with two hands, calling HIM_HER_L pretty and a good girl. HE_SHE's enjoying it and beaming with pride!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I notice NAME's tail fur got all tangly and messy.\nI gently pretty HIM_HER_L up again with a hairbrush while I pet HIM_HER_L, it's a pretty intimate and therapeutic experience!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I gently stroke NAME's long ears and ruffle HIS_HER_L white cheek fur, HE_SHE_L's trying hard to not show HE_SHE_L's loving it!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "NAME seems to have some muscle pain in HIS_HER_L legs,\nso I offer to massage them. HE_SHE reluctantly lets me,\nbut then groans in relief and profusely thanks me after!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I pet NAME and then gently reach for HIS_HER_L hands, holding them in mine. I stare into HIS_HER_L eyes and try to connect to HIM_HER_L, it's very intimate... NAME blushes and turns away!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I gesture NAME to hold up a paw and HE_SHE_L does as instructed, I grab it and massage it gently... NAME's seems to be enjoying it, it's so nice and soft!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "I put a super comfortable blanket from my tent on my lap and coax NAME to sit on it. HE_SHE can't resist how comfy it looks and lets me pet HIM_HER_L as HE_SHE_L takes a nap on it!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "NAME got HIS_HER_L hair all tangled up again, so I sit down to fix it for HIM_HER_L with a hairbrush. It's a pretty intimate bonding activity, HE_SHE_L's definitely enjoying it!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I try to pet NAME, but HE_SHE_L frantically retreats and blushes! I notice HE_SHE_L's hiding HIM_HER_L modesty, maybe now's not the time!");
						array_push(_lines, "I get a few ear scritches in, but NAME turns around in embarassment over what's going on between HIS_HER_L legs!");
						array_push(_lines, "I notice NAME's genitals are in heat, so I get cocky and move my fingers along HIS_HER_L body... HE_SHE withdraws before I can get to the good parts though!");
						array_push(_lines, "NAME lets me pet HIM_HER_L for a moment, but HE_SHE_L doesn't take long to break away and cover their face in shame! Maybe wait until the hormones settle...");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I attempt to pet NAME, but HE_SHE_L's too embarassed about HIS_HER_L raging erection and moves out of the way!");
						}
						else 
						{
							array_push(_lines, "I attempt to pet NAME, but HE_SHE_L's too embarassed about HIM_HER_L soaking wet pussy and moves out of the way!");
						}
					}	
				break;
				
				case AFFECTION_LEVEL.MEDIUM:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I raise my hand to pet NAME and notice all HIS_HER_L previous hesitation has melted away! I ruffle HIS_HER_L head and massage HIS_HER_L cheeks freely... HE_SHE's loving it!");
						array_push(_lines, "NAME and I sit down against a stump together, with HIM_HER_L between my legs. I comb my fingers through HIS_HER_L fur and massage HIS_HER_L back, it's a very zen experience...");
						array_push(_lines, "I reach my hand under NAME's chin and scritch it.\nHE_SHE closes HIS_HER_L eyes and lets me treat all the good spots...\nHE_SHE almost falls over when I stop!");
						array_push(_lines, "As my hands glide through NAME's fur and swirl around HIS_HER_L upper body, HE_SHE_L gets lost in bliss and starts making happy little whimpers!");
						array_push(_lines, "I give NAME a warm hug and stroke HIS_HER_L upper and lower back... The urge to grope HIM_HER_L is enormous, but I don't want to ruin the moment!");
						array_push(_lines, "I scratch behind NAME's ears and murmur some sweet words to HIM_HER_L, before pressing out foreheads together...\nIt makes us both smile and blush!");
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME still tends to act like being pet by another male is a little embarassing, but it only takes a few ear scritches to break HIS_HER_L tough attitude!");
						}
						else 
						{
							array_push(_lines, "I run my hands through NAME's soft fur and compliment HIM_HER_L on being incredibly beautiful... HE_SHE flushes up like crazy and lets me pet HIM_HER_L anywhere!");
						}
						
						// Species Specific
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "NAME hops around happily at the sight of HIS_HER_L favourite brush and lets me give HIM_HER_L a thorough petting and grooming session! I always love doing this with HIM_HER_L.");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I sit NAME down and get on my knees, after which I pretty up HIS_HER_L ear tufts and skirt. When done, HE_SHE_L gets up and does a supermodel pose... Cute!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I've come to learn NAME really loves massages, so I lay HIM_HER_L down and apply some skills I learned to give HIM_HER_L a rejuvinating treatment. HE_SHE's absolutely loving it!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I rub NAME's cheeks and we rest our heads against each other... I let our auras meld and kiss HIM_HER_L on the forehead. It makes HIM_HER_L blush profusely!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I gesture NAME to hold up HIS_HER_L paw and HE_SHE_L does as instructed. I grab it and massage it gently, as well as kissing it a few times... HE_SHE seems to REALLY like it!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME sleepily walks up to me and takes a lovely nap on my lap, while I run my hand over HIS_HER_L soft warm body!\nFire types really are the best cuddle partners...");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I run my hands through NAME's hair and HE_SHE_L caresses mine back in return. Compared to the other 'Mons, this one's very two-sided in terms of petting sessions!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I invite poor aroused NAME to sit on my lap for a petting session! HE_SHE flusters, but sits down and lets me massage HIM_HER_L ALL over... It's turning us on like crazy!");
						array_push(_lines, "I convince NAME to lay down on the grass, after which I massage HIS_HER_L tummy... I 'accidentally' bump HIS_HER_L genitals too, but HIS_HER_L doesn't seem to mind!");
						array_push(_lines, "NAME is still aroused, so I give HIM_HER_L a more intimate petting session. I smooch and rub all over HIS_HER_L trembling body... It's made HIM_HER_L even more aroused!");
						array_push(_lines, "NAME and I get so into a cheek rubbing session, our heads draw near and we briefly kiss... We draw back in shock, but then just smile at each other!");
						array_push(_lines, "The sight of NAME's aroused body is breaking me, so I gently massage HIS_HER_L nipples and buttcheeks... HE_SHE hides HIS_HER_L face in my chest and whimpers like crazy!");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I give NAME an extra special petting session and run my hands down HIS_HER_L body, after which I briefly massage HIS_HER_L manhood... It makes HIM_HER_L whine in pleasure!");
							array_push(_lines, "While NAME is laying in my arms and distracted by my petting, I very gently start jerking HIM_HER_L off... HE_SHE softly whines into my ear and splurts some precum!");
						}
						else 
						{
							array_push(_lines, "I give NAME an extra special petting session and run my hands down HIM_HER_L body, after which I briefly massage HIM_HER_L vagina... It makes HIM_HER_L whine in pleasure!");
							array_push(_lines, "While NAME is laying in my arms and distracted by my petting, I very gently start fingering HIM_HER_L... HE_SHE softly whines into my ear and HIM_HER_L pussy convulses!");
						}
					}
				break;
				
				case AFFECTION_LEVEL.HIGH:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I greet NAME excitedly and ruffle behind HIS_HER_L ears! HE_SHE bleps HIS_HER_L tongue out and makes little noises to greet me back!");
						array_push(_lines, "I raise my hand to pet NAME and notice all HIS_HER_L previous hesitation has melted away. I ruffle HIS_HER_L head and massage HIS_HER_L cheeks freely... And HE_SHE_L's loving it!");
						array_push(_lines, "NAME and I sit down under a tree together, with HIS_HER_L between my legs. I comb my fingers through HIS_HER_L fur and kiss HIS_HER_L head, it's a very romantic experience!");
						array_push(_lines, "I reach my hand under NAME's chin and scritch it. HE_SHE closes HIS_HER_L eyes and lets me treat all the good spots... HE_SHE almost falls over when I stop!");
						array_push(_lines, "As my hands glide through NAME's fur and swirl around HIS_HER_L upper body, HE_SHE_L gets lost in bliss and starts making happy little whimpers!");
						array_push(_lines, "I scratch behind NAME's ears and murmur some sweet words to HIM_HER_L, before kissing HIM_HER_L on the mouth.... It makes us both smile and blush!");		
						array_push(_lines, "I lay NAME down on the grass and rub HIS_HER_L chest, belly and hips... It's getting a little intimate and NAME seems to be loving it!");
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME has lost the tough guy act males exhibit when being pet, and instead is like putty in my hands. HE_SHE whirrs in joy as I rub HIS_HER_L cheeks and scritch HIS_HER_L ears!");
						}
						else 
						{
							array_push(_lines, "I romantically hold NAME's paw as I caress HIM_HER_L face, telling HIM_HER_L HE_SHE_L's the most beautiful NAME I've ever seen... HE_SHE's absolutely smitten by it!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I lay NAME down, run my hands through HIS_HER_L tuft and use HIS_HER_L favourite brush to put HIM_HER_L in a zen-like state. HE_SHE cuddles and licks me as thanks afterwards!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I get some fur product made for fire 'Mons from my tent and massage it into NAME's soft yellow fur... When done, HE_SHE_L inspects it and beams over how pretty it looks!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I lay cinderace down on HIS_HER_L belly and get some hot stones to put on HIS_HER_L back... HE_SHE whines in pleasure as I use the hot stones and massaging to treat HIS_HER_L sore muscles!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I sit down next to the campfire and put NAME on my lap, facing me. We rest our heads against each other while I intimately caress HIM_HER_L all over... This is how love feels!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "NAME's paws looks kinda dirty and sore, so I get a warm sponge bath and give HIM_HER_L a relaxing manicure. HE_SHE's absolutely loving it and almost flops over a few times!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME smiles and hops onto my lap, laying on HIS_HER_L back to ask for tummy scratchies. I run my hands over HIS_HER_L warm body as HE_SHE_L falls soundly asleep against my body!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I reach to pet NAME, but HE_SHE_L stops me and sits me down in front of HIM_HER_L. HE_SHE begins to groom and caress me instead, making me briefly fall asleep laying in HIS_HER_L arms!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I invite poor aroused NAME to sit on my lap for a petting session! HE_SHE plops down excitedly and lets me massage HIM_HER_L ALL over... It's turning us on like crazy!");
						array_push(_lines, "I lay NAME on HIM_HER_L back and sensually massage HIM_HER_L chest and lower body... I get a bit touchy and rub HIM_HER_L genitals a bit before getting HIM_HER_L up again!");
						array_push(_lines, "NAME is still aroused, so I give HIM_HER_L a more intimate petting session. I kiss HIM_HER_L all over and massage HIM_HER_L entire body... HE_SHE softly moans in pleasure!");
						array_push(_lines, "NAME and I get so into a cheek rubbing session, we end up making out profusely... Saliva drips to the ground as we break up, exchanging a warm smile!");
						array_push(_lines, "I press NAME against my body and gently grope HIM_HER_L ass, as well as rubbing HIM_HER_L inner thighs from behind... HE_SHE makes adorable moans into my chest!");
						array_push(_lines, "I sit NAME down and give HIM_HER_L a relaxing paw massage... HE_SHE closes HIM_HER_L eyes in bliss and pants as I stroke, knead and lick HIM_HER_L adorable paws!");
						array_push(_lines, "I set up close to NAME and smile, beginning to fondle HIM_HER_L chest and playing with HIM_HER_L nipples... HE_SHE moans as I squeeze them and kiss HIM_HER_L forehead, it's made me hard...");
									
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I give NAME an extra special petting session and run my hands down HIS_HER_L body, after which I briefly massage HIS_HER_L manhood... It makes HIM_HER_L whine in pleasure!");
							array_push(_lines, "NAME is laying in my arms and we look in each others eyes... I start jerking HIM_HER_L off while I pet HIS_HER_L stomach, making HIM_HER_L whine and ejaculate some precum!");
						}
						else 
						{
							array_push(_lines, "I give NAME an extra special petting session and run my hands down HIM_HER_L body, after which I briefly massage HIM_HER_L vagina... It makes HIM_HER_L whine in pleasure!");
							array_push(_lines, "NAME is laying in my arms and we look in each others eyes... I start fingering HIM_HER_L while I pet HIM_HER_L stomach, making HIM_HER_L whine and have a minor orgasm!");
						}
					}
				break;
				
				case AFFECTION_LEVEL.MAX:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I greet NAME excitedly and ruffle behind HIS_HER_L ears! HE_SHE bleps HIS_HER_L tongue out and makes little noises to greet me back!");
						array_push(_lines, "I raise my hand to pet NAME and notice all HIS_HER_L previous hesitation has melted away. I ruffle HIS_HER_L head and massage HIS_HER_L cheeks freely... And HE_SHE_L's loving it!");
						array_push(_lines, "NAME and I sit down under a tree together, with HIS_HER_L between my legs. I comb my fingers through HIS_HER_L fur and kiss HIS_HER_L head, it's a very romantic experience!");
						array_push(_lines, "I reach my hand under NAME's chin and scritch it. HE_SHE closes HIS_HER_L eyes and lets me treat all the good spots... HE_SHE almost falls over when I stop!");
						array_push(_lines, "As my hands glide through NAME's fur and swirl around HIS_HER_L upper body, HE_SHE_L gets lost in bliss and starts making happy little whimpers!");
						array_push(_lines, "I scratch behind NAME's ears and murmur some sweet words to HIM_HER_L, before kissing HIM_HER_L on the mouth.... It makes us both smile and blush!");		
						array_push(_lines, "I lay NAME down on the grass and rub HIS_HER_L chest, belly and hips... It's getting a little intimate and NAME seems to be loving it!");
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "NAME has lost the tough guy act males exhibit when being pet, and instead is like putty in my hands. HE_SHE whirrs in joy as I rub HIS_HER_L cheeks and scritch HIS_HER_L ears!");
						}
						else 
						{
							array_push(_lines, "I romantically hold NAME's paw as I caress HIM_HER_L face, telling HIM_HER_L HE_SHE_L's the most beautiful NAME I've ever seen... HE_SHE's absolutely smitten by it!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I lay NAME down, run my hands through HIS_HER_L tuft and use HIS_HER_L favourite brush to put HIM_HER_L in a zen-like state. HE_SHE cuddles and licks me as thanks afterwards!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I get some fur product made for fire 'Mons from my tent and massage it into NAME's soft yellow fur... When done, HE_SHE_L inspects it and beams over how pretty it looks!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I lay cinderace down on HIS_HER_L belly and get some hot stones to put on HIS_HER_L back... HE_SHE whines in pleasure as I use the hot stones and massaging to treat HIS_HER_L sore muscles!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I sit down next to the campfire and put NAME on my lap, facing me. We rest our heads against each other while I intimately caress HIM_HER_L all over... This is how love feels!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "NAME's paws looks kinda dirty and sore, so I get a warm sponge bath and give HIM_HER_L a relaxing manicure. HE_SHE's absolutely loving it and almost flops over a few times!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "NAME smiles and hops onto my lap, laying on HIS_HER_L back to ask for tummy scratchies. I run my hands over HIS_HER_L warm body as HE_SHE_L falls soundly asleep against my body!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I reach to pet NAME, but HE_SHE_L stops me and sits me down in front of HIM_HER_L. HE_SHE begins to groom and caress me instead, making me briefly fall asleep laying in HIS_HER_L arms!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I invite poor aroused NAME to sit on my lap for a petting session! HE_SHE plops down excitedly and lets me massage HIM_HER_L ALL over... It's turning us on like crazy!");
						array_push(_lines, "I lay NAME on HIM_HER_L back and sensually massage HIM_HER_L chest and lower body... I get a bit touchy and rub HIM_HER_L genitals a bit before getting HIM_HER_L up again!");
						array_push(_lines, "NAME is still aroused, so I give HIM_HER_L a more intimate petting session. I kiss HIM_HER_L all over and massage HIM_HER_L entire body... HE_SHE softly moans in pleasure!");
						array_push(_lines, "NAME and I get so into a cheek rubbing session, we end up making out profusely... Saliva drips to the ground as we break up, exchanging a warm smile!");
						array_push(_lines, "I press NAME against my body and gently grope HIM_HER_L ass, as well as rubbing HIM_HER_L inner thighs from behind... HE_SHE makes adorable moans into my chest!");
						array_push(_lines, "I sit NAME down and give HIM_HER_L a relaxing paw massage... HE_SHE closes HIM_HER_L eyes in bliss and pants as I stroke, knead and lick HIM_HER_L adorable paws!");
						array_push(_lines, "I set up close to NAME and smile, beginning to fondle HIM_HER_L chest and playing with HIM_HER_L nipples... HE_SHE moans as I squeeze them and kiss HIM_HER_L forehead, it's made me hard...");
									
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I give NAME an extra special petting session and run my hands down HIS_HER_L body, after which I briefly massage HIS_HER_L manhood... It makes HIM_HER_L whine in pleasure!");
							array_push(_lines, "NAME is laying in my arms and we look in each others eyes... I start jerking HIM_HER_L off while I pet HIS_HER_L stomach, making HIM_HER_L whine and ejaculate some precum!");
						}
						else 
						{
							array_push(_lines, "I give NAME an extra special petting session and run my hands down HIM_HER_L body, after which I briefly massage HIM_HER_L vagina... It makes HIM_HER_L whine in pleasure!");
							array_push(_lines, "NAME is laying in my arms and we look in each others eyes... I start fingering HIM_HER_L while I pet HIM_HER_L stomach, making HIM_HER_L whine and have a minor orgasm!");
						}
					}
				break;
			}
		break;	
		
		case TEXT_PROMPT_TYPE.SHOW_OFF:
			switch(_affection_level)
			{
				case AFFECTION_LEVEL.LOW:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "I lower to NAME's eye level and, in a warm tone, ask HIM_HER_L to show off HIS_HER_L body. HE_SHE flusters and hesitates, but then shows off HIS_HER_L goods. Wow, it worked!");
						array_push(_lines, "I offer NAME a snack in trade for showing off HIS_HER_L body.\nHE_SHE pouts, looks around if no one else is looking and then gives me a sexy pose!");
						array_push(_lines, "In a bold effort I take off my pants, showing my dick to NAME. I tell HIM_HER_L it's okay to show each other, and HE_SHE_L hesitantly follows my lead!");
						array_push(_lines, "I tell NAME it's health inspection day and to let me check HIS_HER_L genitals. HE_SHE looks shocked and bashfully complies, despite it being a joke! How evil...");
						
						array_push(_lines, "FAIL I try to get flirty with NAME and propose HE_SHE_L shows HIM_HER_Lself off, but after some hesitation NAME refuses! Looks like HE_SHE_L still quite nervous about this...");
						array_push(_lines, "FAIL I move close to NAME and caress HIS_HER_L hip, suggesting HIM_HER_L to let me have a look at HIM_HER_L. HE_SHE blushes but pushes my hand away, so I give HIM_HER_L some space.");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I can't help but stare at NAME's dick and balls, so I beg HIM_HER_L to show them to me. HE_SHE rolls HIS_HER_L eyes and sighs before giving me a good look at HIS_HER_L manhood!");
						}
						else 
						{
							array_push(_lines, "I can't help but stare at NAME's cute pussy, so I beg HIM_HER_L to show it to me. HE_SHE rolls HIS_HER_L eyes and sighs before giving me a good look at HIM_HER_L womanhood!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I compliment NAME on HIS_HER_L beautiful snow white coat and plead HIM_HER_L to show HIS_HER_L backside. HE_SHE looks embarassed, but shows me HIS_HER_L cute white vulpine rear!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I pretty up NAME's fur skirt and tell HIS_HER_L it looks beautiful, after which I ask if I can see under it. HE_SHE blushes and hesitates, but gives me a naughty peek! ");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I do a quick workout with NAME and offer to wash HIS_HER_L pants after! HE_SHE acts embarassed as HE_SHE_L takes them off, but seems to secretly enjoy doing so!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I get the mood steamy by sharing indecent feelings with NAME through aura, as well as asking to see HIS_HER_L body.\nHIS_HER poise breaks and HE_SHE_L shows me all HIM_HER_L private parts!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I show NAME an item HE_SHE_L stole from me recently, and ask to show me HIM_HER_L rear as compensation. With a guilty look and a blush on HIS_HER_L face HE_SHE_L attones for HIS_HER_L crimes!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "I compliment NAME on HIS_HER_L beautiful soft coat and plead HIM_HER_L to show HIS_HER_L backside too. HE_SHE looks embarassed,\nbut shows me HIS_HER_L cute little vulpine rear!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I tell NAME HE_SHE_L's breathtakingly beautiful, I can tell from HIS_HER_L reaction that HE_SHE_L's never had a mate before!\nI ask for a peek and HE_SHE_L's too flustered to protest...");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "NAME is so incredibly pent up, HE_SHE_L just can't resist when I ask HIM_HER_L to show off HIS_HER_L genitals to me... What a gorgeous sight, I'm really gaining trust!");
						array_push(_lines, "I tell NAME I can see what HE_SHE_L's hiding and ask if I can see more closely. HE_SHE blushes and sighs, but lets me inspect up close! I'm instantly erect...");
						array_push(_lines, "By whispering some intimate words I make NAME blush and shiver! I ask HIM_HER_L if HE_SHE_L can show off for me and obliges while lost in thought!");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I ask NAME why HE_SHE_L would hide such an impressive dick from me. HE_SHE flusters in pride and decides to give me a brief look at HIS_HER_L throbbing erection!");
						}
						else 
						{
							array_push(_lines, "I ask NAME why HE_SHE_L would hide such a sexy rear from me. HE_SHE flusters in pride and decides to give me a brief look at HIM_HER_L dripping pussy and captivating hips!");
						}
					}	
				break;
				
				case AFFECTION_LEVEL.MEDIUM:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "NAME looks all flustered when I plead HIM_HER_L to show off HIS_HER_L beautiful body for me. HE_SHE strikes a pose and gives me a good look at all HIS_HER_L private bits...");
						array_push(_lines, "I take out a sketchbook and ask if NAME wants to pose for me. HE_SHE giggles and strikes a risque pose as I sketch HIM_HER_L... It turned out pretty good, I could sell this!");
						array_push(_lines, "I offer NAME some snacks in exchange for HIM_HER_L showing off HIS_HER_L body for me. HE_SHE barely hesitates and promptly puts HIS_HER_L genitals where I can see them!");
						array_push(_lines, "I playfully beg NAME to show off HIS_HER_L body to me until HE_SHE_L laughs and pushes me aside! HE_SHE then gives me a smug look and showcases HIS_HER_L modesty to me...");
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "Oogling at NAME's shaft and balls has me hypnotized and HE_SHE_L's picked up on it. HE_SHE chuckles and smiles before giving me an even better look!");
						}
						else 
						{
							array_push(_lines, "Oogling at NAME's hips and rear has me hypnotized and HE_SHE_L's picked up on it... HE_SHE giggles and smiles before giving me an even better look!");
						}
						
						// Species Specific
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I tell NAME HIS_HER_L perfect snow white body makes my knees weak and beg HIM_HER_L to show HIM_HER_Lself off for me...\nHE_SHE smirks in pride and tauntingly showcases HIS_HER_L body!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I ask NAME if HE_SHE_L can do a more 'grown up' dance for me and HE_SHE_L giggles at the request! HE_SHE sways HIS_HER_L hips and gives me some very arousing dance moves...");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I put my hands on NAME's hips and ask if I can take HIS_HER_L pants off... HE_SHE nods and blushes as I slide it down, after which HE_SHE_L strikes a sexy pose for me!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I gaze into NAME's eyes and communicate my desire to see HIS_HER_L sexy trained body through aura. HE_SHE finds it incredibly intimate and obliges... What a sight!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I gently start lifting NAME's tail and ask HIM_HER_L if I can have a look under it. HE_SHE bashfully nods and after raising it fully HE_SHE_L shows it off for me!");
							break;
							case SPECIES.VULPIX:
								if(_gender == GENDERS.M) 
									array_push(_lines, "I ask NAME if HE_SHE_L can be a good boy for me and show off HIS_HER_L cute little body. Being called a good boy makes HIM_HER_L reel and HE_SHE_L strikes me a really nice pose to look at!");
								else
									array_push(_lines, "I ask NAME if HE_SHE_L can be a good girl for me and show off HIM_HER_L cute little body. Being called a good girl makes HIM_HER_L reel and HE_SHE_L strikes me a really nice pose to look at!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I plead NAME to show off HIS_HER_L incredible beauty for me... HE_SHE smiles warmly and surprises me with incredible posing and seduction skills, it makes me hard instantly...");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "I tell NAME HE_SHE_L looks very attractive when HE_SHE_L's aroused like that and ask for a better view... HE_SHE gets embarassed, but gives me exactly what I want! ");
						array_push(_lines, "NAME covers HIS_HER_L blushing cheeks as I take off my pants and ask HIM_HER_L to trade! We both pose for each other and get all tingly and warm from the sight...");
						array_push(_lines, "I tell NAME HE_SHE_L's got a cute ass and I would love to see HIM_HER_L show it off... HE_SHE looks away embarassed, but then poses and wiggles it seductively!");
						
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I kneel and worship NAME's throbbing dick a little before asking if HE_SHE_L can show it off for me. HE_SHE's too prideful to say no and puts it on full display!");
						}
						else 
						{
							array_push(_lines, "I kneel and worship NAME's soaking pussy a little before asking if HE_SHE_L can show it off for me. HE_SHE's too prideful to say no and puts it on full display!");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I tell NAME HIS_HER_L perfect snow white body makes my knees weak and beg HIM_HER_L to show HIM_HER_Lself off for me...\nHE_SHE smirks in pride and tauntingly showcases HIS_HER_L body!");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "I ask NAME if HE_SHE_L can do a more 'grown up' dance for me and HE_SHE_L giggles at the request! HE_SHE sways HIS_HER_L hips and gives me some very arousing dance moves...");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "I put my hands on NAME's hips and ask if I can take HIS_HER_L pants off... HE_SHE nods and blushes as I slide it down, after which HE_SHE_L strikes a sexy pose for me!");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "I gaze into NAME's eyes and communicate my desire to see HIS_HER_L sexy trained body through aura. HE_SHE finds it incredibly intimate and obliges... What a sight!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I gently start lifting NAME's tail and ask HIM_HER_L if I can have a look under it. HE_SHE bashfully nods and after raising it fully HE_SHE_L shows it off for me!");
							break;
							case SPECIES.VULPIX:
								if(_gender == GENDERS.M) 
									array_push(_lines, "I ask NAME if HE_SHE_L can be a good boy for me and show off HIS_HER_L cute little body. Being called a good boy makes HIM_HER_L reel and HE_SHE_L strikes me a really nice pose to look at!");
								else
									array_push(_lines, "I ask NAME if HE_SHE_L can be a good girl for me and show off HIM_HER_L cute little body. Being called a good girl makes HIM_HER_L reel and HE_SHE_L strikes me a really nice pose to look at!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "I plead NAME to show off HIS_HER_L incredible beauty for me... HE_SHE smiles warmly and surprises me with incredible posing and seduction skills, it makes me hard instantly...");
							break;
						}
					}
				break;
				
				case AFFECTION_LEVEL.HIGH:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "NAME has gotten used to showing HIM_HER_Lself off for me, so I don't have to plead anymore when I ask. HE_SHE smiles and gives me a good look at HIS_HER_L pretty body!");
						array_push(_lines, "I take out a sketchbook and ask if NAME wants to pose for me. HE_SHE giggles and strikes a risque pose as I sketch HIM_HER_L... It turned out pretty good, I could sell this!");
						array_push(_lines, "I dangle a snack in front of NAME's face and HE_SHE_L can already tell what I want HIM_HER_L to do in exchange. HE_SHE_L shows off HIS_HER_L beauty and snags the snack from me!");
						array_push(_lines, "I playfully beg NAME to show off HIS_HER_L body to me until HE_SHE_L laughs and pushes me aside! HE_SHE then gives me a smug look and showcases HIS_HER_L modesty to me...");
						array_push(_lines, "I've taught NAME a finger gesture for showing off HIS_HER_L rear, it's become almost like a little trick! HE_SHE shows off HIS_HER_L private parts and I compliment HIM_HER_L on them!");
						array_push(_lines, "I really want some photos to remember NAME by when I eventually head back home. I ask HIM_HER_L for pics and HE_SHE_L gives me a perfect pose... There, for the collection!");		
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I'm hungry for some shaft and ball eyecandy, so I ask NAME to help me out. HE_SHE chuckles, poses and sways HIS_HER_L hips to make them dangle... I'm hypnotized.");
						}
						else 
						{
							array_push(_lines, "I'm hungry for some slit and ass eyecandy, so I ask NAME to help me out. HE_SHE chuckles, poses and sways HIM_HER_L hips to taunt me... I'm hypnotized.");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I'm so incredibly hot for how beautiful NAME's slender white body is, so I plead HIM_HER_L to show it off! HE_SHE poses and I run my hand along HIS_HER_L beautiful body...");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "Since NAME loves to dance, I ask if HE_SHE_L knows how to lap dance as well... HE_SHE gives a naughty look and sits me down, before giving me the performance of a lifetime!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "NAME notices me staring at HIS_HER_L groin area and gives me a taunting look, taking off HIS_HER_L pants and putting HIS_HER_L privates on full display. Man, what an incredible body...");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "NAME reads my mind before I can even ask, shusing me with HIS_HER_L paw and giving me an incredibly sensual showcase of HIS_HER_L body... I'm left speechless!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I remind NAME of something mischievous HE_SHE_L did recently and say I'll clean the record if HE_SHE_L lets me check HIM_HER_L out... HE_SHE giggles, poses and lets me get up close to admire HIM_HER_L!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "I stroke NAME's hips and ask if I can get a closer look at HIS_HER_L body... HE_SHE blushes, nods and poses, letting me get my face real close to HIS_HER_L heat-radiating body!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "In reponse to me asking NAME to show HIS_HER_L sexy body, HE_SHE_L uses illusions to mimic and pose as several other incredibly attractive 'Mons. It's like cosplay, but better!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "NAME looks very pent up, so I take off my pants and ask HIM_HER_L to pose for me. HE_SHE shows me what's good and I jerk off at the sight for a little while!");
						array_push(_lines, "There's a real audience for photos of aroused 'Mons online, so I ask NAME if HE_SHE_L's camera shy. HE_SHE giggles and lets me take some very indecent pics!");
						array_push(_lines, "I overwhelm NAME with compliments on HIS_HER_L hot body and ask if I can jerk off to HIM_HER_L. HE_SHE flusters up, but lets me stroke my shit while showing HIM_HER_Lself off!");
						array_push(_lines, "NAME and I are both horny, so I strip naked and we play a game where we try to do the hottest pose. HE_SHE stares in awe as I do mine, so I think I actually won!");
									
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I point out NAME's juicy hard dick and ask HIM_HER_L to show me up close. HE_SHE blushes and shows the goods right in front of my face, while I sniff and stroke my dick...");
						}
						else 
						{
							array_push(_lines, "I point out NAME's juicy wet slit and ask HIM_HER_L to show me up close. HE_SHE blushes and shows off the goods right in front of my face, while sniff it and stroke my dick...");
						}
					}
				break;
				
				case AFFECTION_LEVEL.MAX:
					// Low Arousal Mode
					if(_arousal_level == AROUSAL_LEVEL.LOW)
					{
						// Regular
						array_push(_lines, "NAME has gotten used to showing HIM_HER_Lself off for me, so I don't have to plead anymore when I ask. HE_SHE smiles and gives me a good look at HIS_HER_L pretty body!");
						array_push(_lines, "I take out a sketchbook and ask if NAME wants to pose for me. HE_SHE giggles and strikes a risque pose as I sketch HIM_HER_L... It turned out pretty good, I could sell this!");
						array_push(_lines, "I dangle a snack in front of NAME's face and HE_SHE_L can already tell what I want HIM_HER_L to do in exchange. HE_SHE_L shows off HIS_HER_L beauty and snags the snack from me!");
						array_push(_lines, "I playfully beg NAME to show off HIS_HER_L body to me until HE_SHE_L laughs and pushes me aside! HE_SHE then gives me a smug look and showcases HIS_HER_L modesty to me...");
						array_push(_lines, "I've taught NAME a finger gesture for showing off HIS_HER_L rear, it's become almost like a little trick! HE_SHE shows off HIS_HER_L private parts and I compliment HIM_HER_L on them!");
						array_push(_lines, "I really want some photos to remember NAME by when I eventually head back home. I ask HIM_HER_L for pics and HE_SHE_L gives me a perfect pose... There, for the collection!");		
					
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I'm hungry for some shaft and ball eyecandy, so I ask NAME to help me out. HE_SHE chuckles, poses and sways HIS_HER_L hips to make them dangle... I'm hypnotized.");
						}
						else 
						{
							array_push(_lines, "I'm hungry for some slit and ass eyecandy, so I ask NAME to help me out. HE_SHE chuckles, poses and sways HIM_HER_L hips to taunt me... I'm hypnotized.");
						}
						
						switch(_species)
						{
							case SPECIES.ALOLANVULPIX:
								array_push(_lines, "I'm so incredibly hot for how beautiful NAME's slender white body is, so I plead HIM_HER_L to show it off! HE_SHE poses and I run my hand along HIS_HER_L beautiful body...");
							break;
							case SPECIES.BRAIXEN:
								array_push(_lines, "Since NAME loves to dance, I ask if HE_SHE_L knows how to lap dance as well... HE_SHE gives a naughty look and sits me down, before giving me the performance of a lifetime!");
							break;
							case SPECIES.CINDERACE:
								array_push(_lines, "NAME notices me staring at HIS_HER_L groin area and gives me a taunting look, taking off HIS_HER_L pants and putting HIS_HER_L privates on full display. Man, what an incredible body...");
							break;
							case SPECIES.LUCARIO:
								array_push(_lines, "NAME reads my mind before I can even ask, shusing me with HIS_HER_L paw and giving me an incredibly sensual showcase of HIS_HER_L body... I'm left speechless!");
							break;
							case SPECIES.NICKIT:
								array_push(_lines, "I remind NAME of something mischievous HE_SHE_L did recently and say I'll clean the record if HE_SHE_L lets me check HIM_HER_L out... HE_SHE giggles, poses and lets me get up close to admire HIM_HER_L!");
							break;
							case SPECIES.VULPIX:
								array_push(_lines, "I stroke NAME's hips and ask if I can get a closer look at HIS_HER_L body... HE_SHE blushes, nods and poses, letting me get my face real close to HIS_HER_L heat-radiating body!");
							break;
							case SPECIES.ZOROARK:
								array_push(_lines, "In reponse to me asking NAME to show HIS_HER_L sexy body, HE_SHE_L uses illusions to mimic and pose as several other incredibly attractive 'Mons. It's like cosplay, but better!");
							break;
						}
					}
					// High Arousal Mode
					else
					{
						// Regular
						array_push(_lines, "NAME looks very pent up, so I take off my pants and ask HIM_HER_L to pose for me. HE_SHE shows me what's good and I jerk off at the sight for a little while!");
						array_push(_lines, "There's a real audience for photos of aroused 'Mons online, so I ask NAME if HE_SHE_L's camera shy. HE_SHE giggles and lets me take some very indecent pics!");
						array_push(_lines, "I overwhelm NAME with compliments on HIS_HER_L hot body and ask if I can jerk off to HIM_HER_L. HE_SHE flusters up, but lets me stroke my shit while showing HIM_HER_Lself off!");
						array_push(_lines, "NAME and I are both horny, so I strip naked and we play a game where we try to do the hottest pose. HE_SHE stares in awe as I do mine, so I think I actually won!");
						array_push(_lines, "I'm in desperate need of busting one, so I ask NAME to give me something to look at. HE_SHE giggles and does a hot pose, after which I shower HIM_HER_L in hot spunk!");
						array_push(_lines, "I like making videos of my 'interactions', so I ask NAME to show off HIS_HER_L aroused genitals. I press record and film myself jerking off and ejaculating over them!");
									
						// Gendered
						if(_gender == GENDERS.M) 
						{
							array_push(_lines, "I point out NAME's juicy hard dick and ask HIM_HER_L to show me up close. HE_SHE blushes and shows the goods right in front of my face, while I sniff and stroke my dick...");
							array_push(_lines, "NAME is just BEGGING to be filled with cum. I tell HIM_HER_L to pose for me and jerk off to the sight, after a minute I spread HIS_HER_L asshole and blast my fat load inside!");
						}
						else 
						{
							array_push(_lines, "I point out NAME's juicy wet slit and ask HIM_HER_L to show me up close. HE_SHE blushes and shows off the goods right in front of my face, while sniff it and stroke my dick...");
							array_push(_lines, "NAME is just BEGGING to be filled with cum. I tell HIM_HER_L to pose for me and jerk off to the sight, after a minute I spread HIM_HER_L pussy and blast my fat load inside!");
						}
					}
				break;
			}
		break;	
		
		case TEXT_PROMPT_TYPE.GET_INTIMATE:
		
			var _combi_line = "";
			
			switch(_affection_level)
			{
				case AFFECTION_LEVEL.MEDIUM:
					// Regular
					_combi_line = "I decide it's time and carefully put NAME in a good position. HE_SHE gasps as I undress and begin to caress HIS_HER_L body, kissing HIS_HER_L belly and inner thighs...";
					_combi_line += "|I then gently go down on NAME for a while and use my tongue to pleasure HIS_HER_L privates. HE_SHE moans loudly and lets me use my hands to drive HIM_HER_L to orgasm.";
					_combi_line += "|HE_SHE yelps and whines as HE_SHE_L cums over my hand, twitching HIS_HER_L legs and huffing in pleasure... I clean it with my tongue and savour the taste!";
					array_push(_lines, _combi_line);
					
					_combi_line = "Time for a little massage! I put NAME on HIS_HER_L belly and get some massage oil for 'Mons from my tent. I put some on my hands and begin to massage HIS_HER_L back.";
					_combi_line += "|I slide my hands along HIS_HER_L hips and quickly move to HIS_HER_L ass, which I vigorously squish and push in all directions. NAME moans as slip two fingers in HIS_HER_L hole.";
					_combi_line += "|The intimacy of it all makes HIM_HER_L cum very quickly, leaving behind a puddle of bodily fluids under HIM_HER_L. NAME catches HIS_HER_L breath while I clean up the mess!";
					array_push(_lines, _combi_line);
					
					array_push(_lines, "FAIL I try to get NAME in the mood for some physical love, but HE_SHE_L refuses the advance. I can tell HE_SHE_L wants to, but HE_SHE_L's incredibly nervous for it!");
					
					// Gendered
					if(_gender == GENDERS.M) 
					{
						_combi_line = "I gaze into NAME's eyes as I hold HIS_HER_L head and slowly draw in for a kiss. As we gently make out, I lay HIM_HER_L to the ground and start to play with HIS_HER_L nipples...";
						_combi_line += "|NAME mutters and huffs against my breath as I start fondling HIS_HER_L balls and stroking HIS_HER_L hard cock, pleasuring the tip with the palm of my hand.";
						_combi_line += "|HE_SHE whines into my mouth as I feel HIS_HER_L musscles contract and dick throb, shooting strings of cum over himself. We break away from kissing and both pant heavily...";
						array_push(_lines, _combi_line);
						
						_combi_line = "NAME gasps and flusters as I get a masturbator sleeve from my tent, after which I undress and put HIM_HER_L in a comfortable position...";
						_combi_line += "|I lube the thing up properly and carefully press it against the tip of HIS_HER_L dick... HE_SHE yelps in surprise, but quickly breaks into frenzied moaning when I slide it up and down!";
						_combi_line += "|I speed up and slam it up and down, milking NAME for an orgasm... HE_SHE then whines and yelps as HE_SHE_L cums deep inside the masturbator, trembling and shaking!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can't hold back my lust any longer and guide NAME to a comfortable spot. I look in HIS_HER_L eyes while I spread HIS_HER_L legs and get my face close to HIS_HER_L groin...";
						_combi_line += "|HE_SHE whimpers as I carefully begin to rim HIS_HER_L cute little asshole, swirling my tongue around it and pushing it inside a little. It's very intoxicating...";
						_combi_line += "|I then use my fingers to massage NAME's prostate and make HIM_HER_L cry in pleasure as HE_SHE_L shoots a thick torrent of cum over my arm...\nGood boy!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can tell NAME needs to release, so I grab HIS_HER_L paw and comfortably lower HIM_HER_L onto HIS_HER_L back. I give HIM_HER_L a smile and get my face close to HIS_HER_L throbbing penis.";
						_combi_line += "|I whiff HIS_HER_L intoxicating scent and start licking it while playing with HIS_HER_L balls. NAME groans and pants as I begin to suck HIM_HER_L off and jerk HIS_HER_L cock intermittently.";
						_combi_line += "|When HE_SHE_L's close to orgasm, put it in as deep as I can and feel HIS_HER_L seed fill my mouth. I cough up some cum and lick up the remains while NAME pants in bliss!";
						array_push(_lines, _combi_line);
					}
					else 
					{
						_combi_line = "I gaze into NAME's eyes as I hold HIM_HER_L head and slowly draw in for a kiss. As we gently make out, I lay HIM_HER_L to the ground and start to fondle HIM_HER_L chest...";
						_combi_line += "|NAME mutters and huffs against my breath as I start fingering HIM_HER_L wet pussy, penetrating with 3 fingers and swirling HIM_HER_L clitoris with my index finger.";
						_combi_line += "|HE_SHE whines into my mouth as I feel HIM_HER_L pussy convulse violently, riding out an intense long-winded orgasm. We break away from kissing and both pant heavily...";
						array_push(_lines, _combi_line);
						
						_combi_line = "NAME gasps and flusters as I get a translucent pink dildo from my tent, after which I undress and put HIM_HER_L in a comfortable position...";
						_combi_line += "|I lube the thing up and carefully press it against HIM_HER_L pussy...\nShe yelps in surprise, but quickly breaks into frenzied moaning when I slide it in and out!";
						_combi_line += "|I ramp up the speed and jam it in deep, pushing NAME towards orgasm... HE_SHE then whines and yelps as HE_SHE_L squirts over my hand and wrist, trembling and shaking!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can't hold back my lust any longer and guide NAME to a comfortable spot. I look in HIM_HER_L eyes while I spread HIM_HER_L legs and get my face close to HIM_HER_L groin...";
						_combi_line += "|HE_SHE whimpers as I carefully begin to rim HIM_HER_L cute little asshole, swirling my tongue around it and pushing it inside a little. It's very intoxicating...";
						_combi_line += "|I then use my fingers to massage NAME's insides for a while and make HIM_HER_L cry in pleasure as HE_SHE_L squirts all over my arm...\nGood girl!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can tell NAME needs to release, so I grab HIM_HER_L paw and comfortably lower HIM_HER_L onto HIM_HER_L back. I give HIM_HER_L a smile and get my face close to HIM_HER_L quivering pussy.";
						_combi_line += "|I whiff HIM_HER_L intoxicating scent and start licking it while playing with HIM_HER_L asshole. NAME groans and pants as I begin to tongue fuck and suck on HIM_HER_L clit.";
						_combi_line += "|When HE_SHE_L's close to orgasm, put it in as deep as I can and feel HIM_HER_L squirt fill my mouth. I cough some up and lick up the remains while NAME pants in bliss!";
						array_push(_lines, _combi_line);
					}
				break;
				
				case AFFECTION_LEVEL.HIGH:
					// Regular
					_combi_line = "I decide to help out NAME and put HIM_HER_L in a good position. HE_SHE gasps as I undress and begin to caress HIM_HER_L body, kissing HIM_HER_L belly and inner thighs...";
					_combi_line += "|I then gently go down on NAME for a while and use my tongue to pleasure HIS_HER_L privates. HE_SHE moans loudly and lets me use my hands to drive HIM_HER_L to orgasm.";
					_combi_line += "|HE_SHE yelps and whines as HE_SHE_L cums over my hand, twitching HIS_HER_L legs and huffing in pleasure... I use HIS_HER_L fluid to jerk off and cum over HIS_HER_L body!";
					array_push(_lines, _combi_line);
					
					_combi_line = "Time for a little massage! I put NAME on HIS_HER_L belly and get some massage oil for 'Mons from my tent. I put some on my hands and begin to massage HIS_HER_L back.";
					_combi_line += "|I slide my hands along HIS_HER_L hips and quickly move to HIS_HER_L ass, which I vigorously squish and push in all directions. NAME moans as slip two fingers in HIS_HER_L hole.";
					_combi_line += "|The intimacy of it all makes HIM_HER_L cum very quickly, leaving behind a puddle of bodily fluids under HIM_HER_L. I use the oil to finish myself too and blast a fat load on HIM_HER_L oily ass!";
					array_push(_lines, _combi_line);
					
					_combi_line = "NAME and I both seem to be in the mood for some sexual release, so I hold HIS_HER_L head and tongue kiss HIM_HER_L to get it going... I can feel the poor thing tremble!";
					_combi_line += "|I strip naked and position NAME in a way where HIS_HER_L genitals grind against my erect dick, after which I hold one of HIS_HER_L paws and continue making out.";
					_combi_line += "|I get some motion going and it doesn't take long both of us orgasm from the intimacy and friction, covering each other's bodies in hot steamy liquid!";
					array_push(_lines, _combi_line);
					
					// Gendered
					if(_gender == GENDERS.M) 
					{
						_combi_line = "I gaze into NAME's eyes as I hold HIS_HER_L head and draw in for a kiss. As we passionately make out, I lay HIM_HER_L onto the ground and start to pleasure HIS_HER_L nipples...";
						_combi_line += "|NAME mutters and huffs against my breath as I start fondling HIS_HER_L balls and stroking HIS_HER_L hard cock, making HIM_HER_L edge a few times.";
						_combi_line += "|HE_SHE whines into my mouth as I feel HIS_HER_L musscles contract and dick throb, shooting strings of cum over himself. We break away from kissing and I finish on HIS_HER_L belly too!";
						array_push(_lines, _combi_line);
						
						_combi_line = "NAME gasps and flusters as I get an auto-stroking masturbator from my tent, after which I undress and put HIM_HER_L in a comfortable position...";
						_combi_line += "|I lube the thing up properly and engulf HIS_HER_L throbbing dick inside the thing... HE_SHE yelps in surprise, but quickly breaks into frenzied moaning when I turn the thing on!";
						_combi_line += "|I torture HIM_HER_L with the higest setting, making poor NAME cum HIS_HER_L brains out inside of it! I then use the cum-drenched thing on myself and finish as well.";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can't hold back my lust any longer and guide NAME to a comfortable spot. I look in HIS_HER_L eyes while I spread HIS_HER_L legs and get my face close to HIS_HER_L groin...";
						_combi_line += "|HE_SHE whimpers as I begin to rim HIS_HER_L cute little asshole, swirling my tongue around it and then fucking HIM_HER_L with it. The gutteral moans and sensation are incredible...";
						_combi_line += "|I then use my fingers to massage NAME's prostate while I jerk off and cum all over HIM_HER_L, making HIM_HER_L cry in pleasure as HE_SHE_L busts a fat load of HIS_HER_L own!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can tell NAME needs to release, so I grab HIS_HER_L paw and push HIM_HER_L onto HIS_HER_L back. I give HIM_HER_L a naughty smile and get my face close to HIS_HER_L throbbing penis.";
						_combi_line += "|I whiff HIS_HER_L intoxicating scent and start licking it while playing with HIS_HER_L balls. NAME groans and pants as I begin to violently suck and jerk off HIS_HER_L cock.";
						_combi_line += "|When HE_SHE_L's close, I put it in as deep as I can and feel HIS_HER_L seed fill my throat. I cough some up and use it to furiously finish all over HIS_HER_L abdomen!";
						array_push(_lines, _combi_line);
					}
					else 
					{
						_combi_line = "I gaze into NAME's eyes as I hold HIS_HER_L head and draw in for a kiss. As we passionately make out, I lay HIM_HER_L onto the ground and start to grope HIM_HER_L chest...";
						_combi_line += "|NAME mutters and huffs against my breath as I start fingering HIM_HER_L wet pussy, penetrating with 4 fingers and edging HIM_HER_L by intermittently by rubbing HIM_HER_L clitoris.";
						_combi_line += "|HE_SHE whines into my mouth as I feel HIM_HER_L pussy convulse violently, riding out an intense long-winded orgasm. We break away from kissing and I finish on HIM_HER_L belly!";
						array_push(_lines, _combi_line);
						
						_combi_line = "NAME gasps and flusters as I get a large vibrating dildo from my tent, after which I undress and put HIM_HER_L in a comfortable position...";
						_combi_line += "|I whirr the thing to life on a low setting and press it against HIM_HER_L wet pussy... HE_SHE yelps in surprise, but quickly breaks into frenzied moaning when I slide it in and out!";
						_combi_line += "|I maximize the power setting and jam it in deep, making poor NAME whine and cum HIM_HER_L brains out! I then pleasure my dick with it and orgasm as well.";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can't hold back my lust any longer and guide NAME to a comfortable spot. I look in HIM_HER_L eyes while I spread HIM_HER_L legs and get my face close to HIM_HER_L groin...";
						_combi_line += "|HE_SHE whimpers as I begin to rim HIM_HER_L cute little asshole, swirling my tongue around it and then fucking HIM_HER_L with it. The gutteral moans and sensation are incredible...";
						_combi_line += "|I then use my fingers to massage NAME's insides while I jerk off and cum all over HIM_HER_L, making HIM_HER_L cry in pleasure as HE_SHE_L squirts all over my arm... Good girl!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can tell NAME needs to release, so I grab HIM_HER_L paw and push HIM_HER_L onto HIM_HER_L back. I give HIM_HER_L a nauthy smile and get my face close to HIM_HER_L quivering pussy.";
						_combi_line += "|I whiff HIM_HER_L intoxicating scent and start licking it while playing with HIM_HER_L asshole. NAME groans and pants as I begin to tongue fuck and suck on HIM_HER_L clit.";
						_combi_line += "|When HE_SHE_L's close, I push my tongue in deep and feel HIM_HER_L squirt fill my mouth. I cough some up and use it to furiously finish myself off over HIM_HER_L pussy!";
						array_push(_lines, _combi_line);
					}
					
					switch(_species)
					{
						case SPECIES.ALOLANVULPIX:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in hot water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the heated lube onto NAME's ice cold dick and butthole, making it sizzle and rubbing it in. NAME shrieks in pleasure!";
								_combi_line += "|I jerk both of us off using the hot lube and reapply it regularly, making us both empty our nuts all over each other. That was really hot... Literally!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in hot water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the heated lube onto NAME's ice cold pussy and butthole, making it sizzle and rubbing it in. NAME shrieks in pleasure!";
								_combi_line += "|I jerk myself off and finger NAME with the hot lube, making both of us release our bodily fluids all over each other. That was really hot... Literally!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.BRAIXEN:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I take NAME's stick from HIS_HER_L tail and hold it against HIS_HER_L nose, pushing HIM_HER_L down onto HIS_HER_L back. I lube the warm side up and swirl it around HIS_HER_L cute little boy hole.";
								_combi_line += "|I push the thing inside as far as is goes, making HIM_HER_L grit HIS_HER_L teeth while HE_SHE_L adjusts to it. I start jerking off to HIS_HER_L loud moaning as I fuck HIS_HER_L tight hole with the stick.";
								_combi_line += "|The prostate pounding makes HIM_HER_L orgasm and I remove the stick, cumming on it and letting it drip on HIS_HER_L cute face. HE_SHE then takes it back in puts it in HIS_HER_L tail... Hot!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I take NAME's stick from HIM_HER_L tail and hold it against HIM_HER_L nose, pushing HIM_HER_L down onto HIM_HER_L back. I lube the warm side up and swirl it around HIM_HER_L swolen wet pussy.";
								_combi_line += "|I push the thing inside as far as is goes, making HIM_HER_L grit HIM_HER_L teeth while HE_SHE_L adjusts to it. I start jerking off to HIM_HER_L loud moaning as I fuck HIM_HER_L tight hole with the stick.";
								_combi_line += "|The girth makes HIM_HER_L orgasm multiple times and I remove the stick, cumming on it and letting it drip on HIS_HER_L cute face. HE_SHE then takes it back in puts it in HIM_HER_L tail... Hot!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.CINDERACE:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I have a fun idea for an endurance test and get a heartbeat monitor from my tent, putting the nodes on NAME's chest. HE_SHE looks curious as I lay HIM_HER_L down.";
								_combi_line += "|I lube up my hand with some spit and start jerking HIM_HER_L off, as well as using my mouth to get HIS_HER_L heartrate up. The monitor starts beeping faster and faster as I speed up...";
								_combi_line += "|NAME reaches HIS_HER_L limit at around 155 bpm and cums all over my face, after which I jerk off and cum to the sound of HIS_HER_L heartbeat going crazy. That was strangely hot!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I have a fun idea for an endurance test and get a heartbeat monitor from my tent, putting the nodes on NAME's chest. HE_SHE looks curious as I lay HIM_HER_L down.";
								_combi_line += "|I lube up my hand with some spit and start rubbing HIM_HER_L clit, as well as using my mouth to get HIS_HER_L heartrate up. The monitor starts beeping faster and faster as I speed up...";
								_combi_line += "|NAME reaches HIM_HER_L limit at around 155 bpm and squirts all over my face, after which I jerk off and cum to the sound of HIM_HER_L heartbeat going crazy. That was strangely hot!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.LUCARIO:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I know NAME's aura sensors are incredibly sensitive, so I get some nipple clamps I brought and sit HIM_HER_L down on my lap. HE_SHE looks slightly concerned, but trusts me on this...";
								_combi_line += "|NAME yelps as I clamp them on, but the shock quickly turns into uncontrolable moaning as I start jerking HIM_HER_L off. I gently tug on the clamps and feel HIS_HER_L aura spike!";
								_combi_line += "|NAME cums extremely hard and HIS_HER_L aura sends a shock of pleasure through me, making me instantly cum as well. I take off the clamps and make out with HIM_HER_L for a bit!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I know NAME's aura sensors are incredibly sensitive, so I get some nipple clamps I brought and sit HIM_HER_L down on my lap. HE_SHE looks slightly concerned, but trusts me on this...";
								_combi_line += "|NAME yelps as I clamp them on, but the shock quickly turns into uncontrolable moaning as I start fingering HIM_HER_L. I gently tug on the clamps and feel HIM_HER_L aura spike!";
								_combi_line += "|NAME cums extremely hard and HIM_HER_L aura sends a shock of pleasure through me, making me instantly cum as well. I take off the clamps and make out with HIM_HER_L for a bit!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.NICKIT:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I still haven't forgotten all the times NAME stole my shit and acted like a menace, so I decide to teach the little rat a lesson. NAME audibly gulps as I blindfold and gag HIM_HER_L.";
								_combi_line += "|I get a vibrator wand and anal beads from my tent and pin NAME between my knees, teasing HIM_HER_L with the toys I brought. HE_SHE whines in pleasure when I put the beads in!";
								_combi_line += "|After denying HIM_HER_L orgasm for a while, the toys become too much and HE_SHE_L violently cums over my body. I look down at poor gagged NAME and finish to the arousing sight!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I still haven't forgotten all the times NAME stole my shit and acted like a menace, so I decide to teach the little rat a lesson. NAME audibly gulps as I blindfold and gag HIM_HER_L.";
								_combi_line += "|I get a vibrator wand and anal beads from my tent and pin NAME between my knees, teasing HIM_HER_L with the toys I got. HE_SHE whines in pleasure when I put the beads in!";
								_combi_line += "|After denying HIM_HER_L orgasm for a while, the toys become too much and HE_SHE_L violently cums. I look down at poor gagged NAME and finish to the arousing sight!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.VULPIX:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in ice water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the freezing lube onto NAME's searing hot dick and butthole, making it sizzle and evaporate. NAME shrieks in pleasure!";
								_combi_line += "|I jerk both of us off using the cold lube and reapply it regularly, making us both empty our nuts all over each other. That was pretty cool... Literally!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in ice water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the freezing lube onto NAME's searing hot pussy and butthole, making it sizzle and evaporate. NAME shrieks in pleasure!";
								_combi_line += "|I jerk myself off and finger NAME with the cold lube, making both of us release our bodily fluids all over each other. That was pretty cool... Literally!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.ZOROARK:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "Since NAME always acts so parental, I get a fun idea and get some sex toy eggs from my tent. HIS_HER face beams at the sight of them and I sit HIM_HER_L down with legs spread.";
								_combi_line += "|I take one of the eggs and push it inside HIS_HER_L ass, making HIM_HER_L huff and grit HIS_HER_L teeth. I add more and more until HE_SHE_L's all filled up, making HIM_HER_L moan and huff.";
								_combi_line += "|NAME cries out in pleasure and orgasms as HE_SHE_L pushes the eggs out one by one, while I jerk off to the sight of it. I cum over HIS_HER_L abdomen and then spoon with HIM_HER_L!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "Since NAME always acts so motherly, I get a fun idea and get some sex toy eggs from my tent. HIM_HER face beams at the sight of them and I sit HIM_HER_L down with legs spread.";
								_combi_line += "|I take one of the eggs and push it inside HIM_HER_L pussy, making HIM_HER_L huff and grit HIM_HER_L teeth. I add more and more until they reach HIM_HER_L cervix, making HIM_HER_L moan and huff.";
								_combi_line += "|NAME cries out in pleasure and orgasms as HE_SHE_L pushes the eggs out one by one, while I jerk off to the sight of it. I cum over HIM_HER_L abdomen and then spoon with HIM_HER_L!";
								array_push(_lines, _combi_line);
							}
						break;
					}
				break;
				
				case AFFECTION_LEVEL.MAX:
					// Regular
					_combi_line = "I decide to help out NAME and put HIM_HER_L in a good position. HE_SHE gasps as I undress and begin to caress HIM_HER_L body, kissing HIM_HER_L belly and inner thighs...";
					_combi_line += "|I then gently go down on NAME for a while and use my tongue to pleasure HIS_HER_L privates. HE_SHE moans loudly and lets me use my hands to drive HIM_HER_L to orgasm.";
					_combi_line += "|HE_SHE yelps and whines as HE_SHE_L cums over my hand, twitching HIS_HER_L legs and huffing in pleasure... I use HIS_HER_L fluid to jerk off and cum over HIS_HER_L body!";
					array_push(_lines, _combi_line);
					
					_combi_line = "Time for a little massage! I put NAME on HIS_HER_L belly and get some massage oil for 'Mons from my tent. I put some on my hands and begin to massage HIS_HER_L back.";
					_combi_line += "|I slide my hands along HIS_HER_L hips and quickly move to HIS_HER_L ass, which I vigorously squish and push in all directions. NAME moans as slip two fingers in HIS_HER_L hole.";
					_combi_line += "|The intimacy of it all makes HIM_HER_L cum very quickly, leaving behind a puddle of bodily fluids under HIM_HER_L. I use the oil to finish myself too and blast a fat load on HIM_HER_L oily ass!";
					array_push(_lines, _combi_line);
					
					_combi_line = "NAME and I both seem to be in the mood for some sexual release, so I hold HIS_HER_L head and tongue kiss HIM_HER_L to get it going... I can feel the poor thing tremble!";
					_combi_line += "|I strip naked and position NAME in a way where HIS_HER_L genitals grind against my erect dick, after which I hold one of HIS_HER_L paws and continue making out.";
					_combi_line += "|I get some motion going and it doesn't take long both of us orgasm from the intimacy and friction, covering each other's bodies in hot steamy liquid!";
					array_push(_lines, _combi_line);
					
					_combi_line = "NAME is desperately pawing at my cock, so I undress and push my erect dick in HIS_HER_L face. HE_SHE begins to immediately lick and suck if off, tasting my salty precum.";
					_combi_line += "|I push NAME onto the ground and get in 69 position so I can get to work on HIM_HER_L as well. The air is filled with muffled moans and vigorous sucking noises.";
					_combi_line += "|NAME cums in my mouth first, but I quickly follow and empty my fat nuts in HIS_HER_L cute little mouth. I roll over and we lay there for a while to recover!";
					array_push(_lines, _combi_line);
					
					if(_mon_count > 2)
					{
						_combi_line = "Sometimes you gotta share, so I lay down NAME on HIS_HER_L back and call over another 'Mon, telling them to give HIM_HER_L fun parts some oral love.";
						_combi_line += "|The 'Mon gets to work while I press my dick inside NAME's throat, making HIM_HER_L gag a few times. Once HE_SHE_L's ready, I start humping and groping HIS_HER_L chest.";
						_combi_line += "|The other 'Mon is working some magic and succesfully makes NAME cum really hard, after which I blast HIM_HER_L stomach full of hot semen!";
						array_push(_lines, _combi_line);
					}
					if(_mon_count > 4)
					{
						_combi_line = "I'm in the mood for a good orgy, so I call over a few other 'Mons. They instantly get aroused seeing NAME, pushing HIM_HER_L onto HIS_HER_L back and mounting HIM_HER_L.";
						_combi_line += "|NAME is making loud muffled moans as one fucks HIS_HER_L face, another destroys HIS_HER_L love hole and the rest fucks each other right next to HIM_HER_L. Holy shit this is hot...";
						_combi_line += "|I claim NAME's rear side next and speed-fuck it, after which I pull out and initiate a huge bukake. All 'Mons cum over HIM_HER_L, leaving HIM_HER_L drenched in semen!";
						array_push(_lines, _combi_line);
					}
					
					// Gendered
					if(_gender == GENDERS.M) 
					{
						_combi_line = "I gaze into NAME's eyes as I hold HIS_HER_L head and draw in for a kiss. As we passionately make out, I lay HIM_HER_L onto the ground and start to pleasure HIS_HER_L nipples...";
						_combi_line += "|NAME mutters and huffs against my breath as I start fondling HIS_HER_L balls and stroking HIS_HER_L hard cock, making HIM_HER_L edge a few times.";
						_combi_line += "|HE_SHE whines into my mouth as I feel HIS_HER_L musscles contract and dick throb, shooting strings of cum over himself. We break away from kissing and I finish on HIS_HER_L belly too!";
						array_push(_lines, _combi_line);
						
						_combi_line = "NAME gasps and flusters as I get an auto-stroking masturbator from my tent, after which I undress and put HIM_HER_L in a comfortable position...";
						_combi_line += "|I lube the thing up properly and engulf HIS_HER_L throbbing dick inside the thing... HE_SHE yelps in surprise, but quickly breaks into frenzied moaning when I turn the thing on!";
						_combi_line += "|I torture HIM_HER_L with the higest setting, making poor NAME cum HIS_HER_L brains out inside of it! I then use the cum-drenched thing on myself and finish as well.";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can't hold back my lust any longer and guide NAME to a comfortable spot. I look in HIS_HER_L eyes while I spread HIS_HER_L legs and get my face close to HIS_HER_L groin...";
						_combi_line += "|HE_SHE whimpers as I begin to rim HIS_HER_L cute little asshole, swirling my tongue around it and then fucking HIM_HER_L with it. The gutteral moans and sensation are incredible...";
						_combi_line += "|I then use my fingers to massage NAME's prostate while I jerk off and cum all over HIM_HER_L, making HIM_HER_L cry in pleasure as HE_SHE_L busts a fat load of HIS_HER_L own!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can tell NAME needs to release, so I grab HIS_HER_L paw and push HIM_HER_L onto HIS_HER_L back. I give HIM_HER_L a naughty smile and get my face close to HIS_HER_L throbbing penis.";
						_combi_line += "|I whiff HIS_HER_L intoxicating scent and start licking it while playing with HIS_HER_L balls. NAME groans and pants as I begin to violently suck and jerk off HIS_HER_L cock.";
						_combi_line += "|When HE_SHE_L's close, I put it in as deep as I can and feel HIS_HER_L seed fill my throat. I cough some up and use it to furiously finish all over HIS_HER_L abdomen!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I am desperately in need of some NAME anal, so I strip naked and put NAME in doggystyle position. I lube up HIS_HER_L tight asshole and press against it...";
						_combi_line += "|I slide in, making HIM_HER_L yelp at the sudden adjustment. When HE_SHE_L's ready, I grab HIS_HER_L hips and start slamming my balls against HIS_HER_L cute ass, making HIM_HER_L whine in pleasure!";
						_combi_line += "|The air reeks of sex as NAME's cums onto the ground, shortly after which I pull out and shower HIS_HER_L backside with a fat load of cum. Hah, just what I needed...";
						array_push(_lines, _combi_line);
						
						_combi_line = "I realize I've only topped so far and have always been curious about bottoming a 'Mon... I strip naked, lather my ass in lube and gesture NAME to hop on.";
						_combi_line += "|HE_SHE's surprised at the role swap, but then somewhat awkwardly mounts me and slides HIS_HER_L warm dick inside. It hurts at first, but then I start to feel it jab my prostate!";
						_combi_line += "|NAME fucks me like an animal, then jamming it deep inside and filling me with HIS_HER_L hot seed! I cum quite intensely and fall to my chest... That was eye opening.";
						array_push(_lines, _combi_line);
					}
					else 
					{
						_combi_line = "I gaze into NAME's eyes as I hold HIS_HER_L head and draw in for a kiss. As we passionately make out, I lay HIM_HER_L onto the ground and start to grope HIM_HER_L chest...";
						_combi_line += "|NAME mutters and huffs against my breath as I start fingering HIM_HER_L wet pussy, penetrating with 4 fingers and edging HIM_HER_L by intermittently by rubbing HIM_HER_L clitoris.";
						_combi_line += "|HE_SHE whines into my mouth as I feel HIM_HER_L pussy convulse violently, riding out an intense long-winded orgasm. We break away from kissing and I finish on HIM_HER_L belly!";
						array_push(_lines, _combi_line);
						
						_combi_line = "NAME gasps and flusters as I get a large vibrating dildo from my tent, after which I undress and put HIM_HER_L in a comfortable position...";
						_combi_line += "|I whirr the thing to life on a low setting and press it against HIM_HER_L wet pussy... HE_SHE yelps in surprise, but quickly breaks into frenzied moaning when I slide it in and out!";
						_combi_line += "|I maximize the power setting and jam it in deep, making poor NAME whine and cum HIM_HER_L brains out! I then pleasure my dick with it and orgasm as well.";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can't hold back my lust any longer and guide NAME to a comfortable spot. I look in HIM_HER_L eyes while I spread HIM_HER_L legs and get my face close to HIM_HER_L groin...";
						_combi_line += "|HE_SHE whimpers as I begin to rim HIM_HER_L cute little asshole, swirling my tongue around it and then fucking HIM_HER_L with it. The gutteral moans and sensation are incredible...";
						_combi_line += "|I then use my fingers to massage NAME's insides while I jerk off and cum all over HIM_HER_L, making HIM_HER_L cry in pleasure as HE_SHE_L squirts all over my arm... Good girl!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I can tell NAME needs to release, so I grab HIM_HER_L paw and push HIM_HER_L onto HIM_HER_L back. I give HIM_HER_L a nauthy smile and get my face close to HIM_HER_L quivering pussy.";
						_combi_line += "|I whiff HIM_HER_L intoxicating scent and start licking it while playing with HIM_HER_L asshole. NAME groans and pants as I begin to tongue fuck and suck on HIM_HER_L clit.";
						_combi_line += "|When HE_SHE_L's close, I push my tongue in deep and feel HIM_HER_L squirt fill my mouth. I cough some up and use it to furiously finish myself off over HIM_HER_L pussy!";
						array_push(_lines, _combi_line);
						
						_combi_line = "I am desperately in need of some NAME anal, so I strip naked and put NAME in doggystyle position. I lube up HIM_HER_L tight asshole and press against it...";
						_combi_line += "|I slide in, making HIM_HER_L yelp at the sudden adjustment. When HE_SHE_L's ready, I grab HIM_HER_L hips and start slamming my balls against HIM_HER_L cute ass, making HIM_HER_L whine in pleasure!";
						_combi_line += "|The air reeks of sex as NAME's has a powerful orgasm, shortly after which I pull out and shower HIM_HER_L backside with a fat load of cum. Hah, just what I needed...";
						array_push(_lines, _combi_line);
						
						_combi_line = "I realize I've only topped so far and have always been curious about bottoming a 'Mon... I equip NAME with a compatible 'Mon themed strap-on and lube up my ass.";
						_combi_line += "|HE_SHE's surprised at the role swap, but then somewhat awkwardly mounts me and slides HIM_HER_L silicone dick inside. It hurts at first, but then I start to feel it jab my prostate!";
						_combi_line += "|NAME fucks me like an animal, making me moan embarassingly hard! I cum quite intensely hands-free and fall to my chest... That was eye opening.";
						array_push(_lines, _combi_line);
					}
					
					switch(_species)
					{
						case SPECIES.ALOLANVULPIX:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in hot water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the heated lube onto NAME's ice cold dick and butthole, making it sizzle and rubbing it in. NAME shrieks in pleasure!";
								_combi_line += "|I jerk both of us off using the hot lube and reapply it regularly, making us both empty our nuts all over each other. That was really hot... Literally!";
								array_push(_lines, _combi_line);
								
								_combi_line = "The sensation of fucking ice types is so amazing, I can't stop thinking about it. I make out with NAME and then lay HIM_HER_L on HIS_HER_L belly, spreading HIS_HER_L asscheeks.";
								_combi_line += "|HE_SHE huffs in pleasure as I lube up and slide my warm cock inside, it makes my entire groin area freeze and tingle! I let out a gutteral moan as I start pumping HIS_HER_L cute hole.";
								_combi_line += "|I grab HIS_HER_L waist and lift HIM_HER_L to my chest, using HIM_HER_L as a sleeve before cumming deep inside HIS_HER_L ice cold body! I feel NAME's cum drip on my legs as well...";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in hot water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the heated lube onto NAME's ice cold pussy and butthole, making it sizzle and rubbing it in. NAME shrieks in pleasure!";
								_combi_line += "|I jerk myself off and finger NAME with the hot lube, making both of us release our bodily fluids all over each other. That was really hot... Literally!";
								array_push(_lines, _combi_line);
								
								_combi_line = "The sensation of fucking ice types is so amazing, I can't stop thinking about it. I make out with NAME and then lay HIM_HER_L on HIM_HER_L belly, spreading HIM_HER_L asscheeks.";
								_combi_line += "|HE_SHE huffs in pleasure as I lube up and slide my warm cock inside, it makes my entire groin area freeze and tingle! I let out a gutteral moan as I start pumping HIM_HER_L cute hole.";
								_combi_line += "|I grab HIM_HER_L waist and lift HIM_HER_L to my chest, using HIM_HER_L as a sleeve before cumming deep inside HIM_HER_L ice cold body! I feel NAME's pussy drip on my legs as well...";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.BRAIXEN:
							_combi_line = "Since NAME enjoys dancing and performing, I get some incredibly slutty lingerie from my suitcase and put it on HIM_HER_L. I take a pic and HE_SHE_L flusters when I show HIM_HER_L!";
							_combi_line += "|I sit down and ask for a special dance, seconds later I'm getting the lapdance of my dreams... I smack HIS_HER_L ass and runs my hands along HIM_HER_L while HE_SHE_L wiggles HIS_HER_L_ ass.";
							_combi_line += "|After a while we face each other and begin to fuck, sitting cowgirl position. We both orgasm extremely quickly due to the buildup and make out afterwards!";
							array_push(_lines, _combi_line);
								
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I take NAME's stick from HIS_HER_L tail and hold it against HIS_HER_L nose, pushing HIM_HER_L down onto HIS_HER_L back. I lube the warm side up and swirl it around HIS_HER_L cute little boy hole.";
								_combi_line += "|I push the thing inside as far as is goes, making HIM_HER_L grit HIS_HER_L teeth while HE_SHE_L adjusts to it. I start jerking off to HIS_HER_L loud moaning as I fuck HIS_HER_L tight hole with the stick.";
								_combi_line += "|The prostate pounding makes HIM_HER_L orgasm and I remove the stick, cumming on it and letting it drip on HIS_HER_L cute face. HE_SHE then takes it back in puts it in HIS_HER_L tail... Hot!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I take NAME's stick from HIM_HER_L tail and hold it against HIM_HER_L nose, pushing HIM_HER_L down onto HIM_HER_L back. I lube the warm side up and swirl it around HIM_HER_L swolen wet pussy.";
								_combi_line += "|I push the thing inside as far as is goes, making HIM_HER_L grit HIM_HER_L teeth while HE_SHE_L adjusts to it. I start jerking off to HIM_HER_L loud moaning as I fuck HIM_HER_L tight hole with the stick.";
								_combi_line += "|The girth makes HIM_HER_L orgasm multiple times and I remove the stick, cumming on it and letting it drip on HIS_HER_L cute face. HE_SHE then takes it back in puts it in HIM_HER_L tail... Hot!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.CINDERACE:
							if(_mon_count > 3)
							{
								_combi_line = "NAME always wins when we play soccer with everyone, so I conspire with my other 'Mons and wait out the game. After NAME heads off to change we ambush HIM_HER_L!";
								_combi_line += "|Caught with HIM_HER_L pants down in the tent, we coördinate a nice locker room gangbang and dogpile NAME, fucking HIM_HER_L using every available hole, paw and foot!";
								_combi_line += "|NAME yells out in pleasure and cums multiple times, while me and the assailants keep fucking and finishing on HIS_HER_L ravaged body. The tent smells like sweat and sex!";
								array_push(_lines, _combi_line);
							}
							
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I have a fun idea for an endurance test and get a heartbeat monitor from my tent, putting the nodes on NAME's chest. HE_SHE looks curious as I lay HIM_HER_L down.";
								_combi_line += "|I lube up my hand with some spit and start jerking HIM_HER_L off, as well as using my mouth to get HIS_HER_L heartrate up. The monitor starts beeping faster and faster as I speed up...";
								_combi_line += "|NAME reaches HIS_HER_L limit at around 155 bpm and cums all over my face, after which I jerk off and cum to the sound of HIS_HER_L heartbeat going crazy. That was strangely hot!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I have a fun idea for an endurance test and get a heartbeat monitor from my tent, putting the nodes on NAME's chest. HE_SHE looks curious as I lay HIM_HER_L down.";
								_combi_line += "|I lube up my hand with some spit and start rubbing HIM_HER_L clit, as well as using my mouth to get HIS_HER_L heartrate up. The monitor starts beeping faster and faster as I speed up...";
								_combi_line += "|NAME reaches HIM_HER_L limit at around 155 bpm and squirts all over my face, after which I jerk off and cum to the sound of HIM_HER_L heartbeat going crazy. That was strangely hot!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.LUCARIO:
							_combi_line = "All I want is be be deep inside NAME's body and soul at the same time. I get some pretty mild edibles from my secret stash and convince NAME to take one with me.";
							_combi_line += "|The effects come quick and we both get light-headed! The gentle buzz and making out makes our aura connection so incredibly deep, I can virtually talk with HIM_HER_L!";
							_combi_line += "|We loudly moan and exchange embarassing 'I love yous' as I mating-press fuck HIM_HER_L and cum deep inside... We roll on our sides and make out while the buzz settles!";
							array_push(_lines, _combi_line);
							
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I know NAME's aura sensors are incredibly sensitive, so I get some nipple clamps I brought and sit HIM_HER_L down on my lap. HE_SHE looks slightly concerned, but trusts me on this...";
								_combi_line += "|NAME yelps as I clamp them on, but the shock quickly turns into uncontrolable moaning as I start jerking HIM_HER_L off. I gently tug on the clamps and feel HIS_HER_L aura spike!";
								_combi_line += "|NAME cums extremely hard and HIS_HER_L aura sends a shock of pleasure through me, making me instantly cum as well. I take off the clamps and make out with HIM_HER_L for a bit!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I know NAME's aura sensors are incredibly sensitive, so I get some nipple clamps I brought and sit HIM_HER_L down on my lap. HE_SHE looks slightly concerned, but trusts me on this...";
								_combi_line += "|NAME yelps as I clamp them on, but the shock quickly turns into uncontrolable moaning as I start fingering HIM_HER_L. I gently tug on the clamps and feel HIM_HER_L aura spike!";
								_combi_line += "|NAME cums extremely hard and HIM_HER_L aura sends a shock of pleasure through me, making me instantly cum as well. I take off the clamps and make out with HIM_HER_L for a bit!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.NICKIT:
							if(_mon_count > 3)
							{
								_combi_line = "I've kept score on accusations other 'Mons have made against NAME's rampant thievery, so I whistle them over. They don't look pleased and NAME gulps while smiling!";
								_combi_line += "|I smirk and hold NAME down, inviting the others to have their way with HIM_HER_L! It doesn't take long before all victims are fucking HIM_HER_L senseless to blow off steam!";
								_combi_line += "|HE_SHE moans helplessly as multiple 'Mons empty their nuts on HIM_HER_L, leaving HIM_HER_L trembling inside a pool of cum... I finish off with my own load, justice was served today!";
								array_push(_lines, _combi_line);
							}
							
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I still haven't forgotten all the times NAME stole my shit and acted like a menace, so I decide to teach the little rat a lesson. NAME audibly gulps as I blindfold and gag HIM_HER_L.";
								_combi_line += "|I get a vibrator wand and anal beads from my tent and pin NAME between my knees, teasing HIM_HER_L with the toys I brought. HE_SHE whines in pleasure when I put the beads in!";
								_combi_line += "|After denying HIM_HER_L orgasm for a while, the toys become too much and HE_SHE_L violently cums over my body. I look down at poor gagged NAME and finish to the arousing sight!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I still haven't forgotten all the times NAME stole my shit and acted like a menace, so I decide to teach the little rat a lesson. NAME audibly gulps as I blindfold and gag HIM_HER_L.";
								_combi_line += "|I get a vibrator wand and anal beads from my tent and pin NAME between my knees, teasing HIM_HER_L with the toys I got. HE_SHE whines in pleasure when I put the beads in!";
								_combi_line += "|After denying HIM_HER_L orgasm for a while, the toys become too much and HE_SHE_L violently cums. I look down at poor gagged NAME and finish to the arousing sight!";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.VULPIX:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in ice water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the freezing lube onto NAME's searing hot dick and butthole, making it sizzle and evaporate. NAME shrieks in pleasure!";
								_combi_line += "|I jerk both of us off using the cold lube and reapply it regularly, making us both empty our nuts all over each other. That was pretty cool... Literally!";
								array_push(_lines, _combi_line);
								
								_combi_line = "The hot sensation of fucking a NAME is so amazing, I can't stop thinking about it. I make out with NAME and then lay HIM_HER_L on HIS_HER_L belly, spreading HIS_HER_L asscheeks.";
								_combi_line += "|HE_SHE huffs in pleasure as I lube up and slide my warm cock inside, the intense heat is making it sensitive and tingly! I let out a gutteral moan as I start pumping HIS_HER_L cute hole.";
								_combi_line += "|I grab HIS_HER_L waist and lift HIM_HER_L to my chest, using HIM_HER_L as a sleeve before cumming deep inside HIS_HER_L hot body! I feel NAME's cum drip on my legs as well...";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "I think of something fun to do with NAME and decide on trying some temperature play. I plunge a sealed bottle of water-based lube in ice water and get HIM_HER_L ready.";
								_combi_line += "|I take the bottle and leak the freezing lube onto NAME's searing hot pussy and butthole, making it sizzle and evaporate. NAME shrieks in pleasure!";
								_combi_line += "|I jerk myself off and finger NAME with the cold lube, making both of us release our bodily fluids all over each other. That was pretty cool... Literally!";
								array_push(_lines, _combi_line);
								
								_combi_line = "The hot sensation of fucking a NAME is so amazing, I can't stop thinking about it. I make out with NAME and then lay HIM_HER_L on HIM_HER_L belly, spreading HIM_HER_L asscheeks.";
								_combi_line += "|HE_SHE huffs in pleasure as I lube up and slide my warm cock inside, the intense heat is making it sensitive and tingly! I let out a gutteral moan as I start pumping HIM_HER_L cute hole.";
								_combi_line += "|I grab HIM_HER_L waist and lift HIM_HER_L to my chest, using HIM_HER_L as a sleeve before cumming deep inside HIM_HER_L hot body! I feel NAME's pussy drip on my legs as well...";
								array_push(_lines, _combi_line);
							}
						break;
						case SPECIES.ZOROARK:
							if(_gender == GENDERS.M) 
							{
								_combi_line = "Since NAME always acts so parental, I get a fun idea and get some sex toy eggs from my tent. HIS_HER face beams at the sight of them and I sit HIM_HER_L down with legs spread.";
								_combi_line += "|I take one of the eggs and push it inside HIS_HER_L ass, making HIM_HER_L huff and grit HIS_HER_L teeth. I add more and more until HE_SHE_L's all filled up, making HIM_HER_L moan and huff.";
								_combi_line += "|NAME cries out in pleasure and orgasms as HE_SHE_L pushes the eggs out one by one, while I jerk off to the sight of it. I cum over HIS_HER_L abdomen and then spoon with HIM_HER_L!";
								array_push(_lines, _combi_line);
								
								_combi_line = "I can't get the thought of making NAME a father out of my head, so I propose a little role-play. HE_SHE excitedly casts an illusion that transforms me into a female NAME!";
								_combi_line += "|After putting a condom on HIM_HER_L and fitting HIS_HER_L cock in my new pussy, NAME begins to lovingly fuck and caress me. Halfway, I remove the condom and beg HIM_HER_L to impregnate me!";
								_combi_line += "|HE_SHE nods, violently fucks me and then cums deep inside me. HE_SHE pulls out and makes me 'lay eggs' through an illusion, after which we hold each other and pretend they're ours!";
								array_push(_lines, _combi_line);
							}
							else
							{
								_combi_line = "Since NAME always acts so motherly, I get a fun idea and get some sex toy eggs from my tent. HIM_HER face beams at the sight of them and I sit HIM_HER_L down with legs spread.";
								_combi_line += "|I take one of the eggs and push it inside HIM_HER_L pussy, making HIM_HER_L huff and grit HIM_HER_L teeth. I add more and more until they reach HIM_HER_L cervix, making HIM_HER_L moan and huff.";
								_combi_line += "|NAME cries out in pleasure and orgasms as HE_SHE_L pushes the eggs out one by one, while I jerk off to the sight of it. I cum over HIM_HER_L abdomen and then spoon with HIM_HER_L!";
								array_push(_lines, _combi_line);
								
								_combi_line = "I can't get the thought of putting kids inside NAME out of my head, so I propose a little role-play. HE_SHE excitedly casts an illusion that transforms me into a male NAME!";
								_combi_line += "|After putting a condom on and fitting my fancy cock in NAME's pussy, I begin to lovingly fuck and caress HIM_HER_L. Halfway, I remove the condom and ask to impregnate HIM_HER_L.";
								_combi_line += "|HE_SHE begs for it, so I violently fuck HIM_HER_L and cum deep inside HIM_HER_L. I pull out and HE_SHE_L 'lays eggs' through an illusion, after which we hold each other and pretend they're ours!";
								array_push(_lines, _combi_line);
							}
						break;
					}
				break;
			}
		break;
		
		
		
		case TEXT_PROMPT_TYPE.SCENE_START:
			// First Time Sex toggle (need to make sure affection is raised to MAX AFTER sex scene)
			if(_affection_level != AFFECTION_LEVEL.MAX)
			{
				// Regular
				array_push(_lines, "With the tent closed I gently start taking off my clothes. NAME is very nervous for HIS_HER_L first time with me, but I take it slow with some foreplay until HE_SHE_L's ready!");
				array_push(_lines, "My and NAME's hearts thump in our throats as we get ready to mate for the first time! Nerves make room for desire after some kissing, we're now ready to breed...");
				array_push(_lines, "There, some privacy for our special moment! We take the edge off by making out and gently feeling each other up, after which I press my dick against HIS_HER_L soft lips...");
				array_push(_lines, "The air thickens when I close the tent, we stare at the bed it's going to happen on... I calm NAME's nerves with some foreplay and get us ready for our first time!");
				array_push(_lines, "Everything feels so sudden now that it's finally happening, NAME seems quite tense! I comfort HIM_HER_L by slowly building up and introducing my cock to HIM_HER_L gently...");
					
				// Gendered
				if(_gender == GENDERS.M) 
				{
					array_push(_lines, "Tension rises as the tent closes, but NAME softens up when I pet HIS_HER_L abdomen and gently stroke HIS_HER_L penis until it's rock hard. At last, the time to breed has come!");
					array_push(_lines, "NAME and I gaze into each others eyes and express our puppy love by making out passionately! I stroke HIS_HER_L shy erection until it's hard and get us position...");
				}
				else 
				{
					array_push(_lines, "Tension rises as the tent closes, but NAME softens up when I pet HIM_HER_L abdomen and gently rub HIM_HER_L pussy until it's nicely wet. At last, the time to breed has come!");
					array_push(_lines, "NAME and I gaze into each others eyes and express our puppy love by making out passionately! I finger HIM_HER_L yearning pussy until it's all wet and get us position...");
				}
						
				switch(_species)
				{
					case SPECIES.ALOLANVULPIX:
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "I lay down NAME's tender white body and gently jerk HIM_HER_L off to get HIM_HER_L hard. First times can be scary, so I gently slide my dick inside HIS_HER_L cold maw...");
						}
						else
						{
							array_push(_lines, "I lay down NAME's tender white body and gently finger HIM_HER_L to get us started. First times can be scary, so I gently slide my dick inside HIM_HER_L cold maw...");
						}
					break;
					case SPECIES.BRAIXEN:
						array_push(_lines, "NAME's flamboyant demeanor makes place for nerves as we get ready for our first time! I romantically make out with HIM_HER_L to ease the mood before we begin...");
					break;
					case SPECIES.CINDERACE:
						array_push(_lines, "NAME's confidence dampens now that things are getting real, so I help HIM_HER_L undress and calmingly caress HIS_HER_L body. When HE_SHE_L's ready, I kneel HIM_HER_L down...");
					break;
					case SPECIES.LUCARIO:
						array_push(_lines, "NAME is as nervous as HE_SHE_L's excited when I close the tent, but as I reassure and kiss HIM_HER_L I feel HIS_HER_L aura soften up! I lay HIM_HER_L on top of me and gently introduce my dick...");
					break;
					case SPECIES.NICKIT:
						array_push(_lines, "NAME and I did some kinky stuff already, but I notice HE_SHE_L's anxious about full-on mating a human for the first time... I caress and reassure HIM_HER_L that HE_SHE_L decides the pace!");
					break;
					case SPECIES.VULPIX:
						array_push(_lines, "NAME is shakingly anxious about mating for the first time, so I take it slow by kissing, petting and stroking HIS_HER_L body. When HE_SHE_L's ready for oral, I get HIM_HER_L in position...");
					break;
					case SPECIES.ZOROARK:
						array_push(_lines, "NAME is so worked up over losing HIS_HER_L virginity to me, HE_SHE_L feels some performance pressure! I bolster HIS_HER_L confidence and we intimately make out before we begin to breed...");
					break;
				}
			}
			else
			{
				// Regular
				array_push(_lines, "With the tent closed I take off my clothes and reveal my hard cock to NAME, who gasps excitedly! Time to fuck and make a mess...");
				array_push(_lines, "NAME looks in delighted awe as I strip naked and pull out my raging erect dick. Adrenaline rushes through me as I start desecrating HIS_HER_L irresistable body...");
				array_push(_lines, "There, our little fuck den all sealed. I stroke my fat throbbing cock and push it in NAME's face, making HIM_HER_L look at me with lustful eyes... Time to breed.");
				array_push(_lines, "The second the tent is closed, NAME and I start aggressively making out as I take my pants off. I break in HIS_HER_L holes with a dildo and then get ready to fuck...");
				array_push(_lines, "Blood rushes through my dick as I close the tent and strip naked in anticipation. NAME pants lustfully and offers HIS_HER_L body for me to use, so I get in position...");
				array_push(_lines, "After closing the tent, I quickly put up a camera on a tripod and hit record... Another one for my collection! The tape rolls as NAME and I begin breeding...");
					
				// Gendered
				if(_gender == GENDERS.M) 
				{
					array_push(_lines, "Stripped naked and on my knees, I suck off NAME until HE_SHE_L's rock hard and pressing my leaking dick against HIS_HER_L watering lips... You're mine for the next half hour.");
					array_push(_lines, "My penis throbs as I lube up NAME's cute tight ass, making HIM_HER_L moan and pant in anticipation... Time to blow a fat load inside this needy little boy toy.");
				}
				else 
				{
					array_push(_lines, "Stripped naked and on my knees, I give NAME's pussy a good whiff before pressing my leaking dick against HIM_HER_L watering lips... You're mine for the next half hour.");
					array_push(_lines, "My penis throbs as I lube up NAME's tight little pussy, making HIM_HER_L moan and pant in anticipation... Time to impregnate this needy little slut.");
				}
						
				switch(_species)
				{
					case SPECIES.ALOLANVULPIX:
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "I lay down NAME's tender white body and suck HIS_HER_L cold little dick to get it hard. I then mark HIS_HER_L face with my precum, before sliding my dick into HIS_HER_L cold maw...");
						}
						else
						{
							array_push(_lines, "I lay down NAME's tender white body and eat out HIM_HER_L cold pussy to lube it up. I then mark HIM_HER_L face with my precum, before sliding my dick into HIM_HER_L cold maw...");
						}
					break;
					case SPECIES.BRAIXEN:
						array_push(_lines, "As soon as I close the tent, NAME's paw guides and undresses me while HE_SHE_L gives me a touchy private dance. By the time HE_SHE_L's done my dick is rock hard and ready!");
					break;	 
					case SPECIES.CINDERACE:
						array_push(_lines, "With the tent closed, NAME seductively strips naked to get me going. HE_SHE_L makes out with me while I grope HIS_HER_L perfect ass, before getting HIM_HER_L on HIS_HER_L knees for me...");
					break;
					case SPECIES.LUCARIO:
						array_push(_lines, "NAME's aura flares up in lust as HE_SHE_L pushes me to the ground and vigorously makes out with me! I finger HIM_HER_L in the meantime and after a while turn around to 69 HIM_HER_L...");
					break;
					case SPECIES.NICKIT:
						array_push(_lines, "NAME gives me a naughty look, as if challenging me to punish HIM_HER_L for being a little asshole. HE_SHE_L gloats as I dirty talk and pull HIM_HER_L towards my dick by HIS_HER_L ears...");
					break;
					case SPECIES.VULPIX:
						array_push(_lines, "When I close the tent, NAME heats up considerably and rubs HIS_HER_L genitals against me. HE_SHE_L huffs and moans as I play with them a bit and press my dick in HIS_HER_L face...");
					break;
					case SPECIES.ZOROARK:
						array_push(_lines, "NAME uses a few illusions of other attractive 'Mons to give me a little slice of heaven... HE_SHE_L taunts me over my raging erection before getting on HIS_HER_L knees to 'treat' it!");
					break;
				}
			}
		break;	
		
		case TEXT_PROMPT_TYPE.SCENE_END_A:
			// First Time Sex toggle (need to make sure affection is raised to MAX AFTER sex scene)
			if(_affection_level != AFFECTION_LEVEL.MAX)
			{
				// Regular
				array_push(_lines, "H-hah, wow... I'm speechless, that level of intimacy was nothing shy of enchanting. First times are quite special...");
				array_push(_lines, "A-ah, hah... I'm in love, absolutely hopelessly in love... Being a 'Mon's first is always special, but NAME is coming with me when I go home.");
				array_push(_lines, "O-oh my god, a-ahh... I'm no stranger to sex, but every time I mate a 'Mon for the first time I cum so fucking hard. The intimacy of it makes it feel so different...");
				array_push(_lines, "H-hah, a-ah fuck... Sweet arceus, the raw emotion and love that comes with first times like these shake even me. That was more than just lust, for sure.");
				array_push(_lines, "G-gah, hah... My dick won't stop throbbing and leaking... I really want a round 2, but don't want to overwhelm NAME for HIS_HER_L first time.");
					
				// Gendered
				if(_gender == GENDERS.M) 
				{
					array_push(_lines, "H-hah, sweet Arceus... That was so much more intense than I thought it was going to be! Gay love between 'Mon and human is so incredibly potent, especially with firsts...");
				}
				else 
				{
					array_push(_lines, "H-hah, sweet Arceus... That was even more intense than I expected! Breeding between 'Mon and humans feel so incredibly special, especially if they're first times...");
				}
						
				switch(_species)
				{
					case SPECIES.ALOLANVULPIX:
						array_push(_lines, "Ah, h-hah... Wow! It's incredible how intimate and romantic mating a small quadruped like NAME can get, especially when it's a first time...")
						array_push(_lines, "F-fuck, ahh... I'd almost forgotten how amazing the icy sensation of an NAME is. HIS_HER_L holes may be cold, but a warm fuzzy atmosphere lingers in the tent...")
					break;
					case SPECIES.BRAIXEN:
						array_push(_lines, "Ah, h-hah... Wow! It's amazing how real of a connection there is when mating humanoid Mons, especially with first times... It's crazy how close they are to humans.")
						array_push(_lines, "F-fuck, ahh... I'm telling you, first timing a NAME really feels like losing your virginity to your college crush... Something about it makes you feel young again!")
					break;
					case SPECIES.CINDERACE:
						array_push(_lines, "Ah, h-hah... Wow! It's amazing how real of a connection there is when mating humanoid Mons, especially with first times... It's crazy how close they are to humans.")
						array_push(_lines, "S-shit, ahh... I am not equipped to describe how it feels to deflower a NAME, the companionship of them just... Makes it feel like we've sealed a true bond for life!")
					break;
					case SPECIES.LUCARIO:
						array_push(_lines, "Ah, h-hah... Wow! It's amazing how real of a connection there is when mating humanoid Mons, especially with first times... It's crazy how close they are to humans.")
						array_push(_lines, "W-whah... Hah, I-... I'm speechless, the aura stuff... The combination of first timing a NAME and the experience they communicate through it, it changes a man...")
					break;
					case SPECIES.NICKIT:
						array_push(_lines, "Ah, h-hah... Wow! It's incredible how intimate and romantic mating a small quadruped like NAME can get, especially when it's a first time...")
						array_push(_lines, "H-hah, heh... I'm not used to NAME being so submissive, the poor thing is spent and looking at me with a loving gaze... We normally play around, but this was genuine.")
					break;
					case SPECIES.VULPIX:
						array_push(_lines, "Ah, h-hah... Wow! It's incredible how intimate and romantic mating a small quadruped like NAME can get, especially when it's a first time...")
						array_push(_lines, "Hah, a-ah... Oh, my heart... The incredible intimacy, the way NAME whined in pleasure and emotion from having HIS_HER_L cherry popped by me... It's too sweet to handle!")
					break;
					case SPECIES.ZOROARK:
						array_push(_lines, "Ah, h-hah... Wow! It's amazing how real of a connection there is when mating humanoid Mons, especially with first times... It's crazy how close they are to humans.")
						array_push(_lines, "F-fuck, oh sweet Arceus... I came my brains out and NAME did multiple times from officially losing HIS_HER_L virginity. We make out and cuddle as we recover...")
					break;
				}
			}
			else
			{
				// Regular
				array_push(_lines, "Hah, ahh... F-fuck dude, that was incredible. I can't go back to humans after this, I'm now convinced interspecies mating is mother nature's guarded secret.");
				array_push(_lines, "A-ahh, holy shit... I haven't cummed this hard in weeks. It's just oozing out of NAME, it's so much...");
				array_push(_lines, "G-gah, oh my god... My dick won't stop post-orgasm twitching, the sight of NAME quivering in aftermath and the thick scent of musk and sex is too much...");
				array_push(_lines, "Ah, h-hah... Holy fuck man, that was goddamn insane... Possibly the best NAME hole I've ever fucked, I'm a blabbering sweaty mess..");
				array_push(_lines, "H-holy shit, a-ah... I came so hard I feel light headed... I don't really keep score, but this session was definitely up there on the tierlist.");
				array_push(_lines, "S-shit, ahh... The sight of NAME squirming in pleasure while my cum drips out of HIM_HER_L is driving me wild. Fuck, I want to go again...");
					
				// Gendered
				if(_gender == GENDERS.M) 
				{
					array_push(_lines, "A-ah yeah, hah... God I love fucking males, the way their cocks bounce when you slam their ass... It's to die for.");
					array_push(_lines, "Gahh, hah... NAME's tight boy hole and maw absolutely milked every last drop from my nuts...");
				}
				else 
				{
					array_push(_lines, "A-ah yeah, hah... God I love fucking females, the way they vocalize when you destroy their pussy... It's to die for.");
					array_push(_lines, "Gahh, hah... NAME's tight pussy and maw absolutely milked every last drop from my nuts...");
				}
						
				switch(_species)
				{
					case SPECIES.ALOLANVULPIX:
						array_push(_lines, "G-grahh, fuck... I can simply not get enough of fucking NAMEes, their little white bodies are perfect cock sleeves and the cold tingly sensation is amazing...");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "H-hah, holy shit...... I'm panting like a dog after that. NAME's little vulpine dick and tiny frame are so fucking cute, I could keep railing HIM_HER_L all day...");
						}
						else
						{
							array_push(_lines, "H-hah, holy shit...... I'm panting like a dog after that. NAME's little vulpine pussy and tiny frame are so fucking cute, I could keep railing HIM_HER_L all day...");
						}
					break;
					case SPECIES.BRAIXEN:
						array_push(_lines, "Hah, h-holy shit... It's like NAMEs simply evolved to be dicked by humans, they're too damn perfect. Their cute mannerisms, sexy body and internal temperature... ");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's juicy dick and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
						}
						else
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's tight pussy and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
						}
					break;	 
					case SPECIES.CINDERACE:
						array_push(_lines, "Huff, hah... S-shit dude, this demon has damn near infinite stamina. I'm gonna have to go to round 2 to satisfy HIM_HER_L, is this why sports jocks were so popular in college?");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's juicy dick and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
						}
						else
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's tight pussy and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
						}
					break;
					case SPECIES.LUCARIO:
						array_push(_lines, "H-hah... M-my head is spinning... Arceus, the sensation of a NAME's aura during sex is unmatched, it's like having sex twice at the same time...");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's juicy dick and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
						}
						else
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's tight pussy and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
						}
					break;
					case SPECIES.NICKIT:
						array_push(_lines, "G-grahh yes, take my fat load you smug little bastard... God, aggressive revenge sex with NAMEs is amazing. This menace loves it when I'm rough with HIM_HER_L...");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "H-hah, holy shit...... I'm panting like a dog after that. NAME's little vulpine dick and tiny frame are so fucking cute, I could keep railing HIM_HER_L all day...");
						}
						else
						{
							array_push(_lines, "H-hah, holy shit...... I'm panting like a dog after that. NAME's little vulpine pussy and tiny frame are so fucking cute, I could keep railing HIM_HER_L all day...");
						}
					break;
					case SPECIES.VULPIX:
						array_push(_lines, "G-grahh, fuck... I can simply not get enough of fucking NAMEes, their little hot bodies are perfect cock sleeves and the intense heat inside them is amazing.");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "H-hah, holy shit...... I'm panting like a dog after that. NAME's little vulpine dick and tiny frame are so fucking cute, I could keep railing HIM_HER_L all day...");
						}
						else
						{
							array_push(_lines, "H-hah, holy shit...... I'm panting like a dog after that. NAME's little vulpine pussy and tiny frame are so fucking cute, I could keep railing HIM_HER_L all day...");
						}
					break;
					case SPECIES.ZOROARK:
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's juicy dick and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
							array_push(_lines, "H-hah... I can't with NAME, I'm so stupidly in love with HIM_HER_L... I feel a little sad I can't be HIS_HER_L mate for real, but I'm sure HE_SHE_L'll find one someday!");
						}
						else
						{
							array_push(_lines, "A-ah, fuck man...... I'm need a breather after that... NAME's tight pussy and mouth-watering figure are so fucking hot, I could keep railing HIM_HER_L all day...");
							array_push(_lines, "H-hah... I can't with NAME, I'm so stupidly in love with HIM_HER_L... I feel a little sad I can't actually put kids in HIM_HER_L, but role-playing impreg is great too!");
						}
					break;
				}
			}
		break;	
		
		case TEXT_PROMPT_TYPE.SCENE_END_B:
			// First Time Sex toggle (need to make sure affection is raised to MAX AFTER sex scene)
			if(_affection_level != AFFECTION_LEVEL.MAX)
			{
				// Regular
				array_push(_lines, "NAME lays next to me quivering in aftermath... I deeply kiss HIM_HER_L and do some post-sex cuddling, before opening up the tent and stepping outside feeling reborn!");
				array_push(_lines, "NAME and I lay on the floor panting for a while, recovering from this intensely intimate experience... Before I get up, I make HIM_HER_L smile with a big kiss!");
				array_push(_lines, "We both smile and engage in some post-breeding intimacy, kissing and caressing each other all over... After a while of that, we crawl out of our love cave!");
				array_push(_lines, "Me and NAME lay on our sides and look into each other's eyes, smiling and panting... We both laugh and press our foreheads together, this is real love!");
				array_push(_lines, "The exhaustion from our intense breeding session knocks both of us out for 30 minutes, after which I kiss NAME awake! We groggily claw our way outside...");
					
				// Gendered
				if(_gender == GENDERS.M) 
				{
					array_push(_lines, "I jerk off NAME and make HIM_HER_L cum as well, the poor thing is a whimpering mess after a firstie like that! I clean up our semen and help HIM_HER_L get out of the tent...");
					array_push(_lines, "NAME didn't cum yet, so I suck HIM_HER_L off until HE_SHE_L shoots a huge load in my mouth... I then make out with HIM_HER_L and we exchange 'I love yous' in our own languages!");
				}
				else 
				{
					array_push(_lines, "NAME is recovering from multiple orgasms, the poor thing is a whimpering mess after a firstie like that! I clean up our body fluids and help HIM_HER_L out of the tent...");
					array_push(_lines, "NAME already came, but I orally treat HIM_HER_L to another orgasm for this special occasion... I make out with HIM_HER_L after and we trade 'I love you's in our own languages!");
				}
						
				switch(_species)
				{
					case SPECIES.ALOLANVULPIX:
						array_push(_lines, "I stroke and kiss NAME's little quadrupedal body while HE_SHE_L whimpers and moans into my chest... I pick up and carry the poor exhausted thing outside!");
						array_push(_lines, "NAME cuddles up to me real close with a warm smile on HIM_HER_L face, as to tell me HE_SHE_L's mine forever... It makes me a bit emotional, what an accomplishment!");
					break;
					case SPECIES.BRAIXEN:
						array_push(_lines, "NAME and I full-body spoon while we catch our breaths, my semi-hard dick sandwiched in between HIS_HER_L thighs. After some sultry post-sex intimacy, we crawl outside...");
						array_push(_lines, "NAME gets sweetly emotional from the hormones and cries crocodile tears with an embarassed smile on HIS_HER_L face! We laugh and hug firmly before going back outside.");
					break;
					case SPECIES.CINDERACE:
						array_push(_lines, "NAME and I full-body spoon while we catch our breaths, my semi-hard dick sandwiched in between HIS_HER_L thighs. After some sultry post-sex intimacy, we crawl outside...");
						array_push(_lines, "I play with NAME's long bunny ears while we cuddle up and lovingly stare into each other's eyes... It's rare to see HIM_HER_L be this dreamy! We put on our pants and get up.");
					break;
					case SPECIES.LUCARIO:
						array_push(_lines, "NAME and I full-body spoon while we catch our breaths, my semi-hard dick sandwiched in between HIS_HER_L thighs. After some sultry post-sex intimacy, we crawl outside...");
						array_push(_lines, "We pant and exchange 'I love yous' telepathically while holding hands, like a young couple of soulmates... We kiss deeply before getting up and going outside!");
					break;
					case SPECIES.NICKIT:
						array_push(_lines, "I stroke and kiss NAME's little quadrupedal body while HE_SHE_L whimpers and moans into my chest... I pick up and carry the poor exhausted thing outside!");
						array_push(_lines, "I run my hands through NAME's big tail and massage HIS_HER_L soft black paws while HE_SHE_L's laying on HIS_HER_L back to recover... I make the little rascal blush with a deep kiss and get up!");
					break;
					case SPECIES.VULPIX:
						array_push(_lines, "I stroke and kiss NAME's little quadrupedal body while HE_SHE_L whimpers and moans into my chest... I pick up and carry the poor exhausted thing outside!");
						array_push(_lines, "NAME gets sweetly emotional from the hormones and sniffles with an embarassed smile on HIM_HER_L face! I hold HIM_HER_L tight and kiss HIM_HER_L, after which I carry HIM_HER_L out of the tent...");
					break;
					case SPECIES.ZOROARK:
						array_push(_lines, "NAME and I full-body spoon while we catch our breaths, my semi-hard dick sandwiched in between HIS_HER_L thighs. After some sultry post-sex intimacy, we crawl outside...");
						array_push(_lines, "NAME sits HIM_HER_L ass down on my softening dick and pins my arms to the ground, as to say 'There, you're mine now'! I chuckle and lovingly make out with HIM_HER_L before getting up.");
					break;
				}
			}
			else
			{
				// Regular
				array_push(_lines, "NAME is on the floor panting in exhaustion as I get off my ass and open the tent. I stretch and bolster my still semi-hard dick, gathering some interested glances...");
				array_push(_lines, "As NAME is licking up my seed, I furiously jerk off and second-load HIS_HER_L face. We both crawl out the tent looking like a mess and smelling like sweat and sex...");
				array_push(_lines, "NAME softly moans in pleasure as HE_SHE_L rides out an orgasm, while I furiously jerk off and cum over HIS_HER_L body. I clean up the mess and open the tent...");
				array_push(_lines, "We exchange a lustful stare and instantly go for a second round, sucking and fucking until we lose our senses... We pass out for a good 30 minutes before going outside!");
				array_push(_lines, "I clean up my cum from NAME's hole with my mouth and make out with HIM_HER_L after, using my hands to make HIM_HER_L orgasm again! We both limp out of the tent...");
				array_push(_lines, "I take some close-up pics of my hot seed dripping out of NAME's orfice, people on the internet go nuts for this stuff. I help HIM_HER_L clean up and we go outside...");
					
				// Gendered
				if(_gender == GENDERS.M) 
				{
					array_push(_lines, "I take my turn sucking off NAME and make HIM_HER_L whine as HE_SHE_L cums in my mouth, swallowing it all. We intimately cuddle for a bit before going back outside...");
					array_push(_lines, "After a bonus round of human on NAME anal love, HIS_HER_L hole is leaking my semen everywhere. I go outside satisfied with NAME walking after me funnily...");
					array_push(_lines, "NAME lays on HIS_HER_L chest ass-raised while I milk a fat load from HIS_HER_L twitching cock. I know how to take good care of my 'Mons, let's clean up this mess and head outside...");
				}
				else 
				{
					array_push(_lines, "I quickly tongue wrestle NAME's clit to orgasm and make HIM_HER_L whine as HE_SHE_L squirts in my mouth. We intimately cuddle for a bit before going back outside...");
					array_push(_lines, "After a bonus round of human on NAME egg making, HIM_HER_L pussy is leaking my semen everywhere. I go outside satisfied with NAME wobbling after me...");
					array_push(_lines, "NAME lays on HIM_HER_L chest ass-raised while I finger fuck HIM_HER_L to orgasm. I know how to take good care of my 'Mons, let's clean up this mess and head outside...");
				}
						
				switch(_species)
				{
					case SPECIES.ALOLANVULPIX:
						array_push(_lines, "The sight of my cum oozing out of NAME's little vulpine body causes me to slam-fuck an fill HIM_HER_L other hole as well! H-hah, fuck... I love mating quadrupeds...");
						array_push(_lines, "I simply can't resist the snow-like glimmer of NAME's beautiful slender body and milk out another load of hot semen over HIM_HER_L belly... HE_SHE_L is irresistable!");
					break;
					case SPECIES.BRAIXEN:
						array_push(_lines, "NAME mischievously grabs my dick and jerks me off until I cum a second time, covering me in my own spunk! I make HIM_HER_L lick it up, after which we go outside...");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIS_HER_L cock bounce while I aggressively fuck and pump another fat load inside HIS_HER_L ass! H-hah, better than humans...");
						}
						else
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIM_HER_L tits bounce while I aggressively fuck and pump another fat load inside HIM_HER_L womb! H-hah, better than humans...");
						}
					break;
					case SPECIES.CINDERACE:
						array_push(_lines, "NAME bolsters HIS_HER_L athletic stamina by riding my dick for 2 more rounds, I'm clinically dead by the time HE_SHE_L's done with me! HE_SHE_L drags my sweaty carcass outside...");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIS_HER_L cock bounce while I aggressively fuck and pump another fat load inside HIS_HER_L ass! H-hah, better than humans...");
						}
						else
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIM_HER_L tits bounce while I aggressively fuck and pump another fat load inside HIM_HER_L womb! H-hah, better than humans...");
						}
					break;
					case SPECIES.LUCARIO:
						array_push(_lines, "NAME's aura still flares and rages in a lustful haze, so I put HIM_HER_L on HIS_HER_L hands and knees and fuck HIM_HER_L anal until we're both a leaking whimpering mess...");
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIS_HER_L cock bounce while I aggressively fuck and pump another fat load inside HIS_HER_L ass! H-hah, better than humans...");
						}
						else
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIM_HER_L tits bounce while I aggressively fuck and pump another fat load inside HIM_HER_L womb! H-hah, better than humans...");
						}
					break;
					case SPECIES.NICKIT:
						array_push(_lines, "The sight of my cum oozing out of NAME's little vulpine body causes me to slam-fuck an fill HIM_HER_L other hole as well! H-hah, fuck... I love mating quadrupeds...");
						array_push(_lines, "NAME STILL tauntingly smirks... So I get up, grab the little shit and slam-fuck HIS_HER_L ass until HE_SHE_L whines for mercy. I fill HIM_HER_L with a second load and carry HIM_HER_L outside!");
					break;
					case SPECIES.VULPIX:
						array_push(_lines, "The sight of my cum oozing out of NAME's little vulpine body causes me to slam-fuck an fill HIM_HER_L other hole as well! H-hah, fuck... I love mating quadrupeds...");
						array_push(_lines, "NAME gives me a hazy lustful look, moaning for more! I comply and rearrange HIS_HER_L searing hot insides once more, blasting HIS_HER_L little womb full with my seed...");
					break;
					case SPECIES.ZOROARK:
						array_push(_lines, "NAME is in breed mode and NOT satisfied, so HE_SHE_L gets me hard again with some naughty illusions and rides my dick until I lose count of my orgasms... My head spins...")
						if(_gender == GENDERS.M)
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIS_HER_L cock bounce while I aggressively fuck and pump another fat load inside HIS_HER_L ass! H-hah, better than humans...");
						}
						else
						{
							array_push(_lines, "I'm not yet satisfied and grab NAME's hips, making HIM_HER_L tits bounce while I aggressively fuck and pump another fat load inside HIM_HER_L womb! H-hah, better than humans...");
						}
					break;
				}
			}
		break;	
		
		case TEXT_PROMPT_TYPE.COOKING_SEQUENCE:
			// Success switch
			if(global.encounter_imminent)
			{
				array_push(_lines, "Man, that smells really good if I say so myself! With a little luck this should lure in some 'Mons... Ah look at that! One is carefully approaching...");
				array_push(_lines, "Whoa, I've really outdone myself this time. Smells great! I serve the meal onto some plates and get ready to eat... It looks like the locals want some too!");
				array_push(_lines, "All done, I learned this recipe from my mom! Pretty sure HE_SHE_L wouldn't approve of how it's being used though... Looks like it did catch a 'Mon's attention though!");
				
				if(_mon_count == 1) // Add 1 because new 'Mon counts apparently
				{
					array_push(_lines, "There we go, that should invite some hungry guests over. I look around and sure enough, something's approaching!");
					array_push(_lines, "And voila, one delicious smelling meal for the denizens of the forest. Here comes one now... That was fast!");
					array_push(_lines, "Wonderful! If I were a wild 'Mon, this would DEFINITELY work on me. I look around the camp and sure enough, one is approaching!");
					array_push(_lines, "There, all done! This recipe is one of my personal faves... And it looks like this one agrees, a wild 'Mon approaches!");
				}
				else if(_mon_count == 2)
				{
					array_push(_lines, "There, a lovely meal for me and my camp partner! I get two plates ready and we sit down to dig in... When I suddenly notice another hungry soul approaching!");
					array_push(_lines, "Tadah, another wonderful meal cooked up! My camp buddy takes their plate and eagerly digs in, and their enthousiasm seems to have convinced a new guest to join!");
				}
				else if(_mon_count > 2)
				{
					array_push(_lines, "My 'Mons are overjoyed with their plates of yummy food! The smell of my cooking wafts into the forest and after a short while I hear a rustle in the bushes...");
					array_push(_lines, "And presto, mealtime! I'm glad to see my cooking is appreciated by my 'Mons. As they dig in, I hear something moving towards the camp...");
					array_push(_lines, "My 'Mons gather round as I put on the finishing touches, drooling and bouncing in excitement! Over the commotion I hear a branch crack and dart my head in its direction...");
					array_push(_lines, "There, all done! This recipe is one of my personal faves. My 'Mons seem to love it as well, they're digging in! ...And it looks like we've got a guest who wants some!");
					array_push(_lines, "Wow, that turned out really good! My 'Mons anxiously pace around as I get the plates and drinks ready... Then suddenly I notice a figure coming from the bushes!");
					array_push(_lines, "Yikes, put that one onto the fire a little too long... No matter, my 'Mons seem to not mind and enjoy it! Oh, and apparently this guest seems to not mind either!");
					array_push(_lines, "Delicious, that's turned out really good. The 'Mons at my camp swarm me to get their share, not all at once please! Hey, that's an unfamiliar face in the crowd...");
				}
			}
			else
			{
				array_push(_lines, "Man, that smells really good if I say so myself! With a little luck this should lure in some 'Mons... Yeah, guess no 'little luck' for me today.");
				array_push(_lines, "Whoa, I've really outdone myself this time. Smells great! I serve the meal onto some plates and get ready to eat... Unfortunately it doesn't seem like wild 'Mons are joining.");
				array_push(_lines, "All done, I learned this recipe from my mom! Pretty sure she wouldn't approve of how it's being used though... Maybe it's karma that no wild 'Mons are showing up!");
					
				if(_mon_count == 0)
				{
					array_push(_lines, "There we go, that should invite some hungry guests over. Soon... Aaany time now... Ugh, guess I'll eat it myself!");
					array_push(_lines, "And voila, one delicious smelling meal for the denizens of the forest... Is what I would've said if any showed up!");
					array_push(_lines, "Wonderful! If I were a wild 'Mon, this would DEFINITELY work on me... Well, guess I'm projecting. No one's showing up!");
					array_push(_lines, "There, all done! This recipe is one of my personal faves... No, no wild 'Mons at all? That's a little hurtful...");
				}
				else if(_mon_count == 1)
				{
					array_push(_lines, "There, a lovely meal for me and my camp partner! I get two plates ready and we sit down to dig in... Unfortunately is stays quiet and no new 'Mons show up.");
					array_push(_lines, "Tadah, another wonderful meal cooked up! My sole camp buddy takes their plate and eagerly digs in. Sadly it seems we'll have leftovers, no 'Mons showed up...");
				}
				else
				{
					array_push(_lines, "My 'Mons are overjoyed with their plates of yummy food! We finish up everyone's feeling full and re-energized, but sadly no new 'Mons showed up...");
					array_push(_lines, "And presto, mealtime! I'm glad to see my cooking is appreciated by my 'Mons. We share a great meal, but no wild 'Mons showed up... That's a shame!");
					array_push(_lines, "My 'Mons gather round as I put on the finishing touches, drooling and bouncing in excitement! The commotion may have deterred wild 'Mons from joining, what a bummer...");
					array_push(_lines, "There, all done! This recipe is one of my personal faves. My 'Mons seem to love it, but the same can't be said for guests in the area... Hoping that's just bad luck.");
					array_push(_lines, "Wow, that turned out really good! My 'Mons anxiously pace around as I get the plates and drinks ready... We dig in into out meals, but no wild 'Mons show up!");
					array_push(_lines, "Yikes, put that one onto the fire a little too long... No matter, my 'Mons seem to not mind and enjoy it! Same can't be said for wild 'Mons though... Bummer.");
					array_push(_lines, "Delicious, that's turned out really good! The 'Mons at my camp swarm me to get their share, not all at once please! Sadly no new guests join though...");
				}
			}
		break;	
	}
	
	// Cancel if no lines were found
	var _lines_length = array_length(_lines);
	if(_lines_length <= 0) return "No text prompt found";
	
	var _line = _lines[0];
	
	// Find the prompt history or create one
	var _history_key = string(_type) + string(_affection_level) + string(_species) + string(_gender);
	var _history = ds_map_find_value(global.prompt_history, _history_key);
	
	if(is_undefined(_history)) _history = [];
	var _history_length = array_length(_history);
	
	// Reset history if all lines were done
	if(_history_length >= _lines_length) _history = [];
	
	// Choose a new line
	var _found_new_line = false;
	var _new_line_index = 0;
	var _retries = 100;
	
	while(!_found_new_line && _retries > 0)
	{
		_new_line_index = irandom(_lines_length - 1);
		_found_new_line = !array_contains(_history, _new_line_index);
		_retries--;
	}
	
	_line = _lines[_new_line_index];
			
	// Add this new line to the history
	array_push(_history,_new_line_index);
	ds_map_set(global.prompt_history, _history_key, _history);
	
	// Apply keyword replacements
	var _subject = _gender == GENDERS.M ? "He" : "She";
	var _object = _gender == GENDERS.M ? "Him" : "Her";
	var _possesive = _gender == GENDERS.M ? "His" : "Her";
	
	var _subject_l = string_lower(_subject);
	var _object_l = string_lower(_object);
	var _possesive_l = string_lower(_possesive);
	
	_line = string_replace_all(_line, "NAME", _name);
	
	_line = string_replace_all(_line, "HE_SHE_L", _subject_l);
	_line = string_replace_all(_line, "HIM_HER_L", _object_l);
	_line = string_replace_all(_line, "HIS_HER_L", _possesive_l);
	
	_line = string_replace_all(_line, "HE_SHE", _subject);
	_line = string_replace_all(_line, "HIM_HER", _object);
	_line = string_replace_all(_line, "HIS_HER", _possesive);
	
	// Return the line
	return _line;
}