#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

init() {
	executeCommand("sv_cheats 1");

	level thread player_connect();
	level thread create_rainbow_color();

	wait 0.5;

	replaceFunc(maps\mp\gametypes\_gamelogic::onForfeit, ::return_false); // Retropack
	replaceFunc(maps\mp\gametypes\_gamelogic::matchStartTimerWaitForPlayers, maps\mp\gametypes\_gamelogic::matchStartTimerSkip); //SimonLFC - Retropack
	level.originalCallbackPlayerDamage = level.callbackPlayerDamage; //doktorSAS - Retropack
	level.callbackPlayerDamage = ::player_damage_callback; // Retropack
	level.rankedmatch = 1;
}

initial_variables() {
	self.in_menu = false;
	self.hud_created = false;
	self.loaded_offset = false;
	self.option_limit = 7;
	self.current_menu = "Synergy";
	self.structure = [];
	self.previous = [];
	self.saved_index = [];
	self.saved_offset = [];
	self.saved_trigger = [];
	self.slider = [];

	self.font = "default";
	self.font_scale = 0.7;
	self.x_offset = 175;
	self.y_offset = 160;

	self.color_theme = "rainbow";
	self.menu_color_red = 0;
	self.menu_color_green = 0;
	self.menu_color_blue = 0;

	self.cursor_index = 0;
	self.scrolling_offset = 0;
	self.previous_scrolling_offset = 0;
	self.description_height = 0;
	self.previous_option = undefined;

	level.bot_difficulty = "Recruit";

	self.syn["visions"][0] = ["None", "AC-130", "AC-130 inverted", "Black & White", "Endgame", "Night", "Night Vision", "MP Intro", "MP Nuke Aftermath", "Sepia"];
	self.syn["visions"][1] = ["", "ac130", "ac130_inverted", "missilecam", "end_game", "default_night", "default_night_mp", "mpintro", "mpnuke_aftermath", "sepia"];

	self.syn["weapons"]["category"][0] = ["assault_rifles", "sub_machine_guns", "sniper_rifles", "shotguns", "light_machine_guns", "pistols", "melee", "equipment"];
	self.syn["weapons"]["category"][1] = ["Assault Rifles", "Sub Machine Guns", "Sniper Rifles", "Shotguns", "Light Machine Guns", "Pistols", "Melee Weapons", "Equipment"];

	// Weapons

	self.syn["weapons"]["assault_rifles"][0] =     ["h1_m16_mp_a", "h1_ak47_mp_a", "h1_m4_mp_a", "h1_g3_mp_a", "h1_g36c_mp_a", "h1_m14_mp_a", "h1_mp44_mp_a", "h1_xmlar_mp_a", "h1_aprast_mp_a", "h1_augast_mp_a"];
	self.syn["weapons"]["sub_machine_guns"][0] =   ["h1_mp5_mp_a", "h1_skorpion_mp_a", "h1_uzi_mp_a", "h1_ak74u_mp_a", "h1_p90_mp_a", "h1_febsmg_mp_a", "h1_aprsmg_mp_a", "h1_augsmg_mp_a"];
	self.syn["weapons"]["sniper_rifles"][0] =      ["h1_m40a3_mp_a", "h1_dragunov_mp_a", "h1_m21_mp_a", "h1_remington700_mp_a", "h1_barrett_mp_a", "h1_febsnp_mp_a", "h1_junsnp_mp_a"];
	self.syn["weapons"]["shotguns"][0] =           ["h1_winchester1200_mp_a", "h1_m1014_mp_a", "h1_kam12_mp_a", "h1_junsho_mp_a"];
	self.syn["weapons"]["light_machine_guns"][0] = ["h1_saw_mp_a", "h1_rpd_mp_a", "h1_m60e4_mp_a", "h1_feblmg_mp_a", "h1_junlmg_mp_a"];
	self.syn["weapons"]["pistols"][0] =            ["h1_beretta_mp_a", "h1_usp_mp_a", "h1_colt45_mp_a", "h1_deserteagle_mp_a", "h1_janpst_mp_a", "h1_aprpst_mp_a", "h1_augpst_mp_a"];
	self.syn["weapons"]["melee"][0] =              ["h1_meleejun2_mp_a", "h1_meleeapr2_mp_a", "h1_meleefeb4_mp_a", "h1_meleejun4_mp_a", "h1_meleefeb2_mp_a", "h1_meleesickle_mp_a", "h1_meleebottle_mp_a", "h1_meleeaug3_mp_a", "h1_meleejun6_mp_a", "h1_meleeapr4_mp_a", "h1_meleeapr3_mp_a", "h1_meleejun1_mp_a", "h1_meleejun3_mp_a", "h1_meleeaug1_mp_a", "h1_meleejun5_mp_a", "h1_meleeaug2_mp_a", "h1_meleeicepick_mp_a", "h1_meleepaddle_mp_a", "h1_meleeblade_mp_a", "h1_meleeshovel_mp_a", "h1_meleegladius_mp_a", "h1_meleebayonet_mp_a", "h1_meleeaug4_mp_a", "h1_meleefeb1_mp_a", "h1_meleefeb3_mp_a", "h1_meleehatchet_mp_a", "h1_meleeapr1_mp_a", "h1_meleefeb5_mp_a"];

	self.syn["weapons"]["assault_rifles"][1] =     ["M16A4", "AK-47", "M4 Carbine", "G3", "G36C", "M14", "MP44", "XM-LAR", "BOS14", "Lynx CQ300"];
	self.syn["weapons"]["sub_machine_guns"][1] =   ["MP5", "Skorpion", "Mini-Uzi", "AK-74u", "P90", "Mac-10", "Fang 45", "PK-PSD9"];
	self.syn["weapons"]["sniper_rifles"][1] =      ["M40A3", "M21", "Dragunov", "R700", "Barrett .50Cal", "D-25S", "S-Tac Aggressor"];
	self.syn["weapons"]["shotguns"][1] =           ["W1200", "M1014", "Kamchataka-12", "Rangers"];
	self.syn["weapons"]["light_machine_guns"][1] = ["M249 SAW", "RPD", "M60E4", "PKM", "Bered MK8"];
	self.syn["weapons"]["pistols"][1] =            ["M9", "USP .45", "M1911 .45", "Desert Eagle", ".44 Magnum", "Prokolot", "BR9"];
	self.syn["weapons"]["melee"][1] =              ["Cleaver", "Machete", "Thug", "Tidal", "Shamrock Blade", "Sickle", "Brawler's Brew", "Point Knife", "Sarsparilla", "Sawtooth", "Diabolical", "Bludgeon", "Nauticus", "Danger Close", "Tribal", "Barber", "Cliffhanger", "OMSK Hammer", "Scorpion", "Gravedigger", "Gladiator", "CQB Bayonet", "Enforce", "Mechanic", "Samurai", "Hatchetman", "Caveman", "Leprechaun"];

	self.syn["weapons"]["equipment"][0] = ["h1_c4_mp", "h1_rpg_mp", "h1_fraggrenade_mp", "h1_flashgrenade_mp", "h1_concussiongrenade_mp", "h1_smokegrenade_mp", "h1_claymore_mp"];
	self.syn["weapons"]["equipment"][1] = ["C4", "RPG-7", "Frag Grenade", "Flash Grenade", "Concussion Grenade", "Smoke Grenade", "Claymore"];

	// Attachments

	self.syn["weapons"]["attachments"][0] =     									["none_f", "gl_f", "silencer_f"];
	self.syn["weapons"]["attachments"][1] =     									["None", "Grenade Launcher", "Silencer"];
	self.syn["weapons"]["assault_rifles"]["attachments"][0] =     ["reflex_f", "acog_f"];
	self.syn["weapons"]["assault_rifles"]["attachments"][1] =     ["Red Dot Sight", "Acog"];
	self.syn["weapons"]["sub_machine_guns"]["attachments"][0] =   ["reflex_f", "acog_f"];
	self.syn["weapons"]["sub_machine_guns"]["attachments"][1] =   ["Red Dot Sight", "Acog"];
	self.syn["weapons"]["sniper_rifles"]["attachments"][0] =      ["acog_f"];
	self.syn["weapons"]["sniper_rifles"]["attachments"][1] =      ["Acog"];
	self.syn["weapons"]["shotguns"]["attachments"][0] =           ["reflex_f", "grip_f"];
	self.syn["weapons"]["shotguns"]["attachments"][1] =           ["Red Dot Sight", "Foregrip"];
	self.syn["weapons"]["light_machine_guns"]["attachments"][0] = ["reflex_f", "grip_f", "acog_f"];
	self.syn["weapons"]["light_machine_guns"]["attachments"][1] = ["Red Dot Sight", "Foregrip", "Acog"];
	self.syn["weapons"]["rangers"]["attachments"][0] =            ["akimbohidden_f"];
	self.syn["weapons"]["rangers"]["attachments"][1] =            ["Akimbo"];

	//Weapon Kits

	self.syn["weapons"]["assault_rifles"]["kits"][0] =     ["ish", "scn", "don", "bko", "ttf", "ctm", "wlf", "clr", "mtp", "ntb", "hnn", "btw", "frd"];
	self.syn["weapons"]["assault_rifles"]["kits"][1] =     ["Irish", "Stinger", "Don", "Black Dot", "Tactical Fighter", "Center Mass", "Wolfen", "Challenger", "Mastercraft", "Noobtuber", "Peacekeeper", "Battleworn", "Fire Drake"];
	self.syn["weapons"]["sub_machine_guns"]["kits"][0] =   ["tki", "prm", "clh", "msp", "rpr", "kin", "bts", "uop", "rwr", "stg"];
	self.syn["weapons"]["sub_machine_guns"]["kits"][1] =   ["Tiki", "Primitive", "Whiteout", "Masterpiece", "Reaper", "Kingpin", "Battle-Scarred", "Urban Operator", "Reactive", "Venom"];
	self.syn["weapons"]["sniper_rifles"]["kits"][0] =      ["fcn", "gsy", "slt", "ndl", "ftd", "htm", "asn", "gle", "kls", "mkm"];
	self.syn["weapons"]["sniper_rifles"]["kits"][1] =      ["Pride", "Grisly", "Slate", "Neanderthal", "Field Tested", "Huntsman", "Assassin", "Ghillie", "Killshot", "Chalk"];
	self.syn["weapons"]["shotguns"]["kits"][0] =           ["gvd", "frt", "liq", "pyr", "kgf", "osd", "wsr", "pgn", "frg", "gsl", "cmp", "urw"];
	self.syn["weapons"]["shotguns"]["kits"][1] =           ["Ethereal", "Frost", "Liquidator", "Pyrotechnic", "Kingfish", "Obsidian", "War-Scarred", "Pigpen", "Frag", "Lawman", "Competitor", "Urban Warfare"];
	self.syn["weapons"]["light_machine_guns"]["kits"][0] = ["nse", "gla", "clb", "mud", "phx", "utv", "kgp", "war", "edr", "wtn", "ttm"];
	self.syn["weapons"]["light_machine_guns"]["kits"][1] = ["Odin", "Glacier", "Celebration", "Mudder", "Phalanx", "Ultraviolet", "Czar", "Warfighter", "Elder", "Wartorn", "Titanium"];
	self.syn["weapons"]["pistols"]["kits"][0] =            ["cpr", "btt", "rlc", "bss", "gsr", "spo", "eqr"];
	self.syn["weapons"]["pistols"]["kits"][1] =            ["Competition", "Battle-Tested", "Relic", "Boss", "Gunslinger", "Spec Ops", "Avalanche"];

	// Perks

	//self.syn["perks"][0] = ["c4_mp", "rpg_mp", "specialty_specialgrenade", "specialty_detectexplosive", "claymore_mp", "specialty_extraammo", "specialty_fraggrenade"];
	//self.syn["perks"][1] = ["C4 x2", "RPG-7 x2", "Special Grenades x3", "Bomb Squad", "Claymore x2", "Bandolier", "Frag x3"];
	self.syn["perks"][0] = ["specialty_bulletdamage", "specialty_armorvest", "specialty_explosivedamage", "specialty_radarimmune", "specialty_fastreload", "specialty_rof", "specialty_twoprimaries", "specialty_longersprint", "specialty_bulletaccuracy", "specialty_bulletpenetration", "specialty_pistoldeath", "specialty_grenadepulldeath", "specialty_holdbreath", "specialty_parabolic", "specialty_quieter"];
	self.syn["perks"][1] = ["Stopping Power", "Juggernaut", "Sonic Boom", "UAV Jammer", "Sleight of Hand", "Double Tap", "Overkill", "Extreme Conditioning", "Steady Aim", "Deep Impact", "Last Stand", "Martyrdom", "Iron Lungs", "Eavesdrop", "Dead Silence"];
	self.syn["perks"][2] = ["specialty_scavenger", "specialty_coldblooded", "specialty_blindeye", "specialty_hardline", "specialty_silentkill", "specialty_stun_resistance", "specialty_lightweight", "specialty_moreminimap", "specialty_class_lowprofile", "specialty_hard_shell", "specialty_detectexplosive", "specialty_explosiveammoresupply", "specialty_bulletresupply", "specialty_delaymine", "specialty_blastshield2", "specialty_omaquickchange", "specialty_radararrow", "specialty_s1_temp", "specialty_blastshield", "specialty_akimbo", "specialty_falldamage", "specialty_shield", "specialty_feigndeath", "specialty_shellshock", "specialty_localjammer", "specialty_thermal", "specialty_blackbox", "specialty_steelnerves", "specialty_flashgrenade", "specialty_smokegrenade", "specialty_concussiongrenade", "specialty_saboteur", "specialty_rearview", "specialty_primarydeath", "specialty_secondarybling", "specialty_hardjack", "specialty_extraspecialduration", "specialty_rollover", "specialty_steadyaimpro", "specialty_double_load", "specialty_regenspeed", "specialty_autospot", "specialty_overkillpro", "specialty_anytwo", "specialty_paint", "specialty_paint_pro", "specialty_crouchmovement", "specialty_personaluav", "specialty_unwrapper", "specialty_class_blindeye", "specialty_class_coldblooded", "specialty_class_hardwired", "specialty_class_scavenger", "specialty_class_hoarder", "specialty_class_gungho", "specialty_class_steadyhands", "specialty_class_hardline", "specialty_class_peripherals", "specialty_class_quickdraw", "specialty_class_toughness", "specialty_class_lightweight", "specialty_class_engineer", "specialty_class_dangerclose", "specialty_horde_weaponsfree", "specialty_horde_dualprimary", "specialty_marksman", "specialty_sharp_focus", "specialty_moredamage", "specialty_copycat", "specialty_finalstand", "specialty_juiced", "specialty_light_armor", "specialty_stopping_power", "specialty_uav", "bouncingbetty_mp", "portable_radar_mp", "scrambler_mp", "trophy_mp"];
	self.syn["perks"][3] = ["specialty_scavenger", "specialty_coldblooded", "specialty_blindeye", "specialty_hardline", "specialty_silentkill", "specialty_stun_resistance", "specialty_lightweight", "specialty_moreminimap", "specialty_class_lowprofile", "specialty_hard_shell", "specialty_detectexplosive", "specialty_explosiveammoresupply", "specialty_bulletresupply", "specialty_delaymine", "specialty_blastshield2", "specialty_omaquickchange", "specialty_radararrow", "specialty_s1_temp", "specialty_blastshield", "specialty_akimbo", "specialty_falldamage", "specialty_shield", "specialty_feigndeath", "specialty_shellshock", "specialty_localjammer", "specialty_thermal", "specialty_blackbox", "specialty_steelnerves", "specialty_flashgrenade", "specialty_smokegrenade", "specialty_concussiongrenade", "specialty_saboteur", "specialty_rearview", "specialty_primarydeath", "specialty_secondarybling", "specialty_hardjack", "specialty_extraspecialduration", "specialty_rollover", "specialty_steadyaimpro", "specialty_double_load", "specialty_regenspeed", "specialty_autospot", "specialty_overkillpro", "specialty_anytwo", "specialty_paint", "specialty_paint_pro", "specialty_crouchmovement", "specialty_personaluav", "specialty_unwrapper", "specialty_class_blindeye", "specialty_class_coldblooded", "specialty_class_hardwired", "specialty_class_scavenger", "specialty_class_hoarder", "specialty_class_gungho", "specialty_class_steadyhands", "specialty_class_hardline", "specialty_class_peripherals", "specialty_class_quickdraw", "specialty_class_toughness", "specialty_class_lightweight", "specialty_class_engineer", "specialty_class_dangerclose", "specialty_horde_weaponsfree", "specialty_horde_dualprimary", "specialty_marksman", "specialty_sharp_focus", "specialty_moredamage", "specialty_copycat", "specialty_finalstand", "specialty_juiced", "specialty_light_armor", "specialty_stopping_power", "specialty_uav", "bouncingbetty_mp", "portable_radar_mp", "scrambler_mp", "trophy_mp"];

	// Killstreaks

	self.syn["killstreaks"][0] = ["radar_mp", "airstrike_mp", "helicopter_mp"];
	self.syn["killstreaks"][1] = ["UAV Recon", "Airstrike", "Attack Helicopter"];

	// Maps

	self.syn["maps"][0] = ["convoy", "backlot", "bog_summer", "bloc", "bog", "broadcast", "carentan", "countdown", "crash", "creek", "crossfire", "farm_spring", "citystreets", "downpour", "vlobby_room", "killhouse", "overgrown", "pipeline", "shipment", "showdown", "strike", "vacant", "cargoship", "crash_snow"];
	self.syn["maps"][1] = ["Ambush", "Backlot", "Beach Bog", "Bloc", "Bog", "Broadcast", "Chinatown", "Countdown", "Crash", "Creek", "Crossfire", "Daybreak", "District", "Downpour", "Firing Range", "Killhouse", "Overgrown", "Pipeline", "Shipment", "Showdown", "Strike", "Vacant", "Wet Work", "Winter Crash"];

	if(self.pers["prestige"] == 20) {
		self.set_20th_prestige = true;
	}
}

initialize_menu() {
	level endon("game_ended");
	self endon("disconnect");

	for(;;) {
	  event_name = self waittill_any_return("spawned_player", "player_downed", "death", "joined_spectators");
	  switch (event_name) {
	    case "spawned_player":
	      if(self isHost()) {
	        if(!self.hud_created) {
	          self freezeControls(false);

						setDvar("xblive_privatematch", 0);
						setDvar("onlinegame", 1);

	          self thread input_manager();

	          self.syn["string"] = self create_text("", "default", 1, "center", "top", 0, -100, (1, 1, 1), 0, 9999, false, true);

	          self.menu["border"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset - 1), (self.y_offset - 1), 226, 122, self.color_theme, 1, 1);
	          self.menu["background"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", self.x_offset, self.y_offset, 224, 121, (0.075, 0.075, 0.075), 1, 2);
						self.menu["foreground"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", self.x_offset, (self.y_offset + 15), 224, 106, (0.1, 0.1, 0.1), 1, 3);
	          self.menu["separator_1"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 5.5), (self.y_offset + 7.5), 42, 1, self.color_theme, 1, 10);
	          self.menu["separator_2"] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", (self.x_offset + 220), (self.y_offset + 7.5), 42, 1, self.color_theme, 1, 10);
	          self.menu["cursor"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", self.x_offset, 215, 224, 16, (0.15, 0.15, 0.15), 0, 4);

	          self.menu["title"] = self create_text("Title", self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 94.5), (self.y_offset + 3), (1, 1, 1), 1, 10);
	          self.menu["description"] = self create_text("Description", self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 5), (self.y_offset + (self.option_limit * 17.5)), (0.75, 0.75, 0.75), 0, 10);

						self.menu["options"] = self create_text("", self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 5), (self.y_offset + 20), (0.75, 0.75, 0.75), 1, 10);
						self.menu["submenu_icons"] = self create_text("", self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 215), ((self.y_offset + 20)), (0.75, 0.75, 0.75), 0, 10);
						self.menu["slider_texts"] = self create_text("", self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 132.5), (self.y_offset + 20), (0.75, 0.75, 0.75), 0, 10);

						for(i = 1; i <= self.option_limit; i++) {
							self.menu["toggle_" + i] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", (self.x_offset + 11), ((self.y_offset + 4) + (i * 16.5)), 8, 8, (0.25, 0.25, 0.25), 0, 9);
							self.menu["slider_" + i] = self create_shader("white", "TOP_LEFT", "TOPCENTER", self.x_offset, (self.y_offset + (i * 16.5)), 224, 16, (0.25, 0.25, 0.25), 0, 5);
						}

	          self.hud_created = true;

	          self.menu["title"] set_text("Controls");

	          self.menu["options"] set_text("Open: ^3[{+speed_throw}] ^7and ^3[{+melee}]\n\nScroll: ^3[{+speed_throw}] ^7and ^3[{+attack}]\n\nSelect: ^3[{+activate}] ^7Back: ^3[{+melee}]\n\nSliders: ^3[{+smoke}] ^7and ^3[{+frag}]");

	          self.menu["border"] set_shader("white", self.menu["border"].width, 83);
	          self.menu["background"] set_shader("white", self.menu["background"].width, 81);
	          self.menu["foreground"] set_shader("white", self.menu["foreground"].width, 66);

	          self.controls_menu_open = true;

	          wait 8;

	          if(self.controls_menu_open) {
	            close_controls_menu();
	          }
	        }
	      }
	      break;
	    default:
	      if(!self isHost()) {
	        continue;
	      }

	      if(self.in_menu) {
	        self close_menu();
	      }
	      break;
	  }
	}
}

input_manager() {
	level endon("game_ended");
	self endon("disconnect");

	while(self isHost()) {
	  if(!self.in_menu) {
	    if(self adsButtonPressed() && self meleeButtonPressed()) {
	      if(self.controls_menu_open) {
	        close_controls_menu();
	      }

	      self playSoundToPlayer("h1_ui_menu_warning_box_appear", self);

	      open_menu();

	      while(self adsButtonPressed() && self meleeButtonPressed()) {
	        wait 0.2;
	      }
	    }
	  } else {
	    if(self meleeButtonPressed()) {
	      self.saved_index[self.current_menu] = self.cursor_index;
	      self.saved_offset[self.current_menu] = self.scrolling_offset;
	      self.saved_trigger[self.current_menu] = self.previous_trigger;

	      self playSoundToPlayer("h1_ui_pause_menu_resume", self);

	      if(isDefined(self.previous[(self.previous.size - 1)])) {
	        self new_menu();
	      } else {
	        self close_menu();
	      }

	      while(self meleeButtonPressed()) {
	        wait 0.2;
	      }
	    } else if(self adsButtonPressed() && !self attackButtonPressed() || self attackButtonPressed() && !self adsButtonPressed()) {

	      self playSoundToPlayer("h1_ui_menu_scroll", self);

	      scroll_cursor(set_variable(self attackButtonPressed(), "down", "up"));

	      wait (0.2);
	    } else if(self fragButtonPressed() && !self secondaryOffhandButtonPressed() || !self fragButtonPressed() && self secondaryOffhandButtonPressed()) {

	      self playSoundToPlayer("h1_ui_menu_scroll", self);

	      if(isDefined(self.structure[self.cursor_index].array) || isDefined(self.structure[self.cursor_index].increment)) {
	        scroll_slider(set_variable(self secondaryOffhandButtonPressed(), "left", "right"));
	      }

	      wait (0.2);
	    } else if(self useButtonPressed()) {
	      self.saved_index[self.current_menu] = self.cursor_index;
	      self.saved_offset[self.current_menu] = self.scrolling_offset;
	      self.saved_trigger[self.current_menu] = self.previous_trigger;

	      self playSoundToPlayer("mp_ui_decline", self);

	      if(self.structure[self.cursor_index].command == ::new_menu) {
	        self.previous_option = self.structure[self.cursor_index].text;
	      }

	      if(isDefined(self.structure[self.cursor_index].array) || isDefined(self.structure[self.cursor_index].increment)) {
	        if(isDefined(self.structure[self.cursor_index].array)) {
	          cursor_selected = self.structure[self.cursor_index].array[self.slider[(self.current_menu + "_" + self.cursor_index)]];
	        } else {
	          cursor_selected = self.slider[(self.current_menu + "_" + (self.cursor_index))];
	        }
	        self thread execute_function(self.structure[self.cursor_index].command, cursor_selected, self.structure[self.cursor_index].parameter_1, self.structure[self.cursor_index].parameter_2, self.structure[self.cursor_index].parameter_3);
	      } else if(isDefined(self.structure[self.cursor_index]) && isDefined(self.structure[self.cursor_index].command)) {
	        self thread execute_function(self.structure[self.cursor_index].command, self.structure[self.cursor_index].parameter_1, self.structure[self.cursor_index].parameter_2, self.structure[self.cursor_index].parameter_3);
	      }

	      self menu_option();
	      set_options();

	      while(self useButtonPressed()) {
	        wait 0.2;
	      }
	    }
	  }
	  wait 0.05;
	}
}

player_connect() {
	level endon("game_ended");

	for(;;) {
	  level waittill("connected", player);

	  if(isBot(player)) {
	    return;
	  }

	  player.access = player isHost() ? "Host" : "None";

	  player initial_variables();
	  player thread initialize_menu();
	}
}

// Hud Functions

open_menu() {
	self.in_menu = true;

	set_menu_visibility(1);

	self menu_option();
	scroll_cursor();
	set_options();
}

close_menu() {
	set_menu_visibility(0);

	self.in_menu = false;
}

close_controls_menu() {
	self.menu["border"] set_shader("white", self.menu["border"].width, 123);
	self.menu["background"] set_shader("white", self.menu["background"].width, 121);
	self.menu["foreground"] set_shader("white", self.menu["foreground"].width, 106);

	self.controls_menu_open = false;

	set_menu_visibility(0);

	self.menu["title"] set_text("");

	self.in_menu = false;
}

set_menu_visibility(opacity) {
	if(opacity == 0) {
	  self.menu["border"].alpha = opacity;
	  self.menu["description"].alpha = opacity;
	  for(i = 1; i <= self.option_limit; i++) {
	    self.menu["toggle_" + i].alpha = opacity;
	    self.menu["slider_" + i].alpha = opacity;
	  }
	}

	self.menu["title"].alpha = opacity;
	self.menu["separator_1"].alpha = opacity;
	self.menu["separator_2"].alpha = opacity;

	self.menu["options"].alpha = opacity;
	self.menu["submenu_icons"].alpha = opacity;
	self.menu["slider_texts"].alpha = opacity;

	waitframe();

	self.menu["background"].alpha = opacity;
	self.menu["foreground"].alpha = opacity;
	self.menu["cursor"].alpha = opacity;

	if(opacity == 1) {
	  self.menu["border"].alpha = opacity;
	}
}

create_text(text, font, font_scale, align_x, align_y, x_offset, y_offset, color, alpha, z_index, hide_when_in_menu) {
	textElement = self createFontString(font, font_scale);
	textElement setPoint(align_x, align_y, x_offset, y_offset);

	textElement.alpha = alpha;
	textElement.sort = z_index;
	textElement.anchor = self;
	textElement.archived = self auto_archive();

	if(isDefined(hide_when_in_menu)) {
	  textElement.hideWhenInMenu = hide_when_in_menu;
	} else {
	  textElement.hideWhenInMenu = true;
	}

	if(isDefined(color)) {
	  if(!isString(color)) {
	    textElement.color = color;
	  } else if(color == "rainbow") {
	    textElement.color = level.rainbow_color;
	    textElement thread start_rainbow();
	  }
	} else {
	  textElement.color = (0, 1, 1);
	}

	if(isDefined(text)) {
	  if(isNumber(text)) {
	    textElement setValue(text);
	  } else {
	    textElement set_text(text);
	  }
	}

	self.element_result++;
	return textElement;
}

set_text(text) {
	if(!isDefined(self) || !isDefined(text)) {
	  return;
	}

	self.text = text;
	self setText(text);
}

add_text(text, index) {
	if(!isDefined(self) || !isDefined(text)) {
		return;
	}

	self.text = text;
	self.text_array[index] = text + "\n\n";
}

set_text_array() {
	if(!isDefined(self)) {
		return;
	}

	if(!isDefined(self.previous_text)) {
		self.previous_text = "";
	}

	text = "";

	for(i = 1; i <= self.text_array.size; i++) {
		text = text + self.text_array[i];
	}

	if(text != self.previous_text) {
		self.previous_text = text;
		self setText(text);
	}
}

create_shader(shader, align_x, align_y, x_offset, y_offset, width, height, color, alpha, z_index, hide_when_in_menu) {
	shaderElement = newClientHudElem(self);
	shaderElement.elemType = "icon";
	shaderElement.children = [];
	shaderElement.alpha = alpha;
	shaderElement.sort = z_index;
	shaderElement.anchor = self;
	shaderElement.archived = self auto_archive();

	if(isDefined(hide_when_in_menu)) {
	  shaderElement.hideWhenInMenu = hide_when_in_menu;
	} else {
	  shaderElement.hideWhenInMenu = true;
	}

	if(isDefined(color)) {
	  if(!isString(color)) {
	    shaderElement.color = color;
	  } else if(color == "rainbow") {
	    shaderElement.color = level.rainbow_color;
	    shaderElement thread start_rainbow();
	  }
	} else {
	  shaderElement.color = (0, 1, 1);
	}

	shaderElement setParent(level.uiParent);
	shaderElement setPoint(align_x, align_y, x_offset, y_offset);

	shaderElement set_shader(shader, width, height);

	self.element_result++;
	return shaderElement;
}

set_shader(shader, width, height) {
	if(!isDefined(self)) {
	  return;
	}

	if(!isDefined(shader)) {
	  if(!isDefined(self.shader)) {
	    return;
	  }

	  shader = self.shader;
	}

	if(!isDefined(width)) {
	  if(!isDefined(self.width)) {
	    return;
	  }

	  width = self.width;
	}

	if(!isDefined(height)) {
	  if(!isDefined(self.height)) {
	    return;
	  }

	  height = self.height;
	}

	self.shader = shader;
	self.width = width;
	self.height = height;
	self setShader(shader, width, height);
}

auto_archive() {
	if(!isDefined(self.element_result)) {
	  self.element_result = 0;
	}

	if(!isAlive(self) || self.element_result > 22) {
	  return true;
	}

	return false;
}

update_element_positions() {
	self.menu["border"].x = (self.x_offset - 1);
	self.menu["border"].y = (self.y_offset - 1);

	self.menu["background"].x = self.x_offset;
	self.menu["background"].y = self.y_offset;

	self.menu["foreground"].x = self.x_offset;
	self.menu["foreground"].y = (self.y_offset + 15);

	self.menu["separator_1"].x = (self.x_offset + 5);
	self.menu["separator_1"].y = (self.y_offset + 7.5);

	self.menu["separator_2"].x = (self.x_offset + 220);
	self.menu["separator_2"].y = (self.y_offset + 7.5);

	self.menu["cursor"].x = self.x_offset;

	self.menu["description"].y = (self.y_offset + (self.option_limit * 17.5));

	self.menu["options"].x = (self.x_offset + 5);
	self.menu["options"].y = (self.y_offset + 20);

	self.menu["submenu_icons"].x = (self.x_offset + 215);
	self.menu["submenu_icons"].y = (self.y_offset + 20);

	self.menu["slider_texts"].x = (self.x_offset + 132.5);
	self.menu["slider_texts"].y = (self.y_offset + 20);

	for(i = 1; i <= self.option_limit; i++) {
		self.menu["toggle_" + i].x = (self.x_offset + 11);
		self.menu["toggle_" + i].y = ((self.y_offset + 4) + (i * 16.5));

		self.menu["slider_" + i].x = self.x_offset;
		self.menu["slider_" + i].y = (self.y_offset + (i * 16.5));
	}
}

// Colors

create_rainbow_color() {
	x = 0; y = 0;
	r = 0; g = 0; b = 0;
	level.rainbow_color = (0, 0, 0);

	level endon("game_ended");

	while(true) {
	  if(y >= 0 && y < 258) {
	    r = 255;
	    g = 0;
	    b = x;
	  } else if(y >= 258 && y < 516) {
	    r = 255 - x;
	    g = 0;
	    b = 255;
	  } else if(y >= 516 && y < 774) {
	    r = 0;
	    g = x;
	    b = 255;
	  } else if(y >= 774 && y < 1032) {
	    r = 0;
	    g = 255;
	    b = 255 - x;
	  } else if(y >= 1032 && y < 1290) {
	    r = x;
	    g = 255;
	    b = 0;
	  } else if(y >= 1290 && y < 1545) {
	    r = 255;
	    g = 255 - x;
	    b = 0;
	  }

	  x += 3;
	  if(x > 255) {
	    x = 0;
	  }

	  y += 3;
	  if(y > 1545) {
	    y = 0;
	  }

	  level.rainbow_color = (r/255, g/255, b/255);
	  wait 0.05;
	}
}

start_rainbow() {
	level endon("game_ended");
	self endon("stop_rainbow");
	self.rainbow_enabled = true;

	while(isDefined(self) && self.rainbow_enabled) {
	  self fadeOverTime(.05);
	  self.color = level.rainbow_color;
	  wait 0.05;
	}
}

// Misc Functions

return_toggle(variable) {
	return isDefined(variable) && variable;
}

return_false() {
	return false;
}

set_variable(check, option_1, option_2) {
	if(check) {
	  return option_1;
	} else {
	  return option_2;
	}
}

in_array(array, item) {
	if(!isDefined(array) || !isArray(array)) {
	  return;
	}

	for(a = 0; a < array.size; a++) {
	  if(array[a] == item) {
	    return true;
	  }
	}

	return false;
}

clean_name(name) {
	if(!isDefined(name) || name == "") {
	  return;
	}

	illegal = ["^A", "^B", "^F", "^H", "^I", "^0", "^1", "^2", "^3", "^4", "^5", "^6", "^7", "^8", "^9", "^:"];
	new_string = "";
	for(a = 0; a < name.size; a++) {
	  if(a < (name.size - 1)) {
	    if(in_array(illegal, (name[a] + name[(a + 1)]))) {
	      a += 2;
	      if(a >= name.size) {
	        break;
	      }
	    }
	  }

	  if(isDefined(name[a]) && a < name.size) {
	    new_string += name[a];
	  }
	}

	return new_string;
}

get_name() {
	name = self.name;
	if(name[0] != "[") {
	  return name;
	}

	for(a = (name.size - 1); a >= 0; a--) {
	  if(name[a] == "]") {
	    break;
	  }
	}

	return getSubStr(name, (a + 1));
}

player_damage_callback(inflictor, attacker, damage, flags, death_reason, weapon, point, direction, hit_location, time_offset) {
	self endon("disconnect");

	if(isDefined(self.god_mode) && self.god_mode) {
	  return;
	}

	[[level.originalCallbackPlayerDamage]](inflictor, attacker, damage, flags, death_reason, weapon, point, direction, hit_location, time_offset);
}

load_weapons(weapon_category) {
	for(i = 0; i < self.syn["weapons"][weapon_category][0].size; i++) {
		if(weapon_category == "equipment") {
			self add_option(self.syn["weapons"][weapon_category][1][i], undefined, ::give_weapon, self.syn["weapons"][weapon_category][0][i]);
		} else {
			self add_option(self.syn["weapons"][weapon_category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][weapon_category][0][i]);
		}
	}
}

// Custom Structure

execute_function(command, parameter_1, parameter_2, parameter_3, parameter_4) {
	self endon("disconnect");

	if(!isDefined(command)) {
	  return;
	}

	if(isDefined(parameter_4)) {
	  return self thread[[command]](parameter_1, parameter_2, parameter_3, parameter_4);
	}

	if(isDefined(parameter_3)) {
	  return self thread[[command]](parameter_1, parameter_2, parameter_3);
	}

	if(isDefined(parameter_2)) {
	  return self thread[[command]](parameter_1, parameter_2);
	}

	if(isDefined(parameter_1)) {
	  return self thread[[command]](parameter_1);
	}

	self thread[[command]]();
}

add_option(text, description, command, parameter_1, parameter_2, parameter_3) {
	option = spawnStruct();
	option.text = text;
	if(isDefined(description)) {
	  option.description = description;
	}
	if(!isDefined(command)) {
	  option.command = ::empty_function;
	} else {
	  option.command = command;
	}
	if(isDefined(parameter_1)) {
	  option.parameter_1 = parameter_1;
	}
	if(isDefined(parameter_2)) {
	  option.parameter_2 = parameter_2;
	}
	if(isDefined(parameter_3)) {
	  option.parameter_3 = parameter_3;
	}

	self.structure[self.structure.size] = option;
}

add_toggle(text, description, command, variable, parameter_1, parameter_2) {
	option = spawnStruct();
	option.text = text;
	if(isDefined(description)) {
	  option.description = description;
	}
	if(!isDefined(command)) {
	  option.command = ::empty_function;
	} else {
	  option.command = command;
	}
	option.toggle = isDefined(variable) && variable;
	if(isDefined(parameter_1)) {
	  option.parameter_1 = parameter_1;
	}
	if(isDefined(parameter_2)) {
	  option.parameter_2 = parameter_2;
	}

	self.structure[self.structure.size] = option;
}

add_array(text, description, command, array, parameter_1, parameter_2, parameter_3) {
	option = spawnStruct();
	option.text = text;
	if(isDefined(description)) {
	  option.description = description;
	}
	if(!isDefined(command)) {
	  option.command = ::empty_function;
	} else {
	  option.command = command;
	}
	if(!isDefined(command)) {
	  option.array = [];
	} else {
	  option.array = array;
	}
	if(isDefined(parameter_1)) {
	  option.parameter_1 = parameter_1;
	}
	if(isDefined(parameter_2)) {
	  option.parameter_2 = parameter_2;
	}
	if(isDefined(parameter_3)) {
	  option.parameter_3 = parameter_3;
	}

	self.structure[self.structure.size] = option;
}

add_increment(text, description, command, start, minimum, maximum, increment, parameter_1, parameter_2) {
	option = spawnStruct();
	option.text = text;
	if(isDefined(description)) {
	  option.description = description;
	}
	if(!isDefined(command)) {
	  option.command = ::empty_function;
	} else {
	  option.command = command;
	}
	if(isNumber(start)) {
	  option.start = start;
	} else {
	  option.start = 0;
	}
	if(isNumber(minimum)) {
	  option.minimum = minimum;
	} else {
	  option.minimum = 0;
	}
	if(isNumber(maximum)) {
	  option.maximum = maximum;
	} else {
	  option.maximum = 10;
	}
	if(isNumber(increment)) {
	  option.increment = increment;
	} else {
	  option.increment = 1;
	}
	if(isDefined(parameter_1)) {
	  option.parameter_1 = parameter_1;
	}
	if(isDefined(parameter_2)) {
	  option.parameter_2 = parameter_2;
	}

	self.structure[self.structure.size] = option;
}

get_title_width(title) {
	letter_index = [" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
	letter_width = [5, 12, 11, 11, 10, 10, 10, 11, 11, 5, 10, 10, 9, 12, 11, 11, 10, 12, 10, 19, 11, 10, 11, 14, 10, 11, 10];
	title_width = 0;

	for(i = 1; i < title.size; i++) {
	  for(x = 1; x < letter_index.size; x++) {
	    if(tolower(title[i]) == tolower(letter_index[x])) {
	      title_width = int(title_width) + int(letter_width[x]);
	    }
	  }
	}

	return title_width;
}

add_menu(title) {
	self.menu["title"] set_text(title);

	title_width = get_title_width(title);

	self.menu["title"].x = (self.x_offset + ceil((((-0.0000124 * title_width + 0.003832) * title_width - 0.52) * title_width + 115.258) * 10) / 10);
	self.menu["title"].y = (self.y_offset + 3);
}

new_menu(menu) {
	if(!isDefined(menu)) {
	  menu = self.previous[(self.previous.size - 1)];
	  self.previous[(self.previous.size - 1)] = undefined;
	} else {
	  self.previous[self.previous.size] = self.current_menu;
	}

	if(!isDefined(self.slider[(menu + "_" + (self.cursor_index))])) {
	  self.slider[(menu + "_" + (self.cursor_index))] = 0;
	}

	self.current_menu = set_variable(isDefined(menu), menu, "Synergy");

	if(isDefined(self.saved_index[self.current_menu])) {
	  self.cursor_index = self.saved_index[self.current_menu];
	  self.scrolling_offset = self.saved_offset[self.current_menu];
	  self.previous_trigger = self.saved_trigger[self.current_menu];
	  self.loaded_offset = true;
	} else {
	  self.cursor_index = 0;
	  self.scrolling_offset = 0;
	  self.previous_trigger = 0;
	}

	self menu_option();
	scroll_cursor();
}

empty_function() {}

empty_option() {
	option = ["Nothing To See Here!", "Quiet Here, Isn't It?", "Oops, Nothing Here Yet!", "Bit Empty, Don't You Think?"];
	return option[randomInt(option.size)];
}

scroll_cursor(direction) {
	maximum = self.structure.size - 1;
	fake_scroll = false;

	if(maximum < 0) {
	  maximum = 0;
	}

	if(isDefined(direction)) {
	  if(direction == "down") {
	    self.cursor_index++;
	    if(self.cursor_index > maximum) {
	      self.cursor_index = 0;
	      self.scrolling_offset = 0;
	    }
	  } else if(direction == "up") {
	    self.cursor_index--;
	    if(self.cursor_index < 0) {
	      self.cursor_index = maximum;
	      if(((self.cursor_index) + int((self.option_limit / 2))) >= (self.structure.size - 2)) {
	        self.scrolling_offset = (self.structure.size - self.option_limit);
	      }
	    }
	  }
	} else {
	  while(self.cursor_index > maximum) {
	    self.cursor_index--;
	  }
	  self.menu["cursor"].y = int(self.y_offset + (((self.cursor_index + 1) - self.scrolling_offset) * 16.5));
	}

	self.previous_scrolling_offset = self.scrolling_offset;

	if(!self.loaded_offset) {
	  if(self.cursor_index >= int(self.option_limit / 2) && self.structure.size > self.option_limit) {
	    if((self.cursor_index + int(self.option_limit / 2)) >= (self.structure.size - 2)) {
	      self.scrolling_offset = (self.structure.size - self.option_limit);
	      if(self.previous_trigger == 2) {
	        self.scrolling_offset--;
	      }
	      if(self.previous_scrolling_offset != self.scrolling_offset) {
	        fake_scroll = true;
	        self.previous_trigger = 1;
	      }
	    } else {
	      self.scrolling_offset = (self.cursor_index - int(self.option_limit / 2));
	      self.previous_trigger = 2;
	    }
	  } else {
	    self.scrolling_offset = 0;
	    self.previous_trigger = 0;
	  }
	}

	if(self.scrolling_offset < 0) {
	  self.scrolling_offset = 0;
	}

	if(!fake_scroll) {
	  self.menu["cursor"].y = int(self.y_offset + (((self.cursor_index + 1) - self.scrolling_offset) * 16.5));
	}

	if(isDefined(self.structure[self.cursor_index]) && isDefined(self.structure[self.cursor_index].description)) {
	  self.menu["description"] set_text(self.structure[self.cursor_index].description);
	  self.description_height = 15;

	  self.menu["description"].x = (self.x_offset + 5);
	  self.menu["description"].alpha = 1;
	} else {
	  self.menu["description"] set_text("");
	  self.menu["description"].alpha = 0;
	  self.description_height = 0;
	}

	self.loaded_offset = false;
	set_options();
}

scroll_slider(direction) {
	current_slider_index = self.slider[(self.current_menu + "_" + (self.cursor_index))];
	if(isDefined(direction)) {
	  if(isDefined(self.structure[self.cursor_index].array)) {
	    if(direction == "left") {
	      current_slider_index--;
	      if(current_slider_index < 0) {
	        current_slider_index = (self.structure[self.cursor_index].array.size - 1);
	      }
	    } else if(direction == "right") {
	      current_slider_index++;
	      if(current_slider_index > (self.structure[self.cursor_index].array.size - 1)) {
	        current_slider_index = 0;
	      }
	    }
	  } else {
	    if(direction == "left") {
	      current_slider_index -= self.structure[self.cursor_index].increment;
	      if(current_slider_index < self.structure[self.cursor_index].minimum) {
	        current_slider_index = self.structure[self.cursor_index].maximum;
	      }
	    } else if(direction == "right") {
	      current_slider_index += self.structure[self.cursor_index].increment;
	      if(current_slider_index > self.structure[self.cursor_index].maximum) {
	        current_slider_index = self.structure[self.cursor_index].minimum;
	      }
	    }
	  }
	}
	self.slider[(self.current_menu + "_" + (self.cursor_index))] = current_slider_index;
	set_options();
}

set_options() {
	for(i = 1; i <= self.option_limit; i++) {
	  self.menu["toggle_" + i].alpha = 0;
	  self.menu["slider_" + i].alpha = 0;

		self.menu["options"] add_text("", i);
		self.menu["submenu_icons"] add_text("", i);
		self.menu["slider_texts"] add_text("", i);
	}

	update_element_positions();

	if(isDefined(self.structure)) {
	  if(self.structure.size == 0) {
	    self add_option(empty_option());
	  }

	  self.maximum = int(min(self.structure.size, self.option_limit));

	  if(self.structure.size <= self.option_limit) {
	    self.scrolling_offset = 0;
	  }

	  for(i = 1; i <= self.maximum; i++) {
	    x = ((i - 1) + self.scrolling_offset);

	    self.menu["options"] add_text(self.structure[x].text, i);

	    if(isDefined(self.structure[x].toggle)) {
	      self.menu["options"].alpha = 1;
	      self.menu["toggle_" + i].alpha = 1;

	      if(self.structure[x].toggle) {
	        self.menu["toggle_" + i].color = (1, 1, 1);
	      } else {
	        self.menu["toggle_" + i].color = (0.25, 0.25, 0.25);
	      }
	    } else {
	      self.menu["toggle_" + i].alpha = 0;
	    }

	    if(isDefined(self.structure[x].array) && (self.cursor_index) == x) {
	      if(!isDefined(self.slider[(self.current_menu + "_" + x)])) {
	        self.slider[(self.current_menu + "_" + x)] = 0;
	      }

	      if(self.slider[(self.current_menu + "_" + x)] > (self.structure[x].array.size - 1) || self.slider[(self.current_menu + "_" + x)] < 0) {
	        self.slider[(self.current_menu + "_" + x)] = set_variable(self.slider[(self.current_menu + "_" + x)] > (self.structure[x].array.size - 1), 0, (self.structure[x].array.size - 1));
	      }

	      slider_text = self.structure[x].array[self.slider[(self.current_menu + "_" + x)]] + " [" + (self.slider[(self.current_menu + "_" + x)] + 1) + "/" + self.structure[x].array.size + "]";

	      self.menu["slider_texts"] add_text(slider_text, i);
	    } else if(isDefined(self.structure[x].increment) && (self.cursor_index) == x) {
	      value = abs((self.structure[x].minimum - self.structure[x].maximum)) / 224;
	      width = ceil((self.slider[(self.current_menu + "_" + x)] - self.structure[x].minimum) / value);

	      if(width >= 0) {
	        self.menu["slider_" + i] set_shader("white", int(width), 16);
	      } else {
	        self.menu["slider_" + i] set_shader("white", 0, 16);
	        self.menu["slider_" + i].alpha = 0;
	      }

	      if(!isDefined(self.slider[(self.current_menu + "_" + x)]) || self.slider[(self.current_menu + "_" + x)] < self.structure[x].minimum) {
	        self.slider[(self.current_menu + "_" + x)] = self.structure[x].start;
	      }

	      slider_value = self.slider[(self.current_menu + "_" + x)];

	      self.menu["slider_texts"] add_text(slider_value, i);
	      self.menu["slider_" + i].alpha = 1;
	    }

	    if(isDefined(self.structure[x].command) && self.structure[x].command == ::new_menu) {
	      self.menu["submenu_icons"] add_text(">", i);
	    }
	  }
	}

	self.menu["options"] set_text_array();
	self.menu["submenu_icons"] set_text_array();
	self.menu["slider_texts"] set_text_array();

	menu_height = int(18 + (self.maximum * 16.5));

	self.menu["description"].y = int((self.y_offset + 4) + ((self.maximum + 1) * 16.5));

	self.menu["border"] set_shader("white", self.menu["border"].width, int(menu_height + self.description_height));
	self.menu["background"] set_shader("white", self.menu["background"].width, int((menu_height - 2) + self.description_height));
	self.menu["foreground"] set_shader("white", self.menu["foreground"].width, int(menu_height - 17));
}

// Menu Options

menu_option() {
	self.structure = [];
	menu = self.current_menu;
	switch(menu) {
	  case "Synergy":
	    self add_menu(menu);

	    self add_option("Basic Options", undefined, ::new_menu, "Basic Options");
	    self add_option("Fun Options", undefined, ::new_menu, "Fun Options");
	    self add_option("Weapon Options", undefined, ::new_menu, "Weapon Options");
	    self add_option("Give Killstreaks", undefined, ::new_menu, "Give Killstreaks");
	    self add_option("Account Options", undefined, ::new_menu, "Account Options");
	    self add_option("Menu Options", undefined, ::new_menu, "Menu Options");
			self add_option("Map Options", undefined, ::new_menu, "Map Options");
			self add_option("Bot Options", undefined, ::new_menu, "Bot Options");
	    self add_option("All Players", undefined, ::new_menu, "All Players");

	    break;
	  case "Basic Options":
	    self add_menu(menu);

	    self add_toggle("     God Mode", "Makes you Invincible", ::god_mode, self.god_mode);
	    self add_toggle("     No Clip", "Fly through the Map", ::no_clip, self.no_clip);
	    self add_toggle("     Frag No Clip", "Fly through the Map using (^3[{+frag}]^7)", ::frag_no_clip, self.frag_no_clip);
	    self add_toggle("     UFO", "Fly Straight through the Map", ::ufo_mode, self.ufo_mode);
	    self add_toggle("     Infinite Ammo", "Gives you Infinite Ammo and Infinite Grenades", ::infinite_ammo, self.infinite_ammo);

			self add_toggle("     Rapid Fire", "Shoot Very Fast (Hold ^3[{+reload}]^7 & ^3[{+attack}])", ::rapid_fire, self.rapid_fire);
			self add_toggle("     No Recoil", "No Recoil while ADS & Firing", ::no_recoil, self.no_recoil);
			self add_toggle("     No Spread", "No Bullet Spread while Hip-firing", ::no_spread, self.no_spread);

	    self add_option("Give All Perks", undefined, ::give_all_perks);
	    self add_option("Take All Perks", undefined, ::take_all_perks);

	    self add_option("Give Perks", undefined, ::new_menu, "Give Perks");
	    self add_option("Take Perks", undefined, ::new_menu, "Take Perks");

	    break;
	  case "Fun Options":
	    self add_menu(menu);

	    self add_toggle("     Fullbright", "Removes all Shadows and Lighting", ::fullbright, self.fullbright);
	    self add_toggle("     Third Person", undefined, ::third_person, self.third_person);

			self add_toggle("     Super Jump", undefined, ::super_jump, self.super_jump);

	    self add_increment("Set Speed", undefined, ::set_speed, 190, 190, 990, 50);
	    self add_increment("Set Timescale", undefined, ::set_timescale, 1, 1, 10, 1);

	    self add_option("Visions", undefined, ::new_menu, "Visions");

	    break;
	  case "Weapon Options":
	    self add_menu(menu);

			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");

			self add_option("Give Weapons", undefined, ::new_menu, "Give Weapons");

			if(category != "melee" && category != "equipment") {
				self add_option("Attachments", undefined, ::new_menu, "Attachments");
			}

			self add_option("Take Current Weapon", undefined, ::take_weapon);
			self add_option("Drop Current Weapon", undefined, ::drop_weapon);

	    break;
	  case "Give Killstreaks":
	    self add_menu(menu);

			for(i = 0; i < self.syn["killstreaks"][0].size; i++) {
				self add_option(self.syn["killstreaks"][1][i], undefined, ::give_killstreak, self.syn["killstreaks"][0][i]);
			}

	    break;
	  case "Account Options":
	    self add_menu(menu);

			self add_option("Rainbow Classes", "Set Rainbow Class Names", ::set_colored_classes);

			self add_increment("Set Prestige", undefined, ::set_prestige, 0, 0, 20, 1);

			if(isDefined(self.set_20th_prestige)) {
				self add_increment("Set Level", undefined, ::set_rank, 0, 0, 1000, 10);
			} else {
				self add_increment("Set Level", undefined, ::set_rank, 0, 0, 70, 1);
			}

			self add_option("Unlock All", undefined, ::set_challenges);

	    break;
	  case "Menu Options":
	    self add_menu(menu);

	    self add_increment("Move Menu X", "Move the Menu around Horizontally", ::modify_menu_position, 0, -600, 20, 10, "x");
	    self add_increment("Move Menu Y", "Move the Menu around Vertically", ::modify_menu_position, 0, -100, 30, 10, "y");

	    self add_option("Rainbow Menu", "Set the Menu Outline Color to Cycling Rainbow", ::set_menu_rainbow);

	    self add_increment("Red", "Set the Red Value for the Menu Outline Color", ::set_menu_color, 255, 1, 255, 1, "Red");
	    self add_increment("Green", "Set the Green Value for the Menu Outline Color", ::set_menu_color, 255, 1, 255, 1, "Green");
	    self add_increment("Blue", "Set the Blue Value for the Menu Outline Color", ::set_menu_color, 255, 1, 255, 1, "Blue");

	    self add_toggle("     Hide UI", undefined, ::hide_ui, self.hide_ui);
	    self add_toggle("     Hide Weapon", undefined, ::hide_weapon, self.hide_weapon);

	    break;
		case "Map Options":
			self add_menu(menu);

			self add_option("Change Map", undefined, ::new_menu, "Change Map");
			self add_toggle("     No Fog", "Removes all Fog", ::no_fog, self.no_fog);
			self add_option("End Game", undefined, ::end_game);

			break;
		case "Change Map":
			self add_menu(menu);

			for(i = 0; i < self.syn["maps"][0].size; i++) {
				self add_option(self.syn["maps"][1][i], undefined, ::change_map, self.syn["maps"][0][i], i);
			}

			break;
		case "Bot Options":
			self add_menu(menu);

			self add_array("Set Difficulty", undefined, ::set_difficulty, ["Recruit", "Regular", "Hardened", "Veteran"]);

			self add_option("Spawn Friendly Bot", undefined, ::spawn_friendly_bot);
			self add_option("Spawn Enemy Bot", undefined, ::spawn_enemy_bot);
			self add_option("Kick Random Bot", undefined, ::kick_random_bot);

			break;
	  case "All Players":
	    self add_menu(menu);

	    foreach(player in level.players){
	      self add_option(player.name, undefined, ::new_menu, "Player Option", player);
	    }

	    break;
	  case "Player Option":
	    self add_menu(menu);

	    target = undefined;
	    foreach(player in level.players) {
	      if(player.name == self.previous_option) {
	        target = player;
	        break;
	      }
	    }

	    if(isDefined(target)) {
	      self add_option("Print", "Print Player Name", ::print_player_name, target);
	      self add_option("Kill", "Kill the Player", ::commit_suicide, target);

	      if(isBot(target)) {
	        self add_option("Get Difficulty", undefined, ::get_difficulty, target);
	      }

	      if(!target isHost()) {
	        self add_option("Kick", "Kick the Player from the Game", ::kick_player, target);
	      }
	    } else {
	      self add_option("Player not found");
	    }

	    break;
	  case "Give Perks":
	    self add_menu(menu);

			for(i = 0; i < self.syn["perks"][0].size; i++) {
				self add_option(self.syn["perks"][1][i], undefined, ::give_perk, self.syn["perks"][0][i], 0);
			}

			for(i = 0; i < self.syn["perks"][2].size; i++) {
				self add_option(self.syn["perks"][3][i], undefined, ::give_perk, self.syn["perks"][2][i], 0);
			}

	    break;
	  case "Take Perks":
	    self add_menu(menu);

			for(i = 0; i < self.syn["perks"][0].size; i++) {
				self add_option(self.syn["perks"][1][i], undefined, ::take_perk, self.syn["perks"][0][i]);
			}

			for(i = 0; i < self.syn["perks"][2].size; i++) {
				self add_option(self.syn["perks"][3][i], undefined, ::take_perk, self.syn["perks"][2][i]);
			}

	    break;
	  case "Visions":
	    self add_menu(menu);

	    for(i = 0; i < self.syn["visions"][0].size; i++) {
	      self add_option(self.syn["visions"][0][i], undefined, ::set_vision, self.syn["visions"][1][i]);
	    }

	    break;
	  case "Give Weapons":
	    self add_menu(menu);

			for(i = 0; i < self.syn["weapons"]["category"][1].size; i++) {
				self add_option(self.syn["weapons"]["category"][1][i], undefined, ::new_menu, self.syn["weapons"]["category"][1][i]);
			}

	    break;
		case "Attachments":
			self add_menu(menu);

			weapon_name = getBaseWeaponName(self getCurrentWeapon());
			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");

			if(category != "melee" && category != "equipment") {
				self add_option("Equip Attachment", undefined, ::new_menu, "Equip Attachment");
				self add_option("Equip Kit", undefined, ::new_menu, "Equip Kit");
				self add_option("Equip Camo", undefined, ::new_menu, "Equip Camo");
			}

			if(weapon_name != "h1_junsho" && category != "pistols" && category != "melee" && category != "equipment") {
				self add_increment("Equip Reticle", undefined, ::equip_reticle, 0, 0, 182, 1);
			}

			break;
		case "Equip Attachment":
			self add_menu(menu);

			weapon_name = getBaseWeaponName(self getCurrentWeapon());

			if(weapon_name == "h1_junsho") {
				category = "rangers";
			} else {
				category = get_category(weapon_name + "_mp");
			}

			for(i = 0; i < self.syn["weapons"]["attachments"][0].size; i++) {
				self add_option(self.syn["weapons"]["attachments"][1][i], undefined, ::equip_attachment, self.syn["weapons"]["attachments"][0][i]);
			}

			if(category != "pistols") {
				for(i = 0; i < self.syn["weapons"][category]["attachments"][0].size; i++) {
					self add_option(self.syn["weapons"][category]["attachments"][1][i], undefined, ::equip_attachment, self.syn["weapons"][category]["attachments"][0][i]);
				}
			}

			break;
		case "Equip Kit":
			self add_menu(menu);

			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");

			self add_option("None", undefined, ::equip_kit, "base");

			for(i = 0; i < self.syn["weapons"][category]["kits"][0].size; i++) {
				self add_option(self.syn["weapons"][category]["kits"][1][i], undefined, ::equip_kit, self.syn["weapons"][category]["kits"][0][i]);
			}

			break;
		case "Equip Camo":
			self add_menu(menu);

			self add_increment("Equip Camo", undefined, ::equip_camo, 1, 1, 368, 1);
			self add_toggle("     Cycle Camos", "Cycle through all Available Camos", ::cycle_camos, self.cycle_camos);

			break;
	  case "Assault Rifles":
	    self add_menu(menu);

	    load_weapons("assault_rifles");

	    break;
	  case "Sub Machine Guns":
	    self add_menu(menu);

	    load_weapons("sub_machine_guns");

	    break;
	  case "Light Machine Guns":
	    self add_menu(menu);

	    load_weapons("light_machine_guns");

	    break;
	  case "Sniper Rifles":
	    self add_menu(menu);

	    load_weapons("sniper_rifles");

	    break;
	  case "Shotguns":
	    self add_menu(menu);

	    load_weapons("shotguns");

	    break;
	  case "Pistols":
	    self add_menu(menu);

	    load_weapons("pistols");

	    break;
	  case "Melee Weapons":
	    self add_menu(menu);

	    load_weapons("melee");

	    break;
	  case "Equipment":
	    self add_menu(menu);

	    load_weapons("equipment");

	    break;
	  default:
	    if(!isDefined(self.selected_player)) {
	      self.selected_player = self;
	    }

	    self player_option(menu, self.selected_player);
	    break;
	}
}

player_option(menu, player) {
	if(!isDefined(menu) || !isDefined(player) || !isPlayer(player)) {
	  menu = "Error";
	}

	switch (menu) {
	  case "Player Option":
	    self add_menu(clean_name(player get_name()));
	    break;
	  case "Error":
	    self add_menu();
	    self add_option("Oops, Something Went Wrong!", "Condition: Undefined");
	    break;
	  default:
	    error = true;
	    if(error) {
	      self add_menu("Critical Error");
	      self add_option("Oops, Something Went Wrong!", "Condition: Menu Index");
	    }
	    break;
	}
}

// Menu Options

iPrintString(string) {
	if(!isDefined(self.syn["string"])) {
	  self.syn["string"] = self create_text(string, "default", 1, "center", "top", 0, -100, (1, 1, 1), 1, 9999, false, true);
	} else {
	  self.syn["string"] set_text(string);
	}
	self.syn["string"] notify("stop_hud_fade");
	self.syn["string"].alpha = 1;
	self.syn["string"] setText(string);
	self.syn["string"] thread fade_hud(0, 2.5);
}

fade_hud(alpha, time) {
	self endon("stop_hud_fade");
	self fadeOverTime(time);
	self.alpha = alpha;
	wait time;
}

modify_menu_position(offset, axis) {
	if(axis == "x") {
	  self.x_offset = 175 + offset;
	} else {
	  self.y_offset = 160 + offset;
	}
	self close_menu();
	self open_menu();
}

set_menu_rainbow() {
	if(!isString(self.color_theme)) {
	  self.color_theme = "rainbow";
	  self.menu["border"] thread start_rainbow();
	  self.menu["separator_1"] thread start_rainbow();
	  self.menu["separator_2"] thread start_rainbow();
	  self.menu["border"].color = self.color_theme;
	  self.menu["separator_1"].color = self.color_theme;
	  self.menu["separator_2"].color = self.color_theme;
	}
}

set_menu_color(value, color) {
	if(color == "Red") {
	  self.menu_color_red = value;
	  iPrintString(color + " Changed to " + value);
	} else if(color == "Green") {
	  self.menu_color_green = value;
	  iPrintString(color + " Changed to " + value);
	} else if(color == "Blue") {
	  self.menu_color_blue = value;
	  iPrintString(color + " Changed to " + value);
	} else {
	  iPrintString(value + " | " + color);
	}
	self.color_theme = (self.menu_color_red / 255, self.menu_color_green / 255, self.menu_color_blue / 255);
	self.menu["border"] notify("stop_rainbow");
	self.menu["separator_1"] notify("stop_rainbow");
	self.menu["separator_2"] notify("stop_rainbow");
	self.menu["border"].rainbow_enabled = false;
	self.menu["separator_1"].rainbow_enabled = false;
	self.menu["separator_2"].rainbow_enabled = false;
	self.menu["border"].color = self.color_theme;
	self.menu["separator_1"].color = self.color_theme;
	self.menu["separator_2"].color = self.color_theme;
}

hide_ui() {
	self.hide_ui = !return_toggle(self.hide_ui);
	setDvar("cg_draw2d", !self.hide_ui);
}

hide_weapon() {
	self.hide_weapon = !return_toggle(self.hide_weapon);
	setDvar("cg_drawgun", !self.hide_weapon);
}

// Basic Options

god_mode() {
	self.god_mode = !return_toggle(self.god_mode);
	if(self.god_mode) {
		iPrintString("God Mode [^2ON^7]");
	} else {
		iPrintString("God Mode [^1OFF^7]");
	}
}

no_clip() {
	self.no_clip = !return_toggle(self.no_clip);
	executecommand("noclip");
	wait 0.01;
	if(self.no_clip) {
		iPrintString("No Clip [^2ON^7]");
	} else {
		iPrintString("No Clip [^1OFF^7]");
	}
}

frag_no_clip() {
	self endon("disconnect");
	self endon("game_ended");

	if(!isDefined(self.frag_no_clip)) {
		self.frag_no_clip = true;
		iPrintString("Frag No Clip [^2ON^7], Press ^3[{+frag}]^7 to Enter and ^3[{+melee}]^7 to Exit");
		while (isDefined(self.frag_no_clip)) {
			if(self fragButtonPressed()) {
				if(!isDefined(self.frag_no_clip_loop)) {
					self thread frag_no_clip_loop();
				}
			}
			wait 0.05;
		}
	} else {
		self.frag_no_clip = undefined;
		iPrintString("Frag No Clip [^1OFF^7]");
	}
}

frag_no_clip_loop() {
	self endon("disconnect");
	self endon("noclip_end");

	self disableWeapons();
	self disableOffHandWeapons();
	self.frag_no_clip_loop = true;

	clip = spawn("script_origin", self.origin);
	self playerLinkTo(clip);
	if(!isDefined(self.god_mode) || !self.god_mode) {
		god_mode();
		self.temp_god_mode = true;
	}

	while (true) {
		vec = anglesToForward(self getPlayerAngles());
		end = (vec[0] * 60, vec[1] * 60, vec[2] * 60);
		if(self attackButtonPressed()) {
			clip.origin = clip.origin + end;
		}
		if(self adsButtonPressed()) {
			clip.origin = clip.origin - end;
		}
		if(self meleeButtonPressed()) {
			break;
		}
		wait 0.05;
	}

	clip delete();
	self enableWeapons();
	self enableOffhandWeapons();

	if(isDefined(self.temp_god_mode)) {
		god_mode();
		self.temp_god_mode = undefined;
	}

	self.frag_no_clip_loop = undefined;
}

ufo_mode() {
	self.ufo_mode = !return_toggle(self.ufo_mode);
	executecommand("ufo");
	wait 0.01;
	if(self.ufo_mode) {
		iPrintString("UFO Mode [^2ON^7]");
	} else {
		iPrintString("UFO Mode [^1OFF^7]");
	}
}

infinite_ammo() {
	self.infinite_ammo = !return_toggle(self.infinite_ammo);
	if(self.infinite_ammo) {
		iPrintString("Infinite Ammo [^2ON^7]");
		self thread infinite_ammo_loop();
	} else {
		iPrintString("Infinite Ammo [^1OFF^7]");
		self notify("stop_infinite_ammo");
	}
}

infinite_ammo_loop() {
	self endon("stop_infinite_ammo");
	self endon("game_ended");

	for(;;) {
		self setWeaponAmmoClip(self getCurrentWeapon(), 999);
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "left");
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "right");
		wait 0.2;
	}
}

rapid_fire() { // Kony's Weapon Menu
	self.rapid_fire = !return_toggle(self.rapid_fire);
	if(self.rapid_fire) {
		self iPrintString("Rapid Fire [^2ON^7]");
		self giveperk( "specialty_fastreload", false);
		setDvar("perk_weapReloadMultiplier", 0.001);
	} else {
		self iPrintString("Rapid Fire [^1OFF^7]");
		setDvar("perk_weapReloadMultiplier", 1);
	}
}

no_recoil() {
	self.no_recoil = !return_toggle(self.no_recoil);
	if(self.no_recoil) {
		self iPrintString("No Recoil [^2ON^7]");
		self setRecoilScale(100);
	} else {
		self iPrintString("No Recoil [^1OFF^7]");
		self setRecoilScale(1);
	}
}

no_spread() {
	self.no_spread = !return_toggle(self.no_spread);
	if(self.no_spread) {
		self iPrintString("No Spread [^2ON^7]");
		setDvar("perk_weapSpreadMultiplier", 0.001);
		self giveperk("specialty_bulletaccuracy", false);
	} else {
		self iPrintString("No Spread [^1OFF^7]");
		setDvar("perk_weapSpreadMultiplier", 1);
	}
}

// Fun Options

fullbright() {
	self.fullbright = !return_toggle(self.fullbright);
	if(self.fullbright) {
		iPrintString("Fullbright [^2ON^7]");
		setDvar("r_fullbright", 1);
		wait 0.01;
	} else {
		iPrintString("Fullbright [^1OFF^7]");
		setDvar("r_fullbright", 0);
		wait 0.01;
	}
}

third_person() {
	self.third_person = !return_toggle(self.third_person);
	if(self.third_person) {
		iPrintString("Third Person [^2ON^7]");
		setDvar("camera_thirdPerson", 1);
	} else {
		iPrintString("Third Person [^1OFF^7]");
		setDvar("camera_thirdPerson", 0);
	}
}

set_speed(value) {
	setDvar("g_speed", value);
}

set_timescale(value) {
	setDvar("timescale", value);
}

super_jump() {
	self.super_jump = !return_toggle(self.super_jump);
	if(self.super_jump) {
		setDvar("jump_height", 999);
		if(!isDefined(self.god_mode) || !self.god_mode) {
			god_mode();
			self.jump_god_mode = true;
		}
		iPrintString("Super Jump [^2ON^7]");
	} else {
		setDvar("jump_height", 39);
		if(isDefined(self.jump_god_mode)) {
			god_mode();
			self.jump_god_mode = undefined;
		}
		iPrintString("Super Jump [^1OFF^7]");
	}
}

set_vision(vision) {
	self visionSetNakedForPlayer("", 0.1);
	wait 0.25;
	self visionSetNakedForPlayer(vision, 0.1);
}

end_game() {
	setDvar("xblive_privatematch", 1);
	exitLevel(0);
}

// Player Options

print_player_name(target) {
	iPrintString(target);
}

commit_suicide(target) {
	target suicide();
}

kick_player(target) {
	kick(target getEntityNumber());
}

// Killstreaks

give_killstreak(streak) {
	self maps\mp\gametypes\_hardpoints::giveHardpoint(streak, 1);
}

// Perks

give_all_perks() {
	foreach(perk in self.syn["perks"][0]) {
	  giveperk(perk);
	}
	foreach(perk in self.syn["perks"][2]) {
	  giveperk(perk);
	}
}

take_all_perks() {
	foreach(perk in self.syn["perks"][0]) {
	  _unsetperk(perk);
	}
	foreach(perk in self.syn["perks"][2]) {
	  _unsetperk(perk);
	}
}

give_perk(perk) {
	giveperk(perk);
}

take_perk(perk) {
	if(_hasperk(perk)) {
		_unsetperk(perk);
	}
}

// Weapon Options

get_category(weapon) {
	foreach(weapon_category in self.syn["weapons"]["category"][0]) {
		foreach(weapon_id in self.syn["weapons"][weapon_category][0]) {
			if(weapon_id == weapon + "_a" || weapon_id == weapon) {
				return weapon_category;
			}
		}
	}
}

check_weapons(weapon) {
	return self getCurrentWeapon() != weapon && self getWeaponsListPrimaries()[1] != weapon;
}

give_weapon(weapon) {
	_giveWeapon(weapon);
	self switchToWeapon(weapon);
	wait 1;
	self setWeaponAmmoClip(self getCurrentWeapon(), 999);
	self setWeaponAmmoClip(self getCurrentWeapon(), 999, "left");
	self setWeaponAmmoClip(self getCurrentWeapon(), 999, "right");
}

give_base_weapon(weapon) {
	base_weapon_name = weapon + "#none_f#base";
	if(check_weapons(base_weapon_name)) {
		max_weapon_num = 2;
		if(self getWeaponsListPrimaries().size >= max_weapon_num) {
			self take_weapon(self getCurrentWeapon());
		}

		//iPrintString(weapon);
		if(weapon == "h1_junsho_mp_a") {
			self give_weapon(weapon + "#akimbohidden_f#base");
		} else {
			self give_weapon(base_weapon_name);
		}
	}
}

equip_attachment(attachment) {
	weapon = getBaseWeaponName(self getCurrentWeapon()) + "_mp_a";
	weapon_cosmetics = strtok(self getCurrentWeapon(), "#")[2];
	//iPrintString(weapon_cosmetics);
	if(check_weapons(weapon)) {
		weapon_attached = weapon + "#" + attachment + "#" + weapon_cosmetics;
		self take_weapon(self getCurrentWeapon());
		self give_weapon(weapon_attached);
		//iPrintString(weapon_attached);
	} else {
		self switchToWeapon(weapon);
	}
}

equip_kit(kit) {
	weapon = getBaseWeaponName(self getCurrentWeapon()) + "_mp_a";
	weapon_attachment = strtok(self getCurrentWeapon(), "#")[1];
	weapon_camo = strtok(strtok(self getCurrentWeapon(), "#")[2], "_")[1];
	//iPrintString(weapon);
	//wait 2;
	//iPrintString(weapon_attachment);
	//wait 2;
	//iPrintString(weapon_camo);
	//wait 2;
	wait 0.25;
	if(check_weapons(weapon)) {
		if(isDefined(weapon_camo)) {
			weapon_kitted = weapon + "#" + weapon_attachment + "#" + kit + "_" + weapon_camo;
		} else {
			weapon_kitted = weapon + "#" + weapon_attachment + "#" + kit;
		}
		//iPrintString(weapon_kitted);
		self take_weapon(self getCurrentWeapon());
		self give_weapon(weapon_kitted);
	} else {
		self switchToWeapon(weapon);
	}
}

equip_camo(camo) {
	weapon = getBaseWeaponName(self getCurrentWeapon()) + "_mp_a";
	weapon_attachment = strtok(self getCurrentWeapon(), "#")[1];
	weapon_kit = strtok(strtok(self getCurrentWeapon(), "#")[2], "_")[0];
	if(camo < 10) {
		camo = "00" + camo;
	} else if(int(camo) > 9 && int(camo) < 100) {
		camo = "0" + camo;
	}
	//iPrintString(camo);
	weapon_painted = weapon + "#" + weapon_attachment + "#" + weapon_kit + "_camo" + camo;
	if(check_weapons(weapon_painted)) {
		self take_weapon(self getCurrentWeapon());
		self give_weapon(weapon_painted);
		self switchToWeapon(weapon_painted);
	} else {
		self switchToWeapon(weapon);
	}
}

cycle_camos() {
	self.cycle_camos = !return_toggle(self.cycle_camos);
	if(self.cycle_camos) {
		iPrintString("Cycle Camos [^2ON^7]");
		self thread cycle_camos_loop();
	} else {
		iPrintString("Cycle Camos [^1OFF^7]");
		self notify("stop_cycle_camos");
	}
}

cycle_camos_loop() {
	self endon("stop_cycle_camos");
	self endon("game_ended");

	for(;;) {
		for(i = 1; i <= 368; i++) {
			equip_camo(i);
			wait 0.2;
		}
	}
}

equip_reticle(reticle) {
	weapon = getBaseWeaponName(self getCurrentWeapon()) + "_mp_a";
	weapon_attachment = strtok(self getCurrentWeapon(), "#")[1];
	weapon_kit = strtok(strtok(self getCurrentWeapon(), "#")[2], "_")[0];
	weapon_camo = strtok(strtok(self getCurrentWeapon(), "#")[2], "_")[1];
	weapon_reticle = "";
	if(strtok(weapon_camo, "scope")[0].size == 3) {
		weapon_reticle = strtok(weapon_camo, "scope")[0];
		weapon_camo =strtok(strtok(self getCurrentWeapon(), "#")[2], "_")[2];
	}
	reticle = reticle + 100;
	if(int(weapon_reticle) != int(reticle)) {
		if(isDefined(weapon_camo)) {
			weapon_attached = weapon + "#" + weapon_attachment + "#" + weapon_kit + "_scope" + reticle + "_" + weapon_camo;
		} else {
			weapon_attached = weapon + "#" + weapon_attachment + "#" + weapon_kit + "_scope" + reticle;
		}
		if(check_weapons(weapon_attached)) {
			self take_weapon(self getCurrentWeapon());
			self give_weapon(weapon_attached);
			self switchToWeapon(weapon_attached);
		} else {
			self switchToWeapon(weapon);
		}
	}
}

take_weapon() {
	self takeweapon(self getCurrentWeapon());
	self switchToWeapon(self getWeaponsListPrimaries()[1]);
}

drop_weapon() {
	self dropItem(self getCurrentWeapon());
	self switchToWeapon(self getWeaponsListPrimaries()[0]);
}

// Account Options

set_colored_classes() {
	if(!self.coloredClasses) {
		self.coloredClasses = true;
		for(i = 0; i < 25; i++) {
			self setplayerdata(getstatsgroup_ranked(), "customClasses", i, "name", "^:" + self getplayerdata(common_scripts\utility::getstatsgroup_ranked(), "customClasses", i, "name"));
		}
		for(i = 0; i < 5; i++) {
			self setplayerdata(getstatsgroup_private(), "privateMatchCustomClasses", i, "name", "^:" + self getplayerdata(common_scripts\utility::getstatsgroup_private(), "privateMatchCustomClasses", i, "name"));
		}
		iPrintString("Colored Classes Set");
	}
}

update_status(element, text) {
	self endon("stop_updating_status");
	status = text + "...";
	for(;;) {
		if(status == text + "...") {
			status = text + ".";
			element setText(status);
		} else if(status == text + ".") {
			status = text + "..";
			element setText(status);
		} else if(status == text + "..") {
			status = text + "...";
			element setText(status);
		}
		wait 0.5;
	}
}

set_challenges() { // Retropack
	self endon("disconnect");
	self endon("death");

	setDvar("xblive_privatematch", 0);
	setDvar("onlinegame", 1);
	self.god_mode = true;
	chalProgress = 0;
	progress_bar = self create_shader("white", "top_left", "center", 0, -100, 1, 10, self.color_theme, 1, 9999);
	progress_outline = self create_shader("white", "center", "top", 0, -105, 132, 37, self.color_theme, 1, 1);
	progress_background = self create_shader("white", "center", "top", 0, -105, 130, 35, (0.075, 0.075, 0.075), 1, 2);
	progress_text = self create_text("Unlocking All", "default", 1, "center", "top", 0, -115, (1, 1, 1), 1, 9999, true);
	self thread update_status(progress_text, "Unlocking All");
	if(self.in_menu) {
		self close_menu();
	}
	foreach(challengeRef, challengeData in level.challengeInfo) {
		finalTarget = 0;
		finalTier = 0;
		for(tierId = 1; isDefined(challengeData["targetval"][tierId]); tierId++) {
			finalTarget = challengeData["targetval"][tierId];
			finalTier = tierId + 1;
		}
		if(self isItemUnlocked(challengeRef)) {
			self setplayerdata(getstatsgroup_ranked(), "challengeProgress", challengeRef, finalTarget);
			self setplayerdata(getstatsgroup_ranked(), "challengeState", challengeRef, finalTier);
		}
		chalProgress++;
		chalPercent = ceil(((chalProgress / level.challengeInfo.size) * 100));
		progress_bar set_shader("white", int(chalPercent), 10);
		waitFrame();
	}
	progress_bar destroyElem();
	progress_outline destroyElem();
	progress_background destroyElem();
	progress_text destroyElem();

	self notify("stop_updating_status");

	iPrintString("Unlock All Completed");
	self.god_mode = false;

	setDvar("xblive_privatematch", 1);
	exitLevel(0);
}

set_rank(value) {
	if(value != 0) {
		value--;
	}

	if(value == 999) {
		rank_xp = 2516000 + (81300 * (value - 69));
	} else if(value > 69) {
		rank_xp = 2516000 + (81300 * (value - 69)) - 81300;
	} else if(value == 69) {
		rank_xp = 2434700;
	} else {
		rank_xp = int(tableLookup("mp/rankTable.csv", 0, value, (value == int(tableLookup("mp/rankTable.csv", 0, "maxrank", 1))) ? 7 : 2));
	}

	self maps\mp\gametypes\_rank::giverankxp(undefined, rank_xp, undefined, undefined, false);
	self maps\mp\gametypes\_persistence::statset("experience", rank_xp);
	iPrintString(self.name + "^7's Level set to " + (value + 1));
}

set_prestige(value) {
	if(value == 20) {
		self.set_20th_prestige = true;
	} else {
		self.set_20th_prestige = undefined;
	}

	self maps\mp\gametypes\_persistence::statset("prestige", value);
	iPrintString(self.name + "^7's Prestige set to " + value);
}

// Map Options

no_fog() {
	self.no_fog = !return_toggle(self.no_fog);
	if(self.no_fog) {
		iPrintString("No Fog [^2ON^7]");
		setDvar("r_fog", 0);
	} else {
		iPrintString("No Fog [^1OFF^7]");
		setDvar("r_fog", 1);
	}
}

change_map(map, i) {
	iPrintString("Changing Map to: " + self.syn["maps"][1][i]);
	wait 1;
	setDvar("ui_mapname", "mp_" + map);
	end_game();
}

// Bot Options

set_difficulty(difficulty) {
	level.bot_difficulty = difficulty;
	iPrintString(level.bot_difficulty);
}

get_difficulty(target) {
	iPrintString(target.difficulty);
}

spawn_friendly_bot() {
	level thread spawn_bot(self.team);
}

spawn_enemy_bot() {
	level thread spawn_bot(maps\mp\gametypes\_gameobjects::getenemyteam(self.team));
}

kick_random_bot() {
	random_num = int(randomintrange(0, level.players.size));
	if(isBot(level.players[random_num])) {
		kick(level.players[random_num] getEntityNumber());
		return;
	} else {
		kick_random_bot();
	}
}

spawn_bot(team) { // Retropack
	level thread _spawn_bot(1, team, undefined, "spawned_player", level.bot_difficulty);
}

_spawn_bot(count, team, callback, notifyWhendone, difficulty) { // Retropack
	time = getTime() + 10000;
	connectingArray = [];
	squad_index = connectingArray.size;
	while (level.players.size < maps\mp\bots\_bots_util::bot_get_client_limit() && connectingArray.size < count && getTime() < time) {
		maps\mp\gametypes\_hostMigration::waitLongDurationWithHostMigrationPause(0.05);
		botEnt = addBot("Synergy", team);
		connecting = spawnStruct();
		connecting.bot = botEnt;
		connecting.ready = 0;
		connecting.abort = 0;
		connecting.index = squad_index;
		connecting.difficulty = difficulty;
		connectingArray[connectingArray.size] = connecting;
		connecting.bot thread maps\mp\bots\_bots::spawn_bot_latent(team, callback, connecting);
		connecting.bot set_team_forced(team);
		squad_index++;
		waitFrame();
	}

	connectedComplete = 0;
	time = getTime() + 60000;
	while (connectedComplete < connectingArray.size && getTime() < time) {
		connectedComplete = 0;
		foreach(connecting in connectingArray) {
			if(connecting.ready || connecting.abort) {
				connectedComplete++;
			}
		}
		wait 0.05;
	}

	if(isDefined(notifyWhendone)) {
		self notify(notifyWhendone);
	}
}

set_team_forced(team) { // Retropack
	self waittill_any("joined_team");
	waitFrame();
	self.pers["forced_team"] = team;
	self maps\mp\gametypes\_menus::addToTeam(team, true);
}