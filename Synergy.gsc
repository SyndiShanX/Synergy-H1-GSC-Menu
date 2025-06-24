#include maps\mp\_utility;

init() {
	executeCommand("sv_cheats 1");

	level initial_precache();
	level thread player_connect();
	level thread create_rainbow_color();

	level thread session_expired();
}

initial_precache() {
	precacheshader("ui_scrollbar_arrow_right");
	precacheshader("ui_scrollbar_arrow_left");
}

initial_variable() {
	self.menu = [];
	self.cursor = [];
	self.slider = [];
	self.previous = [];

	self.font = "default";
	self.font_scale = 0.7;
	self.option_limit = 9;
	self.option_spacing = 16;
	self.x_offset = 175;
	self.y_offset = 160;
	self.width = -20;
	self.interaction_enabled = true;
	self.description_enabled = true;
	self.randomizing_enabled = true;
	self.scrolling_buffer = 3;
	
	self set_menu();
	self set_title();
	
	self.menu_color_red = 255;
	self.menu_color_green = 255;
	self.menu_color_blue = 255;
	self.color_theme = "rainbow";
	
	self.syn["visions"][0] = ["None", "AC-130", "AC-130 inverted", "Black & White", "Endgame", "Night", "Night Vision", "MP Intro", "MP Nuke Aftermath", "Sepia"];
	self.syn["visions"][1] = ["", "ac130", "ac130_inverted", "missilecam", "end_game", "default_night", "default_night_mp", "mpintro", "mpnuke_aftermath", "sepia"];
	
	self.syn["weapons"]["category"][0] = ["assault_rifles", "sub_machine_guns", "sniper_rifles", "shotguns", "light_machine_guns", "pistols", "melee", "equipment"];
	self.syn["weapons"]["category"][1] = ["Assault Rifles", "Sub Machine Guns", "Sniper Rifles", "Shotguns", "Light Machine Guns", "Pistols", "Melee Weapons", "Equipment"];
	
	// Weapon IDs Plus Default Attachments
	self.syn["weapons"]["assault_rifles"][0] =     ["h1_m16_mp_a", "h1_ak47_mp_a", "h1_m4_mp_a", "h1_g3_mp_a", "h1_g36c_mp_a", "h1_m14_mp_a", "h1_mp44_mp_a", "h1_xmlar_mp_a", "h1_aprast_mp_a", "h1_augast_mp_a"];
	self.syn["weapons"]["sub_machine_guns"][0] =   ["h1_mp5_mp_a", "h1_skorpion_mp_a", "h1_uzi_mp_a", "h1_ak74u_mp_a", "h1_p90_mp_a", "h1_febsmg_mp_a", "h1_aprsmg_mp_a", "h1_augsmg_mp_a"];
	self.syn["weapons"]["sniper_rifles"][0] =      ["h1_m40a3_mp_a", "h1_dragunov_mp_a", "h1_m21_mp_a", "h1_remington700_mp_a", "h1_barrett_mp_a", "h1_febsnp_mp_a", "h1_junsnp_mp_a"];
	self.syn["weapons"]["shotguns"][0] =           ["h1_winchester1200_mp_a", "h1_m1014_mp_a", "h1_kam12_mp_a", "h1_junsho_mp_a"];
	self.syn["weapons"]["light_machine_guns"][0] = ["h1_saw_mp_a", "h1_rpd_mp_a", "h1_m60e4_mp_a", "h1_feblmg_mp_a", "h1_junlmg_mp_a"];
	self.syn["weapons"]["pistols"][0] =            ["h1_beretta_mp_a", "h1_usp_mp_a", "h1_colt45_mp_a", "h1_deserteagle_mp_a", "h1_janpst_mp_a", "h1_aprpst_mp_a", "h1_augpst_mp_a"];
	self.syn["weapons"]["melee"][0] =              ["h1_meleejun2_mp_a", "h1_meleeapr2_mp_a", "h1_meleefeb4_mp_a", "h1_meleejun4_mp_a", "h1_meleefeb2_mp_a", "h1_meleesickle_mp_a", "h1_meleebottle_mp_a", "h1_meleeaug3_mp_a", "h1_meleejun6_mp_a", "h1_meleeapr4_mp_a", "h1_meleeapr3_mp_a", "h1_meleejun1_mp_a", "h1_meleejun3_mp_a", "h1_meleeaug1_mp_a", "h1_meleejun5_mp_a", "h1_meleeaug2_mp_a", "h1_meleeicepick_mp_a", "h1_meleepaddle_mp_a", "h1_meleeblade_mp_a", "h1_meleeshovel_mp_a", "h1_meleegladius_mp_a", "h1_meleebayonet_mp_a", "h1_meleeaug4_mp_a", "h1_meleefeb1_mp_a", "h1_meleefeb3_mp_a", "h1_meleehatchet_mp_a", "h1_meleeapr1_mp_a", "h1_meleefeb5_mp_a"];
	// Weapon Names
	self.syn["weapons"]["assault_rifles"][1] =     ["M16A4", "AK-47", "M4 Carbine", "G3", "G36C", "M14", "MP44", "XM-LAR", "BOS14", "Lynx CQ300"];
	self.syn["weapons"]["sub_machine_guns"][1] =   ["MP5", "Skorpion", "Mini-Uzi", "AK-74u", "P90", "Mac-10", "Fang 45", "PK-PSD9"];
	self.syn["weapons"]["sniper_rifles"][1] =      ["M40A3", "M21", "Dragunov", "R700", "Barrett .50Cal", "D-25S", "S-Tac Aggressor"];
	self.syn["weapons"]["shotguns"][1] =           ["W1200", "M1014", "Kamchataka-12", "Rangers"];
	self.syn["weapons"]["light_machine_guns"][1] = ["M249 SAW", "RPD", "M60E4", "PKM", "Bered MK8"];
	self.syn["weapons"]["pistols"][1] =            ["M9", "USP .45", "M1911 .45", "Desert Eagle", ".44 Magnum", "Prokolot", "BR9"];
	self.syn["weapons"]["melee"][1] =              ["Cleaver", "Machete", "Thug", "Tidal", "Shamrock Blade", "Sickle", "Brawler's Brew", "Point Knife", "Sarsparilla", "Sawtooth", "Diabolical", "Bludgeon", "Nauticus", "Danger Close", "Tribal", "Barber", "Cliffhanger", "OMSK Hammer", "Scorpion", "Gravedigger", "Gladiator", "CQB Bayonet", "Enforce", "Mechanic", "Samurai", "Hatchetman", "Caveman", "Leprechaun"];
	// Equipment
	self.syn["weapons"]["equipment"][0] = ["h1_c4_mp", "h1_rpg_mp", "h1_fraggrenade_mp", "h1_flashgrenade_mp", "h1_concussiongrenade_mp", "h1_smokegrenade_mp", "h1_claymore_mp"];
	self.syn["weapons"]["equipment"][1] = ["C4", "RPG-7", "Frag Grenade", "Flash Grenade", "Concussion Grenade", "Smoke Grenade", "Claymore"];
	//Weapon Attachments
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
	self.syn["perks"][2] = ["specialty_scavenger", "specialty_coldblooded", "specialty_blindeye", "specialty_hardline", "specialty_endgame", "specialty_silentkill", "specialty_stun_resistance", "specialty_lightweight", "specialty_moreminimap", "specialty_class_lowprofile", "specialty_hard_shell", "specialty_detectexplosive", "specialty_explosiveammoresupply", "specialty_bulletresupply", "specialty_delaymine", "specialty_blastshield2", "specialty_omaquickchange", "specialty_radararrow", "specialty_s1_temp", "specialty_blastshield", "specialty_akimbo", "specialty_falldamage", "specialty_shield", "specialty_feigndeath", "specialty_shellshock", "specialty_localjammer", "specialty_thermal", "specialty_blackbox", "specialty_steelnerves", "specialty_flashgrenade", "specialty_smokegrenade", "specialty_concussiongrenade", "specialty_saboteur", "specialty_rearview", "specialty_primarydeath", "specialty_secondarybling", "specialty_hardjack", "specialty_extraspecialduration", "specialty_rollover", "specialty_steadyaimpro", "specialty_double_load", "specialty_regenspeed", "specialty_autospot", "specialty_overkillpro", "specialty_anytwo", "specialty_paint", "specialty_paint_pro", "specialty_crouchmovement", "specialty_personaluav", "specialty_unwrapper", "specialty_class_blindeye", "specialty_class_coldblooded", "specialty_class_hardwired", "specialty_class_scavenger", "specialty_class_hoarder", "specialty_class_gungho", "specialty_class_steadyhands", "specialty_class_hardline", "specialty_class_peripherals", "specialty_class_quickdraw", "specialty_class_toughness", "specialty_class_lightweight", "specialty_class_engineer", "specialty_class_dangerclose", "specialty_horde_weaponsfree", "specialty_horde_dualprimary", "specialty_marksman", "specialty_sharp_focus", "specialty_moredamage", "specialty_copycat", "specialty_finalstand", "specialty_juiced", "specialty_light_armor", "specialty_stopping_power", "specialty_uav", "bouncingbetty_mp", "portable_radar_mp", "scrambler_mp", "trophy_mp"];
	self.syn["perks"][3] = ["specialty_scavenger", "specialty_coldblooded", "specialty_blindeye", "specialty_hardline", "specialty_endgame", "specialty_silentkill", "specialty_stun_resistance", "specialty_lightweight", "specialty_moreminimap", "specialty_class_lowprofile", "specialty_hard_shell", "specialty_detectexplosive", "specialty_explosiveammoresupply", "specialty_bulletresupply", "specialty_delaymine", "specialty_blastshield2", "specialty_omaquickchange", "specialty_radararrow", "specialty_s1_temp", "specialty_blastshield", "specialty_akimbo", "specialty_falldamage", "specialty_shield", "specialty_feigndeath", "specialty_shellshock", "specialty_localjammer", "specialty_thermal", "specialty_blackbox", "specialty_steelnerves", "specialty_flashgrenade", "specialty_smokegrenade", "specialty_concussiongrenade", "specialty_saboteur", "specialty_rearview", "specialty_primarydeath", "specialty_secondarybling", "specialty_hardjack", "specialty_extraspecialduration", "specialty_rollover", "specialty_steadyaimpro", "specialty_double_load", "specialty_regenspeed", "specialty_autospot", "specialty_overkillpro", "specialty_anytwo", "specialty_paint", "specialty_paint_pro", "specialty_crouchmovement", "specialty_personaluav", "specialty_unwrapper", "specialty_class_blindeye", "specialty_class_coldblooded", "specialty_class_hardwired", "specialty_class_scavenger", "specialty_class_hoarder", "specialty_class_gungho", "specialty_class_steadyhands", "specialty_class_hardline", "specialty_class_peripherals", "specialty_class_quickdraw", "specialty_class_toughness", "specialty_class_lightweight", "specialty_class_engineer", "specialty_class_dangerclose", "specialty_horde_weaponsfree", "specialty_horde_dualprimary", "specialty_marksman", "specialty_sharp_focus", "specialty_moredamage", "specialty_copycat", "specialty_finalstand", "specialty_juiced", "specialty_light_armor", "specialty_stopping_power", "specialty_uav", "bouncingbetty_mp", "portable_radar_mp", "scrambler_mp", "trophy_mp"];
	// Killstreaks
	self.syn["killstreaks"][0] = ["radar_mp", "airstrike_mp", "helicopter_mp"];
	self.syn["killstreaks"][1] = ["UAV Recon", "Airstrike", "Attack Helicopter"];
}

initial_observer() {
	level endon("game_ended");
	self endon("disconnect");
	while(self has_access()) {
		if(!self in_menu()) {
			if(self adsButtonPressed() && self meleeButtonPressed()) {
				if(self.interaction_enabled) {
					self playSoundToPlayer("h1_ui_menu_warning_box_appear", self);
				}

				close_controls_menu();
				self open_menu();
				
				while(self adsButtonPressed() && self meleeButtonPressed()) {
					wait 0.2;
				}
			}
		} else {
			menu = self get_menu();
			cursor = self get_cursor();
			if(self meleeButtonPressed()) {
				if(self.interaction_enabled) {
					self playSoundToPlayer("h1_ui_pause_menu_resume", self);
				}

				if(isDefined(self.previous[(self.previous.size - 1)])) {
					self new_menu();
				} else {
					self close_menu();
				}

				while(self meleeButtonPressed()) {
					wait 0.2;
				}
			} else if(self adsButtonPressed() && !self attackButtonPressed() || self attackButtonPressed() && !self adsButtonPressed()) {
				if(isDefined(self.structure) && self.structure.size >= 2) {
					if(self.interaction_enabled) {
						self playSoundToPlayer("h1_ui_menu_scroll", self);
					}

					scrolling = self attackButtonPressed() ? 1 : -1;

					self set_cursor((cursor + scrolling));
					self update_scrolling(scrolling);
				}

				wait (0.05 * self.scrolling_buffer);
			} else if(self fragButtonPressed() && !self secondaryOffhandButtonPressed() || !self fragButtonPressed() && self secondaryOffhandButtonPressed()) {
				if(isDefined(self.structure[cursor].array) || isDefined(self.structure[cursor].increment)) {
					if(self.interaction_enabled) {
						self playSoundToPlayer("h1_ui_menu_scroll", self);
					}

					scrolling = self secondaryOffhandButtonPressed() ? 1 : -1;

					self update_slider(scrolling);
					self update_progression();
				}

				wait (0.05 * self.scrolling_buffer);
			} else if(self useButtonPressed()) {
				if(isDefined(self.structure[cursor]) && isDefined(self.structure[cursor].function)) {
					if(self.interaction_enabled) {
						self playSoundToPlayer("mp_ui_decline", self);
					}

					if(isDefined(self.structure[cursor].array) || isDefined(self.structure[cursor].increment)) {
						self thread execute_function(self.structure[cursor].function, isDefined(self.structure[cursor].array) ? self.structure[cursor].array[self.slider[(menu + "_" + cursor)]] : self.slider[(menu + "_" + cursor)], self.structure[cursor].parameter_1, self.structure[cursor].parameter_2);
					} else {
						self thread execute_function(self.structure[cursor].function, self.structure[cursor].parameter_1, self.structure[cursor].parameter_2);
					}

					if(isDefined(self.structure[cursor]) && isDefined(self.structure[cursor].toggle)) {
						self update_display();
					}
				}

				while(self useButtonPressed()) {
					wait 0.1;
				}
			}
		}
		wait 0.05;
	}
}

event_system() {
	level endon("game_ended");
	self endon("disconnect");
	for (;;) {
		event_name = self common_scripts\utility::waittill_any_return("spawned_player", "player_downed", "death", "joined_spectators");
		switch (event_name) {
			case "spawned_player":
				self.spawn_origin = self.origin;
				self.spawn_angles = self.angles;
				if(!isDefined(self.finalized) && self has_access()) {
					self.finalized = true;
					
					if(self isHost()) {
						self freezeControls(false);
					}
		
					self initial_variable();
					self thread initial_observer();
					
					self.controls["title"] = self create_text("Controls", self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 99), (self.y_offset + 4), self.color_theme, 1, 10);
					self.controls["separator"][0] = self create_shader("white", "TOP_LEFT", "TOPCENTER", 181, (self.y_offset + 7.5), 37, 1, self.color_theme, 1, 10);
					self.controls["separator"][1] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", 399, (self.y_offset + 7.5), 37, 1, self.color_theme, 1, 10);
					self.controls["border"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", self.x_offset, (self.y_offset - 1), (self.width + 250), 97, self.color_theme, 1, 1);
					self.controls["background"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 1), self.y_offset, (self.width + 248), 95, (0.075, 0.075, 0.075), 1, 2);
					self.controls["foreground"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 1), (self.y_offset + 16), (self.width + 248), 79, (0.1, 0.1, 0.1), 1, 3);
					
					self.controls["text"][0] = self create_text("Open: ^3[{+speed_throw}] ^7and ^3[{+melee}]", self.font, 0.9, "TOP_LEFT", "TOPCENTER", (self.x_offset + 4), (self.y_offset + 20), (0.75, 0.75, 0.75), 1, 10);
					self.controls["text"][1] = self create_text("Scroll: ^3[{+speed_throw}] ^7and ^3[{+attack}]", self.font, 0.9, "TOP_LEFT", "TOPCENTER", (self.x_offset + 4), (self.y_offset + 40), (0.75, 0.75, 0.75), 1, 10);
					self.controls["text"][2] = self create_text("Select: ^3[{+activate}] ^7Back: ^3[{+melee}]", self.font, 0.9, "TOP_LEFT", "TOPCENTER", (self.x_offset + 4), (self.y_offset + 60), (0.75, 0.75, 0.75), 1, 10);
					self.controls["text"][3] = self create_text("Sliders: ^3[{+smoke}] ^7and ^3[{+frag}]", self.font, 0.9, "TOP_LEFT", "TOPCENTER", (self.x_offset + 4), (self.y_offset + 80), (0.75, 0.75, 0.75), 1, 10);
					
					wait 8;
					
					close_controls_menu();
				}
				break;
			default:
				if(!self has_access()) {
					continue;
				}
		
				if(self in_menu()) {
					self close_menu();
				}
				break;
		}
	}
}

session_expired() {
	level waittill("game_ended");
	level endon("game_ended");
	foreach(index, player in level.players) {
		if(!player has_access()) {
			continue;
		}

		if(player in_menu()) {
			player close_menu();
		}
	}
}

player_connect() {
	for(;;) {
		level waitTill("connected", player);
		player.access = player isHost() ? "Host" : "None";
		
		if(isBot(player)) {
			return;
		}
		
		player thread event_system();
	}
}

player_disconnect() {
	[[level.player_disconnect]]();
}

player_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime) {
	if(isDefined(self.god_mode) && self.god_mode) {
		return;
	}
	[[level.player_damage]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime);
}

player_downed(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration) {
	self notify("player_downed");
	[[level.player_downed]](einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration);
}

// Utilities

in_array(array, item) {
	if(!isDefined(array) || !isArray(array)) {
		return;
	}

	for (a = 0; a < array.size; a++) {
		if(array[a] == item) {
			return true;
		}
	}

	return false;
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

create_rainbow_color() {
	x = 0; y = 0;
	r = 0; g = 0; b = 0;
	level.rainbow_color = (0, 0, 0);
	
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
		wait .05;
	}
}

start_rainbow() {
	while(isDefined(self)) {
		self fadeOverTime(.05);
		self.color = level.rainbow_color;
		wait .05;
	}
}

create_text(text, font, font_scale, align_x, align_y, x_offset, y_offset, color, alpha, z_index, hide_when_in_menu) {
	textElement = self maps\mp\gametypes\_hud_util::createFontString(font, font_scale);
	textElement maps\mp\gametypes\_hud_util::setPoint(align_x, align_y, x_offset, y_offset);

	textElement.alpha = alpha;
	textElement.sort = z_index;
	textElement.anchor = self;
	textElement.archived = self auto_archive();
	
	if(isDefined(hide_when_in_menu)) {
		textElement.hideWhenInMenu = hide_when_in_menu;
	} else {
		textElement.hideWhenInMenu = true;
	}
	
	if(color != "rainbow") {
		textElement.color = color;
	} else {
		textElement.color = level.rainbow_color;
		textElement thread start_rainbow();
	}
	
	if(isNumber(text)) {
		textElement setValue(text);
	} else {
		textElement set_text(text);
	}

	self.element_result++;
	return textElement;
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
	
	if(color != "rainbow") {
		shaderElement.color = color;
	} else {
		shaderElement.color = level.rainbow_color;
		shaderElement thread start_rainbow();
	}

	shaderElement maps\mp\gametypes\_hud_util::setParent(level.uiParent);
	shaderElement maps\mp\gametypes\_hud_util::setPoint(align_x, align_y, x_offset, y_offset);
	
	shaderElement set_shader(shader, width, height);

	self.element_result++;
	return shaderElement;
}

set_text(text) {
	if(!isDefined(self) || !isDefined(text)) {
		return;
	}

	self.text = text;
	self setText(text);
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

clean_text(text) {
	if(!isDefined(text) || text == "") {
		return;
	}

	if(text[0] == toUpper(text[0])) {
		if(isSubStr(text, " ") && !isSubStr(text, "_")) {
			return text;
		}
	}

	text = strTok(toLower(text), "_");
	new_string = "";
	for (a = 0; a < text.size; a++) {
		illegal = ["player", "weapon", "wpn", "viewmodel", "camo"];
		replacement = " ";
		if(in_array(illegal, text[a])) {
			for (b = 0; b < text[a].size; b++) {
				if(b != 0) {
					new_string += text[a][b];
				} else {
					new_string += toUpper(text[a][b]);
				}
			}

			if(a != (text.size - 1)) {
				new_string += replacement;
			}
		}
	}

	return new_string;
}

clean_name(name) {
	if(!isDefined(name) || name == "") {
		return;
	}

	illegal = ["^A", "^B", "^F", "^H", "^I", "^0", "^1", "^2", "^3", "^4", "^5", "^6", "^7", "^8", "^9", "^:"];
	new_string = "";
	for (a = 0; a < name.size; a++) {
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

destroy_element() {
	if(!isDefined(self)) {
		return;
	}

	self destroy();
	if(isDefined(self.anchor)) {
		self.anchor.element_result--;
	}
}

destroy_all(array) {
	if(!isDefined(array) || !isArray(array)) {
		return;
	}

	keys = getarraykeys(array);
	for (a = 0; a < keys.size; a++) {
		if(isArray(array[keys[a]])) {
			foreach(index, value in array[keys[a]]) {
				if(isDefined(value)) {
					value destroy_element();
				}
			}
		} else {
			if(isDefined(array[keys[a]])) {
				array[keys[a]] destroy_element();
			}
		}
	}
}

destroy_option() {
	element = ["text", "submenu", "toggle", "slider"];
	for (a = 0; a < element.size; a++) {
		if(isDefined(self.menu[element[a]]) && self.menu[element[a]].size) {
			destroy_all(self.menu[element[a]]);
		}

		self.menu[element[a]] = [];
	}
}

get_name() {
	name = self.name;
	if(name[0] != "[") {
		return name;
	}

	for (a = (name.size - 1); a >= 0; a--) {
		if(name[a] == "]") {
			break;
		}
	}

	return getSubStr(name, (a + 1));
}

has_access() {
	return isDefined(self.access) && self.access != "None";
}

calculate_distance(origin, destination, velocity) {
	return (distance(origin, destination) / velocity);
}

// Structure

set_menu(menu) {
	self.current_menu = isDefined(menu) ? menu : "Synergy";
}

get_menu() {
	if(!isDefined(self.current_menu)) {
		self set_menu();
	}

	return self.current_menu;
}

set_title(title) {
	self.current_title = isDefined(title) ? title : self get_menu();
}

get_title() {
	if(!isDefined(self.current_title)) {
		self set_title();
	}

	return self.current_title;
}

set_cursor(index) {
	self.cursor[self get_menu()] = isDefined(index) && isNumber(index) ? index : 0;
}

get_cursor() {
	if(!isDefined(self.cursor[self get_menu()])) {
		self set_cursor();
	}

	return self.cursor[self get_menu()];
}

get_description() {
	return self.structure[self get_cursor()].description;
}

set_state(state) {
	self.in_menu = isDefined(state) && state < 2 ? state : false;
}

in_menu() {
	return isDefined(self.in_menu) && self.in_menu;
}

set_locked(state) {
	self.is_locked = isDefined(state) && state < 2 ? state : false;
}

is_locked() {
	return isDefined(self.is_locked) && self.is_locked;
}

empty_option() {
	option = ["Nothing To See Here!", "Quiet Here, Isn't It?", "Oops, Nothing Here Yet!", "Bit Empty, Don't You Think?"];
	return option[randomInt(option.size)];
}

empty_function() {}

execute_function(function, parameter_1, parameter_2, parameter_3) {
	self endon("disconnect");
	if(!isDefined(function)) {
		return;
	}

	if(isDefined(parameter_3)) {
		return self thread[[function]](parameter_1, parameter_2, parameter_3);
	}

	if(isDefined(parameter_2)) {
		return self thread[[function]](parameter_1, parameter_2);
	}

	if(isDefined(parameter_1)) {
		return self thread[[function]](parameter_1);
	}

	self thread[[function]]();
}

add_menu(title, menu_size, extra) {
	self.structure = [];
	self set_title(title);
	
	if(!isDefined(self get_cursor())) {
		self set_cursor();
	}
	
	if(isDefined(extra)) {
		self.menu["title"].x = (self.x_offset + 106) - menu_size - extra;
	} else {
		if(menu_size <= 7) {
			self.menu["title"].x = (self.x_offset + 106) - menu_size;
		} else {
			self.menu["title"].x = (self.x_offset + 106) - (menu_size * 1.4);
		}
	}
}

add_option(text, description, function, parameter_1, parameter_2) {
	option = spawnStruct();
	option.text = text;
	option.description = description;
	option.function = isDefined(function) ? function : ::empty_function;
	option.parameter_1 = parameter_1;
	option.parameter_2 = parameter_2;

	self.structure[self.structure.size] = option;
}

add_toggle(text, description, function, variable, parameter_1, parameter_2) {
	option = spawnStruct();
	option.text = text;
	option.description = description;
	option.function = isDefined(function) ? function : ::empty_function;
	option.toggle = isDefined(variable) && variable;
	option.parameter_1 = parameter_1;
	option.parameter_2 = parameter_2;

	self.structure[self.structure.size] = option;
}

add_array(text, description, function, array, parameter_1, parameter_2) {
	option = spawnStruct();
	option.text = text;
	option.description = description;
	option.function = isDefined(function) ? function : ::empty_function;
	option.array = isDefined(array) && isArray(array) ? array : [];
	option.parameter_1 = parameter_1;
	option.parameter_2 = parameter_2;

	self.structure[self.structure.size] = option;
}

add_increment(text, description, function, start, minimum, maximum, increment, parameter_1, parameter_2) {
	option = spawnStruct();
	option.text = text;
	option.description = description;
	option.function = isDefined(function) ? function : ::empty_function;
	option.start = isDefined(start) && isNumber(start) ? start : 0;
	option.minimum = isDefined(minimum) && isNumber(minimum) ? minimum : 0;
	option.maximum = isDefined(maximum) && isNumber(maximum) ? maximum : 10;
	option.increment = isDefined(increment) && isNumber(increment) ? increment : 1;
	option.parameter_1 = parameter_1;
	option.parameter_2 = parameter_2;

	self.structure[self.structure.size] = option;
}

new_menu(menu) {
	if(!isDefined(menu)) {
		menu = self.previous[(self.previous.size - 1)];
		self.previous[(self.previous.size - 1)] = undefined;
	} else {
		if(self get_menu() == "All Players") {
			player = level.players[self get_cursor()];
			self.selected_player = player;
		}

		self.previous[self.previous.size] = self get_menu();;
	}

	self set_menu(menu);
	self update_display();
}

// Custom Structure

open_menu() {
	self.menu["border"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", self.x_offset, (self.y_offset - 1), (self.width + 250), 34, self.color_theme, 1, 1);
	self.menu["background"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 1), self.y_offset, (self.width + 248), 32, (0.075, 0.075, 0.075), 1, 2);
	self.menu["foreground"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 1), (self.y_offset + 16), (self.width + 248), 16, (0.1, 0.1, 0.1), 1, 3);
	self.menu["cursor"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 1), (self.y_offset + 16), (self.width + 243), 16, (0.15, 0.15, 0.15), 1, 4);
	self.menu["scrollbar"] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", (self.x_offset + (self.menu["background"].width + 1)), (self.y_offset + 16), 4, 16, (0.25, 0.25, 0.25), 1, 4);

	self set_state(true);
	self update_display();
}

close_menu() {
	self notify("menu_ended");
	self set_state(false);
	self destroy_option();
	self destroy_all(self.menu);
}

display_title(title) {
	title = isDefined(title) ? title : self get_title();
	if(!isDefined(self.menu["title"])) {
		self.menu["title"] = self create_text(title, self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 99), (self.y_offset + 4), self.color_theme, 1, 10);
		self.menu["separator"][0] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 6), (self.y_offset + 7.5), int((self.menu["cursor"].width / 6)), 1, self.color_theme, 1, 10);
		self.menu["separator"][1] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", (self.x_offset + (self.menu["cursor"].width - 2) + 3), (self.y_offset + 7.5), int((self.menu["cursor"].width / 6)), 1, self.color_theme, 1, 10);
	} else {
		self.menu["title"] set_text(title);
	}
}

display_description(description) {
	description = isDefined(description) ? description : self get_description();
	if(isDefined(self.menu["description"]) && !self.description_enabled || isDefined(self.menu["description"]) && !isDefined(description)) {
		self.menu["description"] destroy_element();
	}

	if(isDefined(description) && self.description_enabled) {
		if(!isDefined(self.menu["description"])) {
			self.menu["description"] = self create_text(description, self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", (self.x_offset + 4), (self.y_offset + 36), (0.75, 0.75, 0.75), 1, 10);
		} else {
			self.menu["description"] set_text(description);
		}
	}
}

display_option() {
	self destroy_option();
	self menu_option();
	if(!isDefined(self.structure) || !self.structure.size) {
		self add_option(empty_option());
	}

	self display_title();
	self display_description();
	if(isDefined(self.structure) && self.structure.size) {
		if(self get_cursor() >= self.structure.size) {
			self set_cursor((self.structure.size - 1));
		}

		if(!isDefined(self.menu["toggle"][0])) {
			self.menu["toggle"][0] = [];
		}

		if(!isDefined(self.menu["toggle"][1])) {
			self.menu["toggle"][1] = [];
		}

		menu = self get_menu();
		cursor = self get_cursor();
		maximum = min(self.structure.size, self.option_limit);
		for (a = 0; a < maximum; a++) {
			start = self get_cursor() >= int((self.option_limit / 2)) && self.structure.size > self.option_limit ? (((self get_cursor() + int((self.option_limit / 2))) >= (self.structure.size - 1)) ? (self.structure.size - self.option_limit) : (self get_cursor() - int((self.option_limit / 2)))) : 0;
			index = (a + start);
			if(isDefined(self.structure[index].function) && self.structure[index].function == ::new_menu) {
				self.menu["submenu"][index] = self create_shader("ui_scrollbar_arrow_right", "TOP_RIGHT", "TOPCENTER", (self.x_offset + (self.menu["cursor"].width - 1)), (self.y_offset + ((a * self.option_spacing) + 20.5)), 7, 7, (cursor == index) ? (0.75, 0.75, 0.75) : (0.5, 0.5, 0.5), 1, 10);
			}

			if(isDefined(self.structure[index].toggle)) { // Toggle Off
				self.menu["toggle"][0][index] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", (self.x_offset + 14), (self.y_offset + ((a * self.option_spacing) + 19)), 10, 10, (0.25, 0.25, 0.25), 1, 9);
				if(self.structure[index].toggle) { // Toggle On
					self.menu["toggle"][1][index] = self create_shader("white", "TOP_RIGHT", "TOPCENTER", (self.x_offset + 13), (self.y_offset + ((a * self.option_spacing) + 20)), 8, 8, (1, 1, 1), 1, 10);
				}
			}

			if(isDefined(self.structure[index].array) || isDefined(self.structure[index].increment)) {
				if(isDefined(self.structure[index].array)) { // Array Text
					self.menu["slider"][index] = self create_text(self.slider[(menu + "_" + index)], self.font, self.font_scale, "TOP_RIGHT", "TOPCENTER", (self.x_offset + (self.menu["cursor"].width - 2)), (self.y_offset + ((a * self.option_spacing) + 20)), (cursor == index) ? (0.75, 0.75, 0.75) : (0.5, 0.5, 0.5), 1, 10);
				} else if(cursor == index) { // Increment Text
					self.menu["slider"][index] = self create_text(self.slider[(menu + "_" + index)], self.font, self.font_scale, "TOP_RIGHT", "TOPCENTER", (self.x_offset + (self.menu["cursor"].width - 3)), (self.y_offset + ((a * self.option_spacing) + 20)), (0.75, 0.75, 0.75), 1, 10);
				}

				self update_slider(undefined, index);
			}

			self.menu["text"][index] = self create_text((isDefined(self.structure[index].array) || isDefined(self.structure[index].increment)) ? (self.structure[index].text + ":") : self.structure[index].text, self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", isDefined(self.structure[index].toggle) ? (self.x_offset + 16) : (!isDefined(self.structure[index].function) ? (self.x_offset + (self.menu["cursor"].width / 2)) : (self.x_offset + 4)), (self.y_offset + ((a * self.option_spacing) + 20)), !isDefined(self.structure[index].function) ? self.color_theme : ((cursor == index) ? (0.75, 0.75, 0.75) : (0.5, 0.5, 0.5)), 1, 10);
		}
	}
}

update_display() {
	self display_option();
	self update_scrollbar();
	self update_progression();
	self update_rescaling();
}

update_scrolling(scrolling) {
	if(isDefined(self.structure[self get_cursor()]) && !isDefined(self.structure[self get_cursor()].function)) {
		self set_cursor((self get_cursor() + scrolling));
		return self update_scrolling(scrolling);
	}

	if(self get_cursor() >= self.structure.size || self get_cursor() < 0) {
		self set_cursor(self get_cursor() >= self.structure.size ? 0 : (self.structure.size - 1));
	}

	self update_display();
}

update_slider(scrolling, cursor) {
	menu = self get_menu();
	cursor = isDefined(cursor) ? cursor : self get_cursor();
	scrolling = isDefined(scrolling) ? scrolling : 0;
	if(!isDefined(self.slider[(menu + "_" + cursor)])) {
		self.slider[(menu + "_" + cursor)] = isDefined(self.structure[cursor].array) ? 0 : self.structure[cursor].start;
	}

	if(isDefined(self.structure[cursor].array)) {
		if(scrolling == -1) {
			self.slider[(menu + "_" + cursor)]++;
		}

		if(scrolling == 1) {
			self.slider[(menu + "_" + cursor)]--;
		}

		if(self.slider[(menu + "_" + cursor)] > (self.structure[cursor].array.size - 1) || self.slider[(menu + "_" + cursor)] < 0) {
			self.slider[(menu + "_" + cursor)] = self.slider[(menu + "_" + cursor)] > (self.structure[cursor].array.size - 1) ? 0 : (self.structure[cursor].array.size - 1);
		}

		if(isDefined(self.menu["slider"][cursor])) {
			self.menu["slider"][cursor] set_text((self.structure[cursor].array[self.slider[(menu + "_" + cursor)]] + " [" + (self.slider[(menu + "_" + cursor)] + 1) + "/" + self.structure[cursor].array.size + "]"));
		}
	} else {
		if(scrolling == -1) {
			self.slider[(menu + "_" + cursor)] += self.structure[cursor].increment;
		}

		if(scrolling == 1) {
			self.slider[(menu + "_" + cursor)] -= self.structure[cursor].increment;
		}

		if(self.slider[(menu + "_" + cursor)] > self.structure[cursor].maximum || self.slider[(menu + "_" + cursor)] < self.structure[cursor].minimum) {
			self.slider[(menu + "_" + cursor)] = self.slider[(menu + "_" + cursor)] > self.structure[cursor].maximum ? self.structure[cursor].minimum : self.structure[cursor].maximum;
		}

		if(isDefined(self.menu["slider"][cursor])) {
			self.menu["slider"][cursor] setValue(self.slider[(menu + "_" + cursor)]);
		}
	}
}

update_progression() {
	if(isDefined(self.structure[self get_cursor()].increment) && self.slider[(self get_menu() + "_" + self get_cursor())] != 0) {
		value = abs((self.structure[self get_cursor()].minimum - self.structure[self get_cursor()].maximum)) / (self.menu["cursor"].width);
		width = ceil(((self.slider[(self get_menu() + "_" + self get_cursor())] - self.structure[self get_cursor()].minimum) / value));
		if(!isDefined(self.menu["progression"])) {
			self.menu["progression"] = self create_shader("white", "TOP_LEFT", "TOPCENTER", (self.x_offset + 1), self.menu["cursor"].y, int(width), 16, (0.3, 0.3, 0.3), 1, 5);
		} else {
			self.menu["progression"] set_shader(self.menu["progression"].shader, int(width), self.menu["progression"].height);
		}

		if(self.menu["progression"].y != self.menu["cursor"].y) {
			self.menu["progression"].y = self.menu["cursor"].y;
		}
	} else if(isDefined(self.menu["progression"])) {
		self.menu["progression"] destroy_element();
	}
}

update_scrollbar() {
	maximum = min(self.structure.size, self.option_limit);
	height = int((maximum * self.option_spacing));
	adjustment = self.structure.size > self.option_limit ? ((180 / self.structure.size) * maximum) : height;
	position = self.structure.size > self.option_limit ? ((self.structure.size - 1) / (height - adjustment)) : 0;
	if(isDefined(self.menu["cursor"])) {
		self.menu["cursor"].y = (self.menu["text"][self get_cursor()].y - 4);
	}

	if(isDefined(self.menu["scrollbar"])) {
		self.menu["scrollbar"].y = (self.y_offset + 16);
		if(self.structure.size > self.option_limit) {
			self.menu["scrollbar"].y += (self get_cursor() / position);
		}
	}

	self.menu["scrollbar"] set_shader(self.menu["scrollbar"].shader, self.menu["scrollbar"].width, int(adjustment));
}

update_rescaling() {
	maximum = min(self.structure.size, self.option_limit);
	height = int((maximum * self.option_spacing));
	if(isDefined(self.menu["description"])) {
		self.menu["description"].y = (self.y_offset + (height + 20));
	}

	self.menu["border"] set_shader(self.menu["border"].shader, self.menu["border"].width, isDefined(self get_description()) && self.description_enabled ? (height + 34) : (height + 18));
	self.menu["background"] set_shader(self.menu["background"].shader, self.menu["background"].width, isDefined(self get_description()) && self.description_enabled ? (height + 32) : (height + 16));
	self.menu["foreground"] set_shader(self.menu["foreground"].shader, self.menu["foreground"].width, height);
}

// Option Structure

menu_option() {
	menu = self get_menu();
	switch (menu) {
		case "Synergy":
			self add_menu(menu, menu.size);
			
			self add_option("Basic Options", undefined, ::new_menu, "Basic Options");
			self add_option("Fun Options", undefined, ::new_menu, "Fun Options");
			self add_option("Weapon Options", undefined, ::new_menu, "Weapon Options");
			self add_option("Give Killstreaks", undefined, ::new_menu, "Give Killstreaks");
			self add_option("Menu Options", undefined, ::new_menu, "Menu Options");
			
			break;
		case "Basic Options":
			self add_menu(menu, menu.size);
			
			self add_toggle("God Mode", "Makes you Invincible", ::god_mode, self.god_mode);
			self add_toggle("No Clip", "Fly through the Map", ::no_clip, self.no_clip);
			self add_toggle("Frag No Clip", "Fly through the Map using (^3[{+frag}]^7)", ::frag_no_clip, self.frag_no_clip);
			self add_toggle("UFO", "Fly Straight through the Map", ::ufo_mode, self.ufo_mode);
			self add_toggle("Infinite Ammo", "Gives you Infinite Ammo and Infinite Grenades", ::infinite_ammo, self.infinite_ammo);
			
			self add_option("Give Perks", undefined, ::new_menu, "Give Perks");
			self add_option("Take Perks", undefined, ::new_menu, "Take Perks");
			
			break;
		case "Fun Options":
			self add_menu(menu, menu.size);
			
			self add_toggle("Forge Mode", "Pick Up/Move some Objects", ::forge_mode, self.forge_mode);
			
			self add_toggle("Fullbright", "Removes all Shadows and Lighting", ::fullbright, self.fullbright);
			self add_toggle("Third Person", undefined, ::third_person, self.third_person);
			
			self add_toggle("Super Jump", undefined, ::super_jump, self.super_jump);
			
			self add_increment("Set Timescale", undefined, ::set_timescale, 1, 1, 10, 1);
			
			self add_option("Visions", undefined, ::new_menu, "Visions");
			
			break;
		case "Weapon Options":
			self add_menu(menu, menu.size);
			
			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");
			
			self add_option("Give Weapons", undefined, ::new_menu, "Give Weapons");
			
			if(category != "melee" && category != "equipment") {
				self add_option("Attachments", undefined, ::new_menu, "Attachments");
			}

			self add_option("Take Current Weapon", undefined, ::take_weapon);
			self add_option("Drop Current Weapon", undefined, ::drop_weapon);
			
			break;
		case "Give Killstreaks":
			self add_menu(menu, menu.size, 1);
			
			for(i = 0; i < self.syn["killstreaks"][0].size; i++) {
				self add_option(self.syn["killstreaks"][1][i], undefined, ::give_killstreak, self.syn["killstreaks"][0][i]);
			}
			
			break;
		case "Menu Options":
			self add_menu(menu, menu.size);
			
			self add_increment("Move Menu X", "Move the Menu around Horizontally", ::modify_menu_position, 0, -600, 20, 10, "x");
			self add_increment("Move Menu Y", "Move the Menu around Vertically", ::modify_menu_position, 0, -150, 30, 10, "y");
			
			self add_option("Rainbow Menu", "Set the Menu Outline Color to Cycling Rainbow", ::set_menu_rainbow);
			
			self add_increment("Red", "Set the Red Value for the Menu Outline Color", ::set_menu_color, 255, 1, 255, 1, "Red");
			self add_increment("Green", "Set the Green Value for the Menu Outline Color", ::set_menu_color, 255, 1, 255, 1, "Green");
			self add_increment("Blue", "Set the Blue Value for the Menu Outline Color", ::set_menu_color, 255, 1, 255, 1, "Blue");
			
			self add_toggle("Watermark", "Enable/Disable Watermark in the Top Left Corner", ::watermark, self.watermark);
			self add_toggle("Hide UI", undefined, ::hide_ui, self.hide_ui);
			self add_toggle("Hide Weapon", undefined, ::hide_weapon, self.hide_weapon);
			
			break;
		case "Visions":
			self add_menu(menu, menu.size);
			
			for(i = 0; i < self.syn["visions"][0].size; i++) {
				self add_option(self.syn["visions"][0][i], undefined, ::set_vision, self.syn["visions"][1][i]);
			}

			break;
		case "Give Perks":
			self add_menu(menu, menu.size);
			
			for(i = 0; i < self.syn["perks"][0].size; i++) {
				self add_option(self.syn["perks"][1][i], undefined, ::give_perk, self.syn["perks"][0][i], 0);
			}
			
			for(i = 0; i < self.syn["perks"][2].size; i++) {
				self add_option(self.syn["perks"][3][i], undefined, ::give_perk, self.syn["perks"][2][i], 0);
			}

			break;
		case "Take Perks":
			self add_menu(menu, menu.size);
			
			for(i = 0; i < self.syn["perks"][0].size; i++) {
				self add_option(self.syn["perks"][1][i], undefined, ::take_perk, self.syn["perks"][0][i]);
			}
			
			for(i = 0; i < self.syn["perks"][2].size; i++) {
				self add_option(self.syn["perks"][3][i], undefined, ::take_perk, self.syn["perks"][2][i]);
			}

			break;
		case "Give Weapons":
			self add_menu(menu, menu.size);
			
			for(i = 0; i < self.syn["weapons"]["category"][1].size; i++) {
				self add_option(self.syn["weapons"]["category"][1][i], undefined, ::new_menu, self.syn["weapons"]["category"][1][i]);
			}
			
			break;
		case "Attachments":
			self add_menu(menu, menu.size);
			
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
			self add_menu(menu, menu.size);
			
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
			self add_menu(menu, menu.size);
			
			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");
			
			self add_option("None", undefined, ::equip_kit, "base");
			
			for(i = 0; i < self.syn["weapons"][category]["kits"][0].size; i++) {
				self add_option(self.syn["weapons"][category]["kits"][1][i], undefined, ::equip_kit, self.syn["weapons"][category]["kits"][0][i]);
			}
			
			break;
		case "Equip Camo":
			self add_menu(menu, menu.size);
			
			self add_increment("Equip Camo", undefined, ::equip_camo, 1, 1, 368, 1);
			self add_toggle("Cycle Camos", "Cycle through all Available Camos", ::cycle_camos, self.cycle_camos);
			
			break;
		case "Assault Rifles":
			self add_menu(menu, menu.size);
			
			category = "assault_rifles";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Sub Machine Guns":
			self add_menu(menu, menu.size);
			
			category = "sub_machine_guns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Light Machine Guns":
			self add_menu(menu, menu.size);
			
			category = "light_machine_guns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Sniper Rifles":
			self add_menu(menu, menu.size);
			
			category = "sniper_rifles";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Shotguns":
			self add_menu(menu, menu.size);
			
			category = "shotguns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Pistols":
			self add_menu(menu, menu.size);
			
			category = "pistols";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Melee Weapons":
			self add_menu(menu, menu.size);
			
			category = "melee";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Equipment":
			self add_menu(menu, menu.size);
			
			category = "equipment";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], undefined, ::give_weapon, self.syn["weapons"][category][0][i]);
			}
			
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
	if(!isDefined(menu) || !isDefined(player) || !isplayer(player)) {
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

// Misc Options

return_toggle(variable) {
	return isDefined(variable) && variable;
}

close_controls_menu() {
	if(isDefined(self.controls["title"])) {
		self.controls["title"] destroy();
		self.controls["separator"][0] destroy();
		self.controls["separator"][1] destroy();
		self.controls["border"] destroy();
		self.controls["background"] destroy();
		self.controls["foreground"] destroy();
		
		self.controls["text"][0] destroy();
		self.controls["text"][1] destroy();
		self.controls["text"][2] destroy();
		self.controls["text"][3] destroy();
	}
}

iPrintString(string) {
	if(!isDefined(self.syn["string"])) {
		self.syn["string"] = self create_text(string, "default", 1, "center", "top", 0, -100, (1,1,1), 1, 9999, false, true);
	} else {
		self.syn["string"] set_text(string);
	}
	self.syn["string"] notify("stop_hud_fade");
	self.syn["string"].alpha = 1;
	self.syn["string"] setText(string);
	self.syn["string"] thread fade_hud(0, 4);
}

fade_hud(alpha, time) {
	self endon("stop_hud_fade");
	self fadeOverTime(time);
	self.alpha = alpha;
	wait time;
}

// Menu Options

modify_menu_position(offset, axis) {
	if(axis == "x") {
		self.x_offset = 175 + offset;
	} else {
		self.y_offset = 160 + offset;
	}
	self close_menu();
	open_menu("Menu Options");
	self.menu["title"].x = 264.2;
}

set_menu_rainbow() {
	if(!isString(self.color_theme)) {
		self.color_theme = "rainbow";
		self close_menu();
		open_menu("Menu Options");
		self.menu["title"].x = 264.2;
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
	self close_menu();
	open_menu("Menu Options");
	self.menu["title"].x = 264.2;
}

watermark() {
	self.watermark = !return_toggle(self.watermark);
	if(self.watermark) {
		iPrintString("Watermark [^2ON^7]");
		if(!isDefined(self.syn["watermark"])) {
			self.syn["watermark"] = self create_text("SyndiShanX", self.font, 1, "TOP_LEFT", "TOPCENTER", 350, -25, "rainbow", 1, 3);
		}
	} else {
		iPrintString("Watermark [^1OFF^7]");
		self.syn["watermark"] destroy();
	}
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
	executeCommand("god");
	wait .01;
	if(self.god_mode) {
		iPrintString("God Mode [^2ON^7]");
	} else {
		iPrintString("God Mode [^1OFF^7]");
	}
}

no_clip() {
	self.no_clip = !return_toggle(self.no_clip);
	executecommand("noclip");
	wait .01;
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
			wait .05;
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
		executeCommand("god");
		wait .01;
		iPrintString("");
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
		wait .05;
	}

	clip delete();
	self enableWeapons();
	self enableOffhandWeapons();

	if(isDefined(self.temp_god_mode)) {
		executeCommand("god");
		wait .01;
		iPrintString("");
		self.temp_god_mode = undefined;
	}

	self.frag_no_clip_loop = undefined;
}

ufo_mode() {
	self.ufo_mode = !return_toggle(self.ufo_mode);
	executecommand("ufo");
	wait .01;
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
	self endOn("stop_infinite_ammo");
	self endOn("game_ended");
	
	for(;;) {
		self setWeaponAmmoClip(self getCurrentWeapon(), 999);
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "left");
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "right");
		wait .2;
	}
}

// Fun Options

forge_mode() {
	self.forge_mode = !return_toggle(self.forge_mode);
	if(self.forge_mode) {
		iPrintString("Forge Mode [^2ON^7], Press ^3[{+speed_throw}]^7 to Pick Up/Drop Objects");
		self thread forge_mode_loop();
	} else {
		iPrintString("Forge Mode [^1OFF^7]");
		self notify("stop_forge_mode");
	}
}

forge_mode_loop() {
	self endon("death");
	self endon("stop_forge_mode");
	while(true) {
		trace = bulletTrace(self getTagOrigin("j_head"), self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 1000000, true, self);
		if(isDefined(trace["entity"])) {
			while(self adsButtonPressed()) {
				trace["entity"] moveTo(self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200);
				trace["entity"].origin = self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200;
				wait .01;
				
				if(self attackButtonPressed()) {
					while(self attackButtonPressed()) {
						trace["entity"] rotatePitch(1, .01);
						trace["entity"] moveTo(self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200);
						trace["entity"].origin = self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200;
						wait .01;
					}
				}
				if(self fragButtonPressed()) {
					while(self fragButtonPressed()) {	 
						trace["entity"] rotateYaw(1, .01);
						trace["entity"] moveTo(self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200);
						trace["entity"].origin = self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200;
						wait .01;
					}
				}
				if(self secondaryOffhandButtonPressed()) {
					while(self secondaryOffhandButtonPressed()) {	 
						trace["entity"] rotateRoll(1, .01);
						trace["entity"] moveTo(self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200);
						trace["entity"].origin = self getTagOrigin("j_head") + anglesToForward(self getPlayerAngles()) * 200;
						wait .01;
					}
				}
				if(!isPlayer( trace["entity"]) && self meleeButtonPressed()) {
					trace["entity"] delete();
					wait .2;
				}
				wait .01;
			}
		}
		wait .05;
	}
}

fullbright() {
	self.fullbright = !return_toggle(self.fullbright);
	if(self.fullbright) {
		iPrintString("Fullbright [^2ON^7]");
		setdvar("r_fullbright", 1);
		wait .01;
	} else {
		iPrintString("Fullbright [^1OFF^7]");
		setdvar("r_fullbright", 0);
		wait .01;
	}
}

third_person() {
	self.third_person = !return_toggle(self.third_person);
	if(self.third_person) {
		iPrintString("Third Person [^2ON^7]");
		setdvar("camera_thirdPerson", 1);
	} else {
		iPrintString("Third Person [^1OFF^7]");
		setdvar("camera_thirdPerson", 0);
	}
}

super_jump() {
	self.super_jump = !return_toggle(self.super_jump);
	if(self.super_jump) {
		setdvar("jump_height", 999);
		if(!isDefined(self.god_mode) || !self.god_mode) {
			god_mode();
			wait .01;
			iPrintString("");
			self.jump_god_mode = true;
		}
		iPrintString("Super Jump [^2ON^7]");
	} else {
		setdvar("jump_height", 39);
		if(isDefined(self.jump_god_mode)) {
			god_mode();
			wait .01;
			iPrintString("");
			self.jump_god_mode = undefined;
		}
		iPrintString("Super Jump [^1OFF^7]");
	}
}

set_timescale(value) {
	setDvar("timescale", value);
}

set_vision(vision) {
	self visionSetNakedForPlayer("", 0.1);
	wait .25;
	self visionSetNakedForPlayer(vision, 0.1);
}

// Killstreaks

give_killstreak(streak) {
	self maps\mp\gametypes\_hardpoints::giveHardpoint(streak, 1);
}

// Perks

give_perk(perk) {
	maps\mp\_utility::giveperk(perk);
}

take_perk(perk) {
	if(maps\mp\_utility::_hasperk(perk)) {
		maps\mp\_utility::_unsetperk(perk);
	}
}

// Weapon Options

get_category(weapon) {
	forEach(weapon_category in self.syn["weapons"]["category"][0]) {
		forEach(weapon_id in self.syn["weapons"][weapon_category][0]) {
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
	_giveweapon(weapon);
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
	self endOn("stop_cycle_camos");
	self endOn("game_ended");
	
	for(;;) {
		for(i = 1; i <= 368; i++) {
			equip_camo(i);
			wait .2;
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
	self dropitem(self getCurrentWeapon());
	self switchToWeapon(self getWeaponsListPrimaries()[0]);
}