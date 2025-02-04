#include maps\mp\_utility;

init() {
	level.username = "";
	setup();
}

return_toggle(variable) {
	return isDefined(variable) && variable;
}

really_alive() {
	return isAlive(self) && !return_toggle(self.lastStand);
}

get_menu() {
	return self.syn["menu"];
}

get_cursor() {
	return self.cursor[self get_menu()];
}

get_title() {
	return self.syn["title"];
}

set_menu(menu) {
	if(isDefined(menu)) {
		self.syn["menu"] = menu;
	}
}

set_cursor(cursor, menu) {
	if(isDefined(cursor)) {
		self.cursor[isDefined(menu) ? menu : self get_menu()] = cursor;
	}
}

set_title(title) {
	if(isDefined(title)) {
		self.syn["title"] = title;
	}
}

has_menu() {
	return return_toggle(self.syn["user"].has_menu);
}

in_menu() {
	return return_toggle(self.syn["utility"].in_menu);
}

set_state() {
	self.syn["utility"].in_menu = !return_toggle(self.syn["utility"].in_menu);
}

execute_function(function, argument_1, argument_2, argument_3, argument_4) {
	if(!isDefined(function)) {
		return;
	}
	
	if(isDefined(argument_4)) {
		return self thread [[function]](argument_1, argument_2, argument_3, argument_4);
	}
	
	if(isDefined(argument_3)) {
		return self thread [[function]](argument_1, argument_2, argument_3);
	}
	
	if(isDefined(argument_2)) {
		return self thread [[function]](argument_1, argument_2);
	}
	
	if(isDefined(argument_1)) {
		return self thread [[function]](argument_1);
	}
	
	return self thread [[function]]();
}

set_slider(scrolling, index) {
	menu = self get_menu();
	index = isDefined(index) ? index : self get_cursor();
	storage = (menu + "_" + index);
	if(!isDefined(self.slider[storage])) {
		self.slider[storage] = isDefined(self.structure[index].array) ? 0 : self.structure[index].start;
	}
	
	if(!isDefined(self.structure[index].array)) {
		self notify("increment_slider");
		if(scrolling == -1)
			self.slider[storage] += self.structure[index].increment;
		
		if(scrolling == 1)
			self.slider[storage] -= self.structure[index].increment;
		
		if(self.slider[storage] > self.structure[index].maximum)
			self.slider[storage] = self.structure[index].minimum;
		
		if(self.slider[storage] < self.structure[index].minimum)
			self.slider[storage] = self.structure[index].maximum;
		
		position = abs((self.structure[index].maximum - self.structure[index].minimum)) / ((50 - 8));
		
		if(!self.structure[index].text_slider) {
			self.syn["hud"]["slider"][0][index] setValue(self.slider[storage]);
		} else {
			self.syn["hud"]["slider"][0][index].x = self.syn["utility"].x_offset + 85;
		}
		self.syn["hud"]["slider"][2][index].x = (self.syn["hud"]["slider"][1][index].x + (abs((self.slider[storage] - self.structure[index].minimum)) / position));
	}
}

clear_option() {
	for(i = 0; i < self.syn["utility"].element_list.size; i++) {
		clear_all(self.syn["hud"][self.syn["utility"].element_list[i]]);
		self.syn["hud"][self.syn["utility"].element_list[i]] = [];
	}
}

check_option(player, menu, cursor) {
	if(isDefined(self.structure) && self.structure.size) {
		for(i = 0; i < self.structure.size; i++) {
			if(player.structure[cursor].text == self.structure[i].text && self get_menu() == menu) {
				return true;
			}
		}
	}

	return false;
}

fade_hud(alpha, time) {
	self endon("stop_hud_fade");
	self fadeOverTime(time);
	self.alpha = alpha;
	wait time;
}

create_text(text, font, font_scale, align_x, align_y, x, y, color, alpha, z_index, hide_when_in_menu, archive) {
	textElement = self maps\mp\gametypes\_hud_util::createfontstring(font, font_scale);
	textElement.alpha = alpha;
	textElement.sort = z_index;
	textElement.foreground = true;
	
	if(isDefined(hide_when_in_menu)) {
		textElement.hidewheninmenu = hide_when_in_menu;
	} else {
		textElement.hidewheninmenu = true;
	}
	
	if(isDefined(archive)) {
		textElement.archived = archive;
	} else {
		textElement.archived = false;
	}
	
	if(color != "rainbow") {
		textElement.color = color;
	} else {
		textElement.color = level.rainbow_color;
		textElement thread start_rainbow();
	}
	
	textElement maps\mp\gametypes\_hud_util::setpoint(align_x, align_y, x, y);
	
	if(isnumber(text)) {
		textElement setValue(text);
	} else {
		textElement set_text(text);
	}
	
	return textElement;
}

set_text(text) {
	if(!isDefined(self) || !isDefined(text)) {
		return;
	}
	
	self.text = text;
	self setText(text);
}

create_shader(shader, align_x, align_y, x, y, width, height, color, alpha, z_index) {
	shaderElement = newClientHudElem(self);
	shaderElement.elemType = "icon";
	shaderElement.children = [];
	shaderElement.alpha = alpha;
	shaderElement.sort = z_index;
	shaderElement.archived = true;
	shaderElement.foreground = true;
	shaderElement.hidden = false;
	shaderElement.hideWhenInMenu = true;
	
	if(color != "rainbow") {
		shaderElement.color = color;
	} else {
		shaderElement.color = level.rainbow_color;
		shaderElement thread start_rainbow();
	}
	
	shaderElement maps\mp\gametypes\_hud_util::setpoint(align_x, align_y, x, y);
	shaderElement set_shader(shader, width, height);
	shaderElement maps\mp\gametypes\_hud_util::setparent(level.uiparent);
	
	return shaderElement;
}

set_shader(shader, width, height) {
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

clear_all(array) {
	if(!isDefined(array)) {
		return;
	}
	
	keys = getArrayKeys(array);
	for(a = 0; a < keys.size; a++) {
		if(isArray(array[keys[a]])) {
			forEach(value in array[keys[a]])
				if(isDefined(value)) {
					value destroy();
				}
		} else {
			if(isDefined(array[keys[a]])) {
				array[keys[a]] destroy();
			}
		}
	}
}

add_menu(title, menu_size, extra) {
	if(isDefined(title)) {
		self set_title(title);
		if(isDefined(extra)) {
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu_size - extra;
		} else {
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu_size;
		}
	}

	self.structure = [];
}

add_option(text, function, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_toggle(text, function, toggle, array, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.toggle = return_toggle(toggle);
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	if(isDefined(array)) {
		option.slider = true;
		option.array  = array;
	}
	
	self.structure[self.structure.size] = option;
}

add_string(text, function, array, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.array = array;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_increment(text, function, start, minimum, maximum, increment, text_slider, slider_text, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.text_slider = text_slider;
	option.slider_text = slider_text;
	option.start = start;
	option.minimum = minimum;
	option.maximum = maximum;
	option.increment = increment;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_category(text) {
	option = spawnStruct();
	option.text = text;
	option.category = true;
	
	self.structure[self.structure.size] = option;
}

new_menu(menu) {
	if(!isDefined(menu)) {
		menu = self.previous[(self.previous.size - 1)];
		self.previous[(self.previous.size - 1)] = undefined;
	} else {
		self.previous[self.previous.size] = self get_menu();
	}
	
	self set_menu(menu);
	self clear_option();
	self create_option();
}

initial_variable() {
	self.syn["utility"] = spawnStruct();
	self.syn["utility"].font = "objective";
	self.syn["utility"].font_scale = 0.7;
	self.syn["utility"].option_limit = 10;
	self.syn["utility"].option_spacing = 14;
	self.syn["utility"].x_offset = 160;
	self.syn["utility"].y_offset = -60;
	self.syn["utility"].element_list = ["text", "subMenu", "toggle", "category", "slider"];
	
	self.syn["visions"][0] = ["None", "AC-130", "AC-130 inverted", "Default Night", "Night Vision", "Endgame", "Missile Cam", "MP Intro", "MP Nuke Aftermath"];
	self.syn["visions"][1] = ["", "ac130", "ac130_inverted", "default_night", "default_night_mp", "end_game", "missilecam", "mpintro", "mpnuke_aftermath"];
	
	self.syn["weapons"]["category"][0] = ["assault_rifles", "sub_machine_guns", "sniper_rifles", "shotguns", "light_machine_guns", "pistols", "melee", "equipment"];
	self.syn["weapons"]["category"][1] = ["Assault Rifles", "Sub Machine Guns", "Sniper Rifles", "Shotguns", "Light Machine Guns", "Pistols", "Melee Weapons", "Equipment"];

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

	self.syn["weapons"]["attachments"][0] =                       ["none_f", "gl_f", "silencer_f"];
	self.syn["weapons"]["attachments"][1] =                       ["None", "Grenade Launcher", "Silencer"];
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
	
	self.syn["utility"].interaction = true;
	
	self.syn["utility"].color[0] = (0.752941176, 0.752941176, 0.752941176);
	self.syn["utility"].color[1] = (0.074509804, 0.070588235, 0.078431373);
	self.syn["utility"].color[2] = (0.074509804, 0.070588235, 0.078431373);
	self.syn["utility"].color[3] = (0.243137255, 0.22745098, 0.247058824);
	self.syn["utility"].color[4] = (1, 1, 1);
	self.syn["utility"].color[5] = "rainbow";
	
	self.cursor = [];
	self.previous = [];
	
	self set_menu("Synergy");
	self set_title(self get_menu());
}

initial_monitor() {
	self endOn("disconnect");
	level endOn("game_ended");
	while(true) {
		if(self really_alive()) {
			if(!self in_menu()) {
				if(self adsButtonPressed() && self meleeButtonPressed()) {
					if(return_toggle(self.syn["utility"].interaction)) {
						self playSoundToPlayer("h1_ui_menu_warning_box_appear", self);
					}
					
					close_controls_menu();
					
					self open_menu();
					wait .15;
				}
			} else {
				menu = self get_menu();
				cursor = self get_cursor();
				if(self meleeButtonPressed()) {
					if(return_toggle(self.syn["utility"].interaction)) {
						self playSoundToPlayer("h1_ui_pause_menu_resume", self);
					}
					
					if(isDefined(self.previous[(self.previous.size - 1)])) {
						self new_menu(self.previous[menu]);
					} else {
						self close_menu();
					}
					
					wait .75;
				}
				else if(self adsButtonPressed() && !self attackButtonPressed() || self attackButtonPressed() && !self adsButtonPressed()) {
					if(isDefined(self.structure) && self.structure.size >= 2) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playSoundToPlayer("h1_ui_menu_scroll", self);
						}
						
						scrolling = self attackButtonPressed() ? 1 : -1;
						
						self set_cursor((cursor + scrolling));
						self update_scrolling(scrolling);
					}
					wait .25;
				}
				else if(self fragButtonPressed() && !self secondaryOffhandButtonPressed() || self secondaryOffhandButtonPressed() && !self fragButtonPressed()) {
					if(return_toggle(self.structure[cursor].slider)) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playSoundToPlayer("h1_ui_menu_scroll", self);
						}
						
						scrolling = self secondaryOffhandButtonPressed() ? 1 : -1;
						
						self set_slider(scrolling);
					}
					wait .07;
				}
				else if(self useButtonPressed()) {
					if(isDefined(self.structure[cursor].function)) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playSoundToPlayer("mp_ui_decline", self);
						}
						
						if(return_toggle(self.structure[cursor].slider)) {
							self thread execute_function(self.structure[cursor].function, isDefined(self.structure[cursor].array) ? self.structure[cursor].array[self.slider[menu + "_" + cursor]] :self.slider[menu + "_" + cursor], self.structure[cursor].argument_1, self.structure[cursor].argument_2, self.structure[cursor].argument_3);
						} else {
							self thread execute_function(self.structure[cursor].function, self.structure[cursor].argument_1, self.structure[cursor].argument_2, self.structure[cursor].argument_3);
						}
						
						if(isDefined(self.structure[cursor].toggle)) {
							self update_menu(menu, cursor);
						}
					}
					wait .2;
				}
			}
		}
		wait .05;
	}
}

open_menu(menu) {
	if(!isDefined(menu)) {
		menu = isDefined(self get_menu()) && self get_menu() != "Synergy" ? self get_menu() : "Synergy";
	}
	
	self.syn["hud"] = [];
	self.syn["hud"]["title"][0] = self create_text(self get_title(), self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 86), (self.syn["utility"].y_offset + 2), self.syn["utility"].color[4], 1, 10);
	self.syn["hud"]["title"][1] = self create_text("______                         ______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset - 4), self.syn["utility"].color[5], 1, 10);
	
	self.syn["hud"]["background"][0] = self create_shader("white", "TOP_LEFT", "CENTER", self.syn["utility"].x_offset - 1, (self.syn["utility"].y_offset - 1), 202, 30, self.syn["utility"].color[5], 1, 1);
	self.syn["hud"]["background"][1] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset), self.syn["utility"].y_offset, 200, 28, self.syn["utility"].color[1], 1, 2);
	self.syn["hud"]["foreground"][1] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 194, 14, self.syn["utility"].color[3], 1, 4);
	self.syn["hud"]["foreground"][2] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 195), (self.syn["utility"].y_offset + 14), 4, 14, self.syn["utility"].color[3], 1, 4);
	
	self set_menu(menu);
	self create_option();
	self set_state();
}

close_menu() {
	self clear_option();
	self clear_all(self.syn["hud"]);
	self set_state();
}

create_title(title) {
	self.syn["hud"]["title"][0] set_text(isDefined(title) ? title : self get_title());
}

create_option() {
	self clear_option();
	self menu_index();
	if(!isDefined(self.structure) || !self.structure.size) {
		self add_option("Currently No Options To Display");
	}
	
	if(!isDefined(self get_cursor())) {
		self set_cursor(0);
	}
	
	start = 0;
	if((self get_cursor() > int(((self.syn["utility"].option_limit - 1) / 2))) && (self get_cursor() < (self.structure.size - int(((self.syn["utility"].option_limit + 1) / 2)))) && (self.structure.size > self.syn["utility"].option_limit)) {
		start = (self get_cursor() - int((self.syn["utility"].option_limit - 1) / 2));
	}
	
	if((self get_cursor() > (self.structure.size - (int(((self.syn["utility"].option_limit + 1) / 2)) + 1))) && (self.structure.size > self.syn["utility"].option_limit)) {
		start = (self.structure.size - self.syn["utility"].option_limit);
	}
	
	self create_title();
	if(isDefined(self.structure) && self.structure.size) {
		limit = min(self.structure.size, self.syn["utility"].option_limit);
		for(i = 0; i < limit; i++) {
			index = (i + start);
			cursor = (self get_cursor() == index);
			color[0] = cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[4];
			color[1] = return_toggle(self.structure[index].toggle) ? cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[4] : cursor ? self.syn["utility"].color[2] : self.syn["utility"].color[3];
			if(isDefined(self.structure[index].function) && self.structure[index].function == ::new_menu) {
				self.syn["hud"]["subMenu"][index] = self create_text(">", self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 185), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), self.syn["utility"].color[4], 1, 10);
			}
			
			if(isDefined(self.structure[index].toggle)) {
				self.syn["hud"]["toggle"][1][index] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 8, 8, color[1], 1, 10);
			}
			
			for(x = 0; x < 15; x++) {
				if(x != self get_cursor()) {
					if(isDefined(self.syn["hud"]["arrow"][0][x])) {
						self.syn["hud"]["arrow"][0][x] destroy();
						self.syn["hud"]["arrow"][1][x] destroy();
					}
				}
			}
			
			if(return_toggle(self.structure[index].slider)) {
				if(isDefined(self.structure[index].array)) {
					self.syn["hud"]["slider"][0][index] = self create_text(self.structure[index].array[self.slider[self get_menu() + "_" + index]], self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 155), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), color[0], 1, 10);
				} else {
					if(cursor) {
						self.syn["hud"]["slider"][0][index] = self create_text(self.slider[self get_menu() + "_" + index], self.syn["utility"].font, (self.syn["utility"].font_scale - 0.1), "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 155), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), self.syn["utility"].color[4], 1, 10);
						self.syn["hud"]["arrow"][0][self get_cursor()] = self create_text("<", self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 129), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), self.syn["utility"].color[4], 1, 10);
						self.syn["hud"]["arrow"][1][self get_cursor()] = self create_text(">", self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 185), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), self.syn["utility"].color[4], 1, 10);
					} else {
						self.syn["hud"]["arrow"][0][index] destroy();
						self.syn["hud"]["arrow"][1][index] destroy();
					}
				
					self.syn["hud"]["slider"][1][index] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 135), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 50, 8, cursor ? self.syn["utility"].color[2] : self.syn["utility"].color[1], 1, 8);
					self.syn["hud"]["slider"][2][index] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 149), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 8, 8, cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[3], 1, 9);
				}
				
				self set_slider(undefined, index);
			}
			
			if(return_toggle(self.structure[index].category)) {
				self.syn["hud"]["category"][0][index] = self create_text(self.structure[index].text, self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 88), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), self.syn["utility"].color[0], 1, 10);
				self.syn["hud"]["category"][1][index] = self create_text("______                         ______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 11)), self.syn["utility"].color[5], 1, 10);
			}
			else {
				if(return_toggle(self.shader_option[self get_menu()])) {
					self.syn["hud"]["text"][index] = self create_shader(isDefined(self.structure[index].text) ? self.structure[index].text : "white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + ((i * 20) - ((limit * 10) - 110))), (self.syn["utility"].y_offset + 27), isDefined(self.structure[index].argument_2) ? self.structure[index].argument_2 : 18, isDefined(self.structure[index].argument_3) ? self.structure[index].argument_3 : 18, isDefined(self.structure[index].argument_1) ? self.structure[index].argument_1 : (1, 1, 1), cursor ? 1 : 0.2, 10);
				} else {
					self.syn["hud"]["text"][index] = self create_text(return_toggle(self.structure[index].slider) ? self.structure[index].text + ":" : self.structure[index].text, self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", isDefined(self.structure[index].toggle) ? (self.syn["utility"].x_offset + 15) : (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), color[0], 1, 10);
				}
			}
		}
		
		if(!isDefined(self.syn["hud"]["text"][self get_cursor()])) {
			self set_cursor((self.structure.size - 1));
		}
	}
	self update_resize();
}

update_scrolling(scrolling) {	
	if(return_toggle(self.structure[self get_cursor()].category)) {
		self set_cursor((self get_cursor() + scrolling));
		return self update_scrolling(scrolling);
	}
	
	if((self.structure.size > self.syn["utility"].option_limit) || (self get_cursor() >= 0) || (self get_cursor() <= 0)) {
		if((self get_cursor() >= self.structure.size) || (self get_cursor() < 0)) {
			self set_cursor((self get_cursor() >= self.structure.size) ? 0 : (self.structure.size - 1));
		}
		self create_option();
	}
	self update_resize();
}

update_resize() {
	limit = min(self.structure.size, self.syn["utility"].option_limit);
	height = int((limit * self.syn["utility"].option_spacing));
	adjust = (self.structure.size > self.syn["utility"].option_limit) ? int(((94 / self.structure.size) * limit)) : height;
	position = (self.structure.size - 1) / (height - adjust);
	if(!return_toggle(self.shader_option[self get_menu()])) {
		if(!isDefined(self.syn["hud"]["foreground"][1])) {
			self.syn["hud"]["foreground"][1] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 194, 14, self.syn["utility"].color[3], 1, 4);
		}
		
		if(!isDefined(self.syn["hud"]["foreground"][2])) {
			self.syn["hud"]["foreground"][2] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 195), (self.syn["utility"].y_offset + 14), 4, 14, self.syn["utility"].color[3], 1, 4);
		}
	}
	
	self.syn["hud"]["background"][0] set_shader(self.syn["hud"]["background"][0].shader, self.syn["hud"]["background"][0].width, return_toggle(self.shader_option[self get_menu()]) ? 42 : (height + 16));
	self.syn["hud"]["background"][1] set_shader(self.syn["hud"]["background"][1].shader, self.syn["hud"]["background"][1].width, return_toggle(self.shader_option[self get_menu()]) ? 40 : (height + 14));
	self.syn["hud"]["foreground"][0] set_shader(self.syn["hud"]["foreground"][0].shader, self.syn["hud"]["foreground"][0].width, return_toggle(self.shader_option[self get_menu()]) ? 26 : height);
	self.syn["hud"]["foreground"][2] set_shader(self.syn["hud"]["foreground"][2].shader, self.syn["hud"]["foreground"][2].width, adjust);
	
	if(isDefined(self.syn["hud"]["foreground"][1])) {
		self.syn["hud"]["foreground"][1].y = (self.syn["hud"]["text"][self get_cursor()].y - 2);
	}
	
	self.syn["hud"]["foreground"][2].y = (self.syn["utility"].y_offset + 14);
	if(self.structure.size > self.syn["utility"].option_limit) {
	    self.syn["hud"]["foreground"][2].y += (self get_cursor() / position);
	}
}

update_menu(menu, cursor) {
	if(isDefined(menu) && !isDefined(cursor) || !isDefined(menu) && isDefined(cursor)) {
		return;
	}
	
	if(isDefined(menu) && isDefined(cursor)) {
		forEach(player in level.players) {
			if(!isDefined(player) || !player in_menu()) {
				continue;
			}
		
			if(player get_menu() == menu || self != player && player check_option(self, menu, cursor)) {
				if(isDefined(player.syn["hud"]["text"][cursor]) || player == self && player get_menu() == menu && isDefined(player.syn["hud"]["text"][cursor]) || self != player && player check_option(self, menu, cursor)) {
					player create_option();
				}
			}
		}
	} else {
		if(isDefined(self) && self in_menu()) {
			self create_option();
		}
	}
}

create_rainbow_color() {
	x = 0; y = 0;
	r = 0; g = 0; b = 0;
	level.rainbow_color = (0, 0, 0);
	
	while(true) {
		if (y >= 0 && y < 258) {
			r = 255;
			g = 0;
			b = x;
		} else if (y >= 258 && y < 516) {
			r = 255 - x;
			g = 0;
			b = 255;
		} else if (y >= 516 && y < 774) {
			r = 0;
			g = x;
			b = 255;
		} else if (y >= 774 && y < 1032) {
			r = 0;
			g = 255;
			b = 255 - x;
		} else if (y >= 1032 && y < 1290) {
			r = x;
			g = 255;
			b = 0;
		} else if (y >= 1290 && y < 1545) {
			r = 255;
			g = 255 - x;
			b = 0;
		}
		
		x += 3;
		if (x > 255)
			x = 0;
		
		y += 3;
		if (y > 1545)
			y = 0;
		
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

setup() {
	level thread onPlayerConnect();
	level thread create_rainbow_color();
}

on_event() {
	self endOn("disconnect");
	self.syn = [];
	self.syn["user"] = spawnStruct();
	while (true) {
		if(!isDefined(self.syn["user"].has_menu)) {
			self.syn["user"].has_menu = true;
			
			self initial_variable();
			self thread initial_monitor();
		}
		break;
	}
}

on_ended() {
	level waitTill("game_ended");
	if(self in_menu()) {
		self close_menu();
	}
}

onPlayerConnect() {
	for(;;) {
		level waitTill("connected", player);
		executeCommand("sv_cheats 1");
		
		if(isBot(player)) {
			return;
		}
		
		if(level.username == "") {
			player thread create_text(player.name, "default", 1, "top_left", "top", -370, -70, (1,1,1), 1, 3);
		}
		
		if(player.name == level.username) {
			player thread on_event();
			player thread on_ended();
			player thread onPlayerSpawned();
		}
	}
}

onPlayerSpawned() {
	self endOn("disconnect");
	level endOn("game_ended");
	for(;;) {
		self waitTill("spawned_player");
		
		if(self isHost()) {
			self freezeControls(false);
			self thread create_text("SyndiShanX", "default", 1, "top_left", "top", 385, -220, "rainbow", 1, 3);
		}
		
		if(self in_menu()) {
			self close_menu();
		}
		
		if(!self.menuInit) {
			open_controls_menu("Controls");
			self.menuInit = true;
		}
	}
}

open_controls_menu() {
	self.syn["controls-hud"] = [];
	self.syn["controls-hud"]["title"][0] = self create_text("Controls", self.syn["utility"].font, self.syn["utility"].font_scale, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 86), (self.syn["utility"].y_offset + 2), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["title"][1] = self create_text("______                             ______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset - 4), self.syn["utility"].color[5], 1, 10);
	
	self.syn["controls-hud"]["background"][0] = self create_shader("white", "TOP_LEFT", "CENTER", self.syn["utility"].x_offset - 1, (self.syn["utility"].y_offset - 1), 222, 97, self.syn["utility"].color[5], 1, 1);
	self.syn["controls-hud"]["background"][1] = self create_shader("white", "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset), self.syn["utility"].y_offset, 220, 95, self.syn["utility"].color[1], 1, 2);
	
	self.syn["controls-hud"]["controls"][0] = self create_text("Open: ^3[{+speed_throw}] ^7and ^3[{+melee}]", self.syn["utility"].font, 1, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 15), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["controls"][1] = self create_text("Scroll: ^3[{+speed_throw}] ^7and ^3[{+attack}]", self.syn["utility"].font, 1, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 35), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["controls"][2] = self create_text("Select: ^3[{+activate}] ^7Back: ^3[{+melee}]", self.syn["utility"].font, 1, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 55), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["controls"][3] = self create_text("Sliders: ^3[{+smoke}] ^7and ^3[{+frag}]", self.syn["utility"].font, 1, "TOP_LEFT", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 75), self.syn["utility"].color[4], 1, 10);
	
	wait 8;
	
	close_controls_menu();
}

close_controls_menu() {
	self.syn["controls-hud"] destroy();
	self.syn["controls-hud"]["title"][0] destroy();
	self.syn["controls-hud"]["title"][1] destroy();
	self.syn["controls-hud"]["title"][2] destroy();
	
	self.syn["controls-hud"]["background"][0] destroy();
	self.syn["controls-hud"]["background"][1] destroy();
	self.syn["controls-hud"]["foreground"][0] destroy();
	
	self.syn["controls-hud"]["controls"][0] destroy();
	self.syn["controls-hud"]["controls"][1] destroy();
	self.syn["controls-hud"]["controls"][2] destroy();
	self.syn["controls-hud"]["controls"][3] destroy();
	
	self.jump_god_mode = false;
}

menu_index() {
	menu = self get_menu();
	if(!isDefined(menu)) {
		menu = "Empty Menu";
	}
	
	switch(menu) {
		case "Synergy":
			self add_menu(menu, menu.size, menu.size);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86;
			
			self add_option("Basic Options", ::new_menu, "Basic Options");
			self add_option("Fun Options", ::new_menu, "Fun Options");
			self add_option("Weapon Options", ::new_menu, "Weapon Options");
			self add_option("Menu Options", ::new_menu, "Menu Options");
			
			break;
		case "Basic Options":
			self add_menu(menu, menu.size, 1);
			
			self add_toggle("God Mode", ::god_mode, self.god_mode);
			self add_toggle("No Clip", ::no_clip, self.no_clip);
			self add_toggle("UFO", ::ufo_mode, self.ufo_mode);
			self add_toggle("Infinite Ammo", ::infinite_ammo, self.infinite_ammo);
		
			break;
		case "Fun Options":
			self add_menu(menu, menu.size);
			
			self add_toggle("Super Jump", ::super_jump, self.super_jump);
			self add_increment("Set Speed", ::set_speed, 190, 190, 990, 50);
			
			self add_toggle("Fullbright", ::fullbright, self.fullbright);
			self add_toggle("Third Person", ::third_person, self.third_person);
			self add_option("Visions", ::new_menu, "Visions");
			
			break;
		case "Weapon Options":
			self add_menu(menu, menu.size);
			
			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");
			
			self add_option("Give Weapons", ::new_menu, "Give Weapons");
			if(category != "equipment") {
				self add_option("Attachments", ::new_menu, "Attachments");
			}
			self add_option("Take Current Weapon", ::take_weapon);
			
			break;
		case "Menu Options":
			self add_menu(menu, menu.size);
		
			self add_increment("Move Menu X", ::modify_x_position, 0, -580, 60, 10);
			if(self.syn["utility"].x_offset < -270) {
				self add_increment("Move Menu Y", ::modify_y_position, 0, -10, 100, 10);
			} else {
				self add_increment("Move Menu Y", ::modify_y_position, 0, -170, 100, 10);
			}
			
			break;
		case "Visions":
			self add_menu(menu, menu.size);
			
			for(i = 0; i < self.syn["visions"][0].size; i++) {
				self add_option(self.syn["visions"][0][i], ::set_vision, self.syn["visions"][1][i]);
			}
		
			break;
		case "Give Weapons":
			self add_menu(menu, menu.size);
			
			for(i = 0; i < self.syn["weapons"]["category"][1].size; i++) {
				self add_option(self.syn["weapons"]["category"][1][i], ::new_menu, self.syn["weapons"]["category"][1][i]);
			}
			
			break;
		case "Assault Rifles":
			self add_menu(menu, menu.size);
			
			category = "assault_rifles";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Sub Machine Guns":
			self add_menu(menu, menu.size);
			
			category = "sub_machine_guns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Light Machine Guns":
			self add_menu(menu, menu.size);
			
			category = "light_machine_guns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Sniper Rifles":
			self add_menu(menu, menu.size);
			
			category = "sniper_rifles";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Shotguns":
			self add_menu(menu, menu.size);
			
			category = "shotguns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Pistols":
			self add_menu(menu, menu.size);
			
			category = "pistols";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Melee Weapons":
			self add_menu(menu, menu.size);
			
			category = "melee";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_base_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Equipment":
			self add_menu(menu, menu.size);
			
			category = "equipment";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i]);
			}
			
			break;
		case "Attachments":
			self add_menu(menu, menu.size);
			
			weapon_name = getBaseWeaponName(self getCurrentWeapon());
			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");
			
			if(category != "melee" && category != "equipment") {
				self add_option("Equip Attachment", ::new_menu, "Equip Attachment");
				self add_option("Equip Kit", ::new_menu, "Equip Kit");
				self add_option("Equip Camo", ::new_menu, "Equip Camo");
			}
			
			if(weapon_name != "h1_junsho" && category != "pistols" && category != "melee" && category != "equipment") {
				self add_increment("Equip Reticle", ::equip_reticle, 0, 0, 182, 1);
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
				self add_option(self.syn["weapons"]["attachments"][1][i], ::equip_attachment, self.syn["weapons"]["attachments"][0][i]);
			}
			
			if(category != "pistols") {
				for(i = 0; i < self.syn["weapons"][category]["attachments"][0].size; i++) {
					self add_option(self.syn["weapons"][category]["attachments"][1][i], ::equip_attachment, self.syn["weapons"][category]["attachments"][0][i]);
				}
			}
			
			break;
		case "Equip Kit":
			self add_menu(menu, menu.size);
			
			category = get_category(getBaseWeaponName(self getCurrentWeapon()) + "_mp");
			
			self add_option("None", ::equip_kit, "base");
			
			for(i = 0; i < self.syn["weapons"][category]["kits"][0].size; i++) {
				self add_option(self.syn["weapons"][category]["kits"][1][i], ::equip_kit, self.syn["weapons"][category]["kits"][0][i]);
			}
			
			break;
		case "Equip Camo":
			self add_menu(menu, menu.size);
			
			self add_increment("Equip Camo", ::equip_camo, 1, 1, 368, 1);
			self add_toggle("Cycle Camos", ::cycle_camos, self.cycle_camos);
			
			break;
		case "Empty Menu":
			self add_menu(menu, menu.size);
			
			self add_option("Unassigned Menu");
			break;
	}
}

iPrintString(string) {
	if(!isDefined(self.syn["string"])) {
		self.syn["string"] = self create_text(string, "default", 1, "center", "top", 0, -115, (1,1,1), 1, 9999, false, true);
	} else {
		self.syn["string"] set_text(string);
	}
	self.syn["string"] notify("stop_hud_fade");
	self.syn["string"].alpha = 1;
	self.syn["string"] setText(string);
	self.syn["string"] thread fade_hud(0, 4);
}

modify_x_position(offset) {
	self.syn["utility"].x_offset = 160 + offset;
	for(x = 0; x < 15; x++) {
		if(isDefined(self.syn["hud"]["arrow"][0][x])) {
			self.syn["hud"]["arrow"][0][x] destroy();
			self.syn["hud"]["arrow"][1][x] destroy();
		}
	}
	self close_menu();
	open_menu("Menu Options");
}

modify_y_position(offset) {
	self.syn["utility"].y_offset = -60 + offset;
	for(x = 0; x < 15; x++) {
		if(isDefined(self.syn["hud"]["arrow"][0][x])) {
			self.syn["hud"]["arrow"][0][x] destroy();
			self.syn["hud"]["arrow"][1][x] destroy();
		}
	}
	self close_menu();
	open_menu("Menu Options");
}

god_mode() {
	self.god_mode = !return_toggle(self.god_mode);
	executeCommand("god");
	wait .01;
	if(self.god_mode) {
		self iPrintString("God Mode [^2ON^7]");
	} else {
		self iPrintString("God Mode [^1OFF^7]");
	}
}

no_clip() {
	self.no_clip = !return_toggle(self.no_clip);
	executecommand("noclip");
	wait .01;
	if(self.no_clip) {
		self iPrintString("No Clip [^2ON^7]");
	} else {
		self iPrintString("No Clip [^1OFF^7]");
	}
}

ufo_mode() {
	self.ufo_mode = !return_toggle(self.ufo_mode);
	executecommand("ufo");
	wait .01;
	if(self.ufo_mode) {
		self iPrintString("UFO Mode [^2ON^7]");
	} else {
		self iPrintString("UFO Mode [^1OFF^7]");
	}
}

infinite_ammo() {
	self.infinite_ammo = !return_toggle(self.infinite_ammo);
	if(self.infinite_ammo) {
		self iPrintString("Infinite Ammo [^2ON^7]");
		self thread infinite_ammo_loop();
	} else {
		self iPrintString("Infinite Ammo [^1OFF^7]");
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
		wait .1;
	}
}

set_speed(value) {
	setdvar("g_speed", value);
}

super_jump() {
	self.super_jump = !return_toggle(self.super_jump);
	if(self.super_jump) {
		setdvar("jump_height", 999);
		if(!self.god_mode) {
			self.jump_god_mode = true;
			god_mode();
		}
		self iPrintString("Super Jump [^2ON^7]");
	} else {
		setdvar("jump_height", 39);
		if(self.jump_god_mode) {
			self.jump_god_mode = false;
			god_mode();
		}
		self iPrintString("Super Jump [^1OFF^7]");
	}
}

fullbright() {
	self.fullbright = !return_toggle(self.fullbright);
	if(self.fullbright) {
		self iPrintString("Fullbright [^2ON^7]");
		setdvar("r_fullbright", 1);
		wait .01;
	} else {
		self iPrintString("Fullbright [^1OFF^7]");
		setdvar("r_fullbright", 0);
		wait .01;
	}
}

third_person() {
	self.third_person = !return_toggle(self.third_person);
	if(self.third_person) {
		self iPrintString("Third Person [^2ON^7]");
		setdvar("camera_thirdPerson", 1);
	} else {
		self iPrintString("Third Person [^1OFF^7]");
		setdvar("camera_thirdPerson", 0);
	}
}

set_vision(vision) {
	self visionSetNakedForPlayer("", 0.1);
	wait .25;
	self visionSetNakedForPlayer(vision, 0.1);
}

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
	if(check_weapons(weapon)) {
		weapon_attached = weapon + "#" + attachment + "#" + weapon_cosmetics;
		self take_weapon(self getCurrentWeapon());
		self give_weapon(weapon_attached);
	} else {
		self switchToWeapon(weapon);
	}
}

equip_kit(kit) {
	weapon = getBaseWeaponName(self getCurrentWeapon()) + "_mp_a";
	weapon_attachment = strtok(self getCurrentWeapon(), "#")[1];
	weapon_camo = strtok(strtok(self getCurrentWeapon(), "#")[2], "_")[1];
	if(check_weapons(weapon)) {
		if(isDefined(weapon_camo)) {
			weapon_kitted = weapon + "#" + weapon_attachment + "#" + kit + "_" + weapon_camo;
		} else {
			weapon_kitted = weapon + "#" + weapon_attachment + "#" + kit;
		}
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
		self iPrintString("Cycle Camos [^2ON^7]");
		self thread cycle_camos_loop();
	} else {
		self iPrintString("Cycle Camos [^1OFF^7]");
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
		if (isDefined(weapon_camo)) {
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