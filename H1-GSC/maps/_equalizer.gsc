/********************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\_equalizer.gsc
********************************/

loadpresets() {
  level.eq_defs = [];
  level.ambient_reverb = [];
  generic_eq();
  old_iw4_eq();
  generic_filters();
  old_iw4_filters();
}

generic_eq() {
  define_reverb("deathsdoor");
  set_reverb_roomtype("deathsdoor", "underwater");
  set_reverb_drylevel("deathsdoor", 0.5);
  set_reverb_wetlevel("deathsdoor", 0.4);
  set_reverb_fadetime("deathsdoor", 2);
  set_reverb_priority("deathsdoor", "snd_enveffectsprio_level");
  define_reverb("alley");
  set_reverb_roomtype("alley", "alley");
  set_reverb_drylevel("alley", 0.9);
  set_reverb_wetlevel("alley", 0.1);
  set_reverb_fadetime("alley", 2);
  set_reverb_priority("alley", "snd_enveffectsprio_level");
  define_reverb("bunker");
  set_reverb_roomtype("bunker", "stoneroom");
  set_reverb_drylevel("bunker", 0.8);
  set_reverb_wetlevel("bunker", 0.4);
  set_reverb_fadetime("bunker", 2);
  set_reverb_priority("bunker", "snd_enveffectsprio_level");
  define_reverb("city");
  set_reverb_roomtype("city", "city");
  set_reverb_drylevel("city", 0.8);
  set_reverb_wetlevel("city", 0.3);
  set_reverb_fadetime("city", 2);
  set_reverb_priority("city", "snd_enveffectsprio_level");
  define_reverb("container");
  set_reverb_roomtype("container", "sewerpipe");
  set_reverb_drylevel("container", 0.9);
  set_reverb_wetlevel("container", 0.4);
  set_reverb_fadetime("container", 2);
  set_reverb_priority("container", "snd_enveffectsprio_level");
  define_reverb("exterior");
  set_reverb_roomtype("exterior", "city");
  set_reverb_drylevel("exterior", 0.9);
  set_reverb_wetlevel("exterior", 0.15);
  set_reverb_fadetime("exterior", 6);
  set_reverb_priority("exterior", "snd_enveffectsprio_level");
  define_reverb("exterior1");
  set_reverb_roomtype("exterior1", "alley");
  set_reverb_drylevel("exterior1", 0.9);
  set_reverb_wetlevel("exterior1", 0.2);
  set_reverb_fadetime("exterior1", 2);
  set_reverb_priority("exterior1", "snd_enveffectsprio_level");
  define_reverb("exterior2");
  set_reverb_roomtype("exterior2", "alley");
  set_reverb_drylevel("exterior2", 0.9);
  set_reverb_wetlevel("exterior2", 0.2);
  set_reverb_fadetime("exterior2", 2);
  set_reverb_priority("exterior2", "snd_enveffectsprio_level");
  define_reverb("exterior3");
  set_reverb_roomtype("exterior3", "alley");
  set_reverb_drylevel("exterior3", 0.9);
  set_reverb_wetlevel("exterior3", 0.2);
  set_reverb_fadetime("exterior3", 2);
  set_reverb_priority("exterior3", "snd_enveffectsprio_level");
  define_reverb("exterior4");
  set_reverb_roomtype("exterior4", "alley");
  set_reverb_drylevel("exterior4", 0.9);
  set_reverb_wetlevel("exterior4", 0.2);
  set_reverb_fadetime("exterior4", 2);
  set_reverb_priority("exterior4", "snd_enveffectsprio_level");
  define_reverb("exterior5");
  set_reverb_roomtype("exterior5", "alley");
  set_reverb_drylevel("exterior5", 0.9);
  set_reverb_wetlevel("exterior5", 0.2);
  set_reverb_fadetime("exterior5", 2);
  set_reverb_priority("exterior5", "snd_enveffectsprio_level");
  define_reverb("forrest");
  set_reverb_roomtype("forrest", "forest");
  set_reverb_drylevel("forrest", 0.9);
  set_reverb_wetlevel("forrest", 0.1);
  set_reverb_fadetime("forrest", 2);
  set_reverb_priority("forrest", "snd_enveffectsprio_level");
  define_reverb("hangar");
  set_reverb_roomtype("hangar", "hangar");
  set_reverb_drylevel("hangar", 0.8);
  set_reverb_wetlevel("hangar", 0.3);
  set_reverb_fadetime("hangar", 4);
  set_reverb_priority("hangar", "snd_enveffectsprio_level");
  define_reverb("interior");
  set_reverb_roomtype("interior", "stonecorridor");
  set_reverb_drylevel("interior", 0.9);
  set_reverb_wetlevel("interior", 0.3);
  set_reverb_fadetime("interior", 2);
  set_reverb_priority("interior", "snd_enveffectsprio_level");
  define_reverb("interior_metal");
  set_reverb_roomtype("interior_metal", "sewerpipe");
  set_reverb_drylevel("interior_metal", 0.8);
  set_reverb_wetlevel("interior_metal", 0.3);
  set_reverb_fadetime("interior_metal", 2);
  set_reverb_priority("interior_metal", "snd_enveffectsprio_level");
  define_reverb("interior_stone");
  set_reverb_roomtype("interior_stone", "stoneroom");
  set_reverb_drylevel("interior_stone", 0.9);
  set_reverb_wetlevel("interior_stone", 0.2);
  set_reverb_fadetime("interior_stone", 2);
  set_reverb_priority("interior_stone", "snd_enveffectsprio_level");
  define_reverb("interior_vehicle");
  set_reverb_roomtype("interior_vehicle", "carpetedhallway");
  set_reverb_drylevel("interior_vehicle", 0.9);
  set_reverb_wetlevel("interior_vehicle", 0.1);
  set_reverb_fadetime("interior_vehicle", 2);
  set_reverb_priority("interior_vehicle", "snd_enveffectsprio_level");
  define_reverb("interior_wood");
  set_reverb_roomtype("interior_wood", "livingroom");
  set_reverb_drylevel("interior_wood", 0.9);
  set_reverb_wetlevel("interior_wood", 0.2);
  set_reverb_fadetime("interior_wood", 2);
  set_reverb_priority("interior_wood", "snd_enveffectsprio_level");
  define_reverb("invasion_ext1");
  set_reverb_roomtype("invasion_ext1", "parkinglot");
  set_reverb_drylevel("invasion_ext1", 0.9);
  set_reverb_wetlevel("invasion_ext1", 0.2);
  set_reverb_fadetime("invasion_ext1", 3);
  set_reverb_priority("invasion_ext1", "snd_enveffectsprio_level");
  define_reverb("invasion_ext3");
  set_reverb_roomtype("invasion_ext3", "parkinglot");
  set_reverb_drylevel("invasion_ext3", 0.9);
  set_reverb_wetlevel("invasion_ext3", 0.2);
  set_reverb_fadetime("invasion_ext3", 3);
  set_reverb_priority("invasion_ext3", "snd_enveffectsprio_level");
  define_reverb("mountains");
  set_reverb_roomtype("mountains", "mountains");
  set_reverb_drylevel("mountains", 0.8);
  set_reverb_wetlevel("mountains", 0.3);
  set_reverb_fadetime("mountains", 2);
  set_reverb_priority("mountains", "snd_enveffectsprio_level");
  define_reverb("pipe");
  set_reverb_roomtype("pipe", "sewerpipe");
  set_reverb_drylevel("pipe", 0.9);
  set_reverb_wetlevel("pipe", 0.4);
  set_reverb_fadetime("pipe", 2);
  set_reverb_priority("pipe", "snd_enveffectsprio_level");
  define_reverb("shanty");
  set_reverb_roomtype("shanty", "livingroom");
  set_reverb_drylevel("shanty", 0.9);
  set_reverb_wetlevel("shanty", 0.1);
  set_reverb_fadetime("shanty", 2);
  set_reverb_priority("shanty", "snd_enveffectsprio_level");
  define_reverb("snow_base");
  set_reverb_roomtype("snow_base", "mountains");
  set_reverb_drylevel("snow_base", 0.8);
  set_reverb_wetlevel("snow_base", 0.3);
  set_reverb_fadetime("snow_base", 5);
  set_reverb_priority("snow_base", "snd_enveffectsprio_level");
  define_reverb("snow_cliff");
  set_reverb_roomtype("snow_cliff", "mountains");
  set_reverb_drylevel("snow_cliff", 0.8);
  set_reverb_wetlevel("snow_cliff", 0.3);
  set_reverb_fadetime("snow_cliff", 5);
  set_reverb_priority("snow_cliff", "snd_enveffectsprio_level");
  define_reverb("underpass");
  set_reverb_roomtype("underpass", "stonecorridor");
  set_reverb_drylevel("underpass", 0.9);
  set_reverb_wetlevel("underpass", 0.3);
  set_reverb_fadetime("underpass", 2);
  set_reverb_priority("underpass", "snd_enveffectsprio_level");
  define_reverb("tunnel");
  set_reverb_roomtype("tunnel", "cave");
  set_reverb_drylevel("tunnel", 0.85);
  set_reverb_wetlevel("tunnel", 0.35);
  set_reverb_fadetime("tunnel", 2);
  set_reverb_priority("tunnel", "snd_enveffectsprio_level");
}

generic_filters() {
  define_filter("deathsdoor");
  set_filter_type("deathsdoor", 0, "highshelf");
  set_filter_freq("deathsdoor", 0, 2800);
  set_filter_gain("deathsdoor", 0, -12);
  set_filter_q("deathsdoor", 0, 1);
  set_filter_type("deathsdoor", 1, "lowshelf");
  set_filter_freq("deathsdoor", 1, 1000);
  set_filter_gain("deathsdoor", 1, -6);
  set_filter_q("deathsdoor", 1, 1);
  add_channel_to_filter("deathsdoor", "physics");
  add_channel_to_filter("deathsdoor", "ambdist1");
  add_channel_to_filter("deathsdoor", "ambdist2");
  add_channel_to_filter("deathsdoor", "auto");
  add_channel_to_filter("deathsdoor", "auto2");
  add_channel_to_filter("deathsdoor", "autodog");
  add_channel_to_filter("deathsdoor", "explosiveimpact");
  add_channel_to_filter("deathsdoor", "element");
  add_channel_to_filter("deathsdoor", "vehicle");
  add_channel_to_filter("deathsdoor", "vehiclelimited");
  add_channel_to_filter("deathsdoor", "body");
  add_channel_to_filter("deathsdoor", "reload");
  add_channel_to_filter("deathsdoor", "effects1");
  add_channel_to_filter("deathsdoor", "effects2");
  add_channel_to_filter("deathsdoor", "weapon");
  add_channel_to_filter("deathsdoor", "voice");
  define_filter("alley");
  set_filter_type("alley", 0, "highshelf");
  set_filter_freq("alley", 0, 3500);
  set_filter_gain("alley", 0, -2);
  set_filter_q("alley", 0, 1);
  add_channel_to_filter("alley", "ambient");
  add_channel_to_filter("alley", "element");
  add_channel_to_filter("alley", "vehicle");
  add_channel_to_filter("alley", "weapon");
  add_channel_to_filter("alley", "voice");
  define_filter("bunker");
  set_filter_type("bunker", 0, "highshelf");
  set_filter_freq("bunker", 0, 3500);
  set_filter_gain("bunker", 0, -2);
  set_filter_q("bunker", 0, 1);
  add_channel_to_filter("bunker", "ambient");
  add_channel_to_filter("bunker", "element");
  add_channel_to_filter("bunker", "vehicle");
  add_channel_to_filter("bunker", "weapon");
  add_channel_to_filter("bunker", "voice");
  define_filter("container");
  set_filter_type("container", 0, "highshelf");
  set_filter_freq("container", 0, 3500);
  set_filter_gain("container", 0, -6);
  set_filter_q("container", 0, 1);
  add_channel_to_filter("container", "ambient");
  add_channel_to_filter("container", "element");
  add_channel_to_filter("container", "vehicle");
  add_channel_to_filter("container", "weapon");
  add_channel_to_filter("container", "voice");
  define_filter("hangar");
  set_filter_type("hangar", 0, "highshelf");
  set_filter_freq("hangar", 0, 3500);
  set_filter_gain("hangar", 0, -9);
  set_filter_q("hangar", 0, 1);
  add_channel_to_filter("hangar", "ambient");
  add_channel_to_filter("hangar", "element");
  add_channel_to_filter("hangar", "vehicle");
  add_channel_to_filter("hangar", "weapon");
  add_channel_to_filter("hangar", "voice");
  define_filter("interior_metal");
  set_filter_type("interior_metal", 0, "highshelf");
  set_filter_freq("interior_metal", 0, 3500);
  set_filter_gain("interior_metal", 0, -18);
  set_filter_q("interior_metal", 0, 1);
  add_channel_to_filter("interior_metal", "ambient");
  add_channel_to_filter("interior_metal", "element");
  add_channel_to_filter("interior_metal", "vehicle");
  add_channel_to_filter("interior_metal", "weapon");
  add_channel_to_filter("interior_metal", "voice");
  define_filter("interior_stone");
  set_filter_type("interior_stone", 0, "highshelf");
  set_filter_freq("interior_stone", 0, 3500);
  set_filter_gain("interior_stone", 0, -6);
  set_filter_q("interior_stone", 0, 1);
  add_channel_to_filter("interior_stone", "ambient");
  add_channel_to_filter("interior_stone", "element");
  add_channel_to_filter("interior_stone", "vehicle");
  add_channel_to_filter("interior_stone", "weapon");
  add_channel_to_filter("interior_stone", "voice");
  define_filter("interior_vehicle");
  set_filter_type("interior_vehicle", 0, "highshelf");
  set_filter_freq("interior_vehicle", 0, 2700);
  set_filter_gain("interior_vehicle", 0, -12);
  set_filter_q("interior_vehicle", 0, 1);
  add_channel_to_filter("interior_vehicle", "ambient");
  add_channel_to_filter("interior_vehicle", "auto");
  add_channel_to_filter("interior_vehicle", "auto2");
  add_channel_to_filter("interior_vehicle", "autodog");
  add_channel_to_filter("interior_vehicle", "body");
  add_channel_to_filter("interior_vehicle", "element");
  add_channel_to_filter("interior_vehicle", "vehicle");
  add_channel_to_filter("interior_vehicle", "weapon");
  add_channel_to_filter("interior_vehicle", "voice");
  define_filter("interior_wood");
  set_filter_type("interior_wood", 0, "highshelf");
  set_filter_freq("interior_wood", 0, 3500);
  set_filter_gain("interior_wood", 0, -6);
  set_filter_q("interior_wood", 0, 1);
  add_channel_to_filter("interior_wood", "ambient");
  add_channel_to_filter("interior_wood", "element");
  add_channel_to_filter("interior_wood", "vehicle");
  add_channel_to_filter("interior_wood", "weapon");
  add_channel_to_filter("interior_wood", "voice");
  define_filter("shanty");
  set_filter_type("shanty", 0, "highshelf");
  set_filter_freq("shanty", 0, 3500);
  set_filter_gain("shanty", 0, -2);
  set_filter_q("shanty", 0, 1);
  add_channel_to_filter("shanty", "ambient");
  add_channel_to_filter("shanty", "element");
  add_channel_to_filter("shanty", "vehicle");
  add_channel_to_filter("shanty", "weapon");
  add_channel_to_filter("shanty", "voice");
  define_filter("pipe");
  set_filter_type("pipe", 0, "highshelf");
  set_filter_freq("pipe", 0, 3500);
  set_filter_gain("pipe", 0, -6);
  set_filter_q("pipe", 0, 1);
  add_channel_to_filter("pipe", "ambient");
  add_channel_to_filter("pipe", "element");
  add_channel_to_filter("pipe", "vehicle");
  add_channel_to_filter("pipe", "weapon");
  add_channel_to_filter("pipe", "voice");
  define_filter("tunnel");
  set_filter_type("tunnel", 0, "highshelf");
  set_filter_freq("tunnel", 0, 3500);
  set_filter_gain("tunnel", 0, -2);
  set_filter_q("tunnel", 0, 1);
  add_channel_to_filter("tunnel", "ambient");
  add_channel_to_filter("tunnel", "element");
  add_channel_to_filter("tunnel", "vehicle");
  add_channel_to_filter("tunnel", "weapon");
  add_channel_to_filter("tunnel", "voice");
  define_filter("underpass");
  set_filter_type("underpass", 0, "highshelf");
  set_filter_freq("underpass", 0, 3500);
  set_filter_gain("underpass", 0, -2);
  set_filter_q("underpass", 0, 1);
  add_channel_to_filter("underpass", "ambient");
  add_channel_to_filter("underpass", "element");
  add_channel_to_filter("underpass", "vehicle");
  add_channel_to_filter("underpass", "weapon");
  add_channel_to_filter("underpass", "voice");
  define_filter("sound_fadeout");
  set_filter_type("sound_fadeout", 0, "lowpass");
  set_filter_freq("sound_fadeout", 0, 0);
  set_filter_gain("sound_fadeout", 0, 0);
  set_filter_q("sound_fadeout", 0, 1);
  add_all_channels_to_filter("sound_fadeout");
  define_filter("fadeout_noncritical");
  set_filter_type("fadeout_noncritical", 0, "lowpass");
  set_filter_freq("fadeout_noncritical", 0, 0);
  set_filter_gain("fadeout_noncritical", 0, 0);
  set_filter_q("fadeout_noncritical", 0, 1);
  add_all_channels_but_music_and_mission("fadeout_noncritical");
  define_filter("fadeall_but_music");
  set_filter_type("fadeall_but_music", 0, "lowpass");
  set_filter_freq("fadeall_but_music", 0, 0);
  set_filter_gain("fadeall_but_music", 0, 0);
  set_filter_q("fadeall_but_music", 0, 1);
  add_all_channels_but_music("fadeall_but_music");
}

old_iw4_eq() {
  switch (level.script) {
    case "co_hunted":
    case "estate":
      define_reverb("estate_ext0");
      set_reverb_roomtype("estate_ext0", "mountains");
      set_reverb_drylevel("estate_ext0", 0.8);
      set_reverb_wetlevel("estate_ext0", 0.4);
      set_reverb_fadetime("estate_ext0", 2);
      set_reverb_priority("estate_ext0", "snd_enveffectsprio_level");
      define_reverb("ac130");
      set_reverb_roomtype("ac130", "sewerpipe");
      set_reverb_drylevel("ac130", 0.9);
      set_reverb_wetlevel("ac130", 0.05);
      set_reverb_fadetime("ac130", 2);
      set_reverb_priority("ac130", "snd_enveffectsprio_level");
      break;
    case "af_caves":
      define_reverb("af_caves_ext");
      set_reverb_roomtype("af_caves_ext", "mountains");
      set_reverb_drylevel("af_caves_ext", 0.8);
      set_reverb_wetlevel("af_caves_ext", 0.4);
      set_reverb_fadetime("af_caves_ext", 2);
      set_reverb_priority("af_caves_ext", "snd_enveffectsprio_level");
      define_reverb("af_caves_int");
      set_reverb_roomtype("af_caves_int", "cave");
      set_reverb_drylevel("af_caves_int", 0.85);
      set_reverb_wetlevel("af_caves_int", 0.3);
      set_reverb_fadetime("af_caves_int", 6);
      set_reverb_priority("af_caves_int", "snd_enveffectsprio_level");
    case "af_chase":
      define_reverb("af_chase_caves");
      set_reverb_roomtype("af_chase_caves", "cave");
      set_reverb_drylevel("af_chase_caves", 0.85);
      set_reverb_wetlevel("af_chase_caves", 0.35);
      set_reverb_fadetime("af_chase_caves", 6);
      set_reverb_priority("af_chase_caves", "snd_enveffectsprio_level");
      define_reverb("af_chase_exit");
      set_reverb_roomtype("af_chase_exit", "mountains");
      set_reverb_drylevel("af_chase_exit", 0.95);
      set_reverb_wetlevel("af_chase_exit", 0.2);
      set_reverb_fadetime("af_chase_exit", 2);
      set_reverb_priority("af_chase_exit", "snd_enveffectsprio_level");
      define_reverb("af_chase_rapids");
      set_reverb_roomtype("af_chase_rapids", "mountains");
      set_reverb_drylevel("af_chase_rapids", 0.95);
      set_reverb_wetlevel("af_chase_rapids", 0.2);
      set_reverb_fadetime("af_chase_rapids", 2);
      set_reverb_priority("af_chase_rapids", "snd_enveffectsprio_level");
      define_reverb("af_chase_river");
      set_reverb_roomtype("af_chase_river", "mountains");
      set_reverb_drylevel("af_chase_river", 0.95);
      set_reverb_wetlevel("af_chase_river", 0.2);
      set_reverb_fadetime("af_chase_river", 2);
      set_reverb_priority("af_chase_river", "snd_enveffectsprio_level");
      define_reverb("af_chase_ext");
      set_reverb_roomtype("af_chase_ext", "mountains");
      set_reverb_drylevel("af_chase_ext", 0.95);
      set_reverb_wetlevel("af_chase_ext", 0.2);
      set_reverb_fadetime("af_chase_ext", 2);
      set_reverb_priority("af_chase_ext", "snd_enveffectsprio_level");
      break;
    case "airport":
      define_reverb("airport_basement0");
      set_reverb_roomtype("airport_basement0", "stoneroom");
      set_reverb_drylevel("airport_basement0", 0.8);
      set_reverb_wetlevel("airport_basement0", 0.4);
      set_reverb_fadetime("airport_basement0", 2);
      set_reverb_priority("airport_basement0", "snd_enveffectsprio_level");
      define_reverb("airport_ext0");
      set_reverb_roomtype("airport_ext0", "city");
      set_reverb_drylevel("airport_ext0", 0.9);
      set_reverb_wetlevel("airport_ext0", 0.15);
      set_reverb_fadetime("airport_ext0", 2);
      set_reverb_priority("airport_ext0", "snd_enveffectsprio_level");
      define_reverb("airport_terminal0");
      set_reverb_roomtype("airport_terminal0", "stonecorridor");
      set_reverb_drylevel("airport_terminal0", 0.9);
      set_reverb_wetlevel("airport_terminal0", 0.09);
      set_reverb_fadetime("airport_terminal0", 0.9);
      set_reverb_priority("airport_terminal0", "snd_enveffectsprio_level");
      break;
    case "arcadia":
      define_reverb("arcadia_ext1");
      set_reverb_roomtype("arcadia_ext1", "parkinglot");
      set_reverb_drylevel("arcadia_ext1", 0.95);
      set_reverb_wetlevel("arcadia_ext1", 0.2);
      set_reverb_fadetime("arcadia_ext1", 3);
      set_reverb_priority("arcadia_ext1", "snd_enveffectsprio_level");
      define_reverb("arcadia_ext3");
      set_reverb_roomtype("arcadia_ext3", "parkinglot");
      set_reverb_drylevel("arcadia_ext3", 0.95);
      set_reverb_wetlevel("arcadia_ext3", 0.2);
      set_reverb_fadetime("arcadia_ext3", 3);
      set_reverb_priority("arcadia_ext3", "snd_enveffectsprio_level");
      break;
    case "boneyard":
      define_reverb("boneyard_ext0");
      set_reverb_roomtype("boneyard_ext0", "mountains");
      set_reverb_drylevel("boneyard_ext0", 0.8);
      set_reverb_wetlevel("boneyard_ext0", 0.3);
      set_reverb_fadetime("boneyard_ext0", 2);
      set_reverb_priority("boneyard_ext0", "snd_enveffectsprio_level");
      define_reverb("bridge_ext0");
      set_reverb_roomtype("bridge_ext0", "city");
      set_reverb_drylevel("bridge_ext0", 0.9);
      set_reverb_wetlevel("bridge_ext0", 0.15);
      set_reverb_fadetime("bridge_ext0", 6);
      set_reverb_priority("bridge_ext0", "snd_enveffectsprio_level");
      break;
    case "dcburning":
      define_reverb("dcburning_bunker1");
      set_reverb_roomtype("dcburning_bunker1", "stoneroom");
      set_reverb_drylevel("dcburning_bunker1", 0.8);
      set_reverb_wetlevel("dcburning_bunker1", 0.35);
      set_reverb_fadetime("dcburning_bunker1", 6);
      set_reverb_priority("dcburning_bunker1", "snd_enveffectsprio_level");
      define_reverb("dcburning_ext1");
      set_reverb_roomtype("dcburning_ext1", "city");
      set_reverb_drylevel("dcburning_ext1", 0.95);
      set_reverb_wetlevel("dcburning_ext1", 0.15);
      set_reverb_fadetime("dcburning_ext1", 6);
      set_reverb_priority("dcburning_ext1", "snd_enveffectsprio_level");
      define_reverb("dcburning_building1");
      set_reverb_roomtype("dcburning_building1", "city");
      set_reverb_drylevel("dcburning_building1", 0.85);
      set_reverb_wetlevel("dcburning_building1", 0.25);
      set_reverb_fadetime("dcburning_building1", 6);
      set_reverb_priority("dcburning_building1", "snd_enveffectsprio_level");
      break;
    case "dc_whitehouse":
    case "dcemp":
      define_reverb("dcemp_iss");
      set_reverb_roomtype("dcemp_iss", "city");
      set_reverb_drylevel("dcemp_iss", 0.9);
      set_reverb_wetlevel("dcemp_iss", 0.15);
      set_reverb_fadetime("dcemp_iss", 6);
      set_reverb_priority("dcemp_iss", "snd_enveffectsprio_level");
      define_reverb("dcemp_dry");
      set_reverb_roomtype("dcemp_dry", "stonecorridor");
      set_reverb_drylevel("dcemp_dry", 0.95);
      set_reverb_wetlevel("dcemp_dry", 0.15);
      set_reverb_fadetime("dcemp_dry", 2);
      set_reverb_priority("dcemp_dry", "snd_enveffectsprio_level");
      define_reverb("dcemp_dry_int");
      set_reverb_roomtype("dcemp_dry_int", "carpetedhallway");
      set_reverb_drylevel("dcemp_dry_int", 0.9);
      set_reverb_wetlevel("dcemp_dry_int", 0.25);
      set_reverb_fadetime("dcemp_dry_int", 3);
      set_reverb_priority("dcemp_dry_int", "snd_enveffectsprio_level");
      define_reverb("dcemp_light_rain");
      set_reverb_roomtype("dcemp_light_rain", "stonecorridor");
      set_reverb_drylevel("dcemp_light_rain", 0.9);
      set_reverb_wetlevel("dcemp_light_rain", 0.15);
      set_reverb_fadetime("dcemp_light_rain", 2);
      set_reverb_priority("dcemp_light_rain", "snd_enveffectsprio_level");
      define_reverb("dcemp_light_rain_int");
      set_reverb_roomtype("dcemp_light_rain_int", "carpetedhallway");
      set_reverb_drylevel("dcemp_light_rain_int", 0.9);
      set_reverb_wetlevel("dcemp_light_rain_int", 0.25);
      set_reverb_fadetime("dcemp_light_rain_int", 6);
      set_reverb_priority("dcemp_light_rain_int", "snd_enveffectsprio_level");
      define_reverb("dcemp_heavy_rain");
      set_reverb_roomtype("dcemp_heavy_rain", "city");
      set_reverb_drylevel("dcemp_heavy_rain", 0.9);
      set_reverb_wetlevel("dcemp_heavy_rain", 0.15);
      set_reverb_fadetime("dcemp_heavy_rain", 6);
      set_reverb_priority("dcemp_heavy_rain", "snd_enveffectsprio_level");
      define_reverb("dcemp_heavy_rain_int");
      set_reverb_roomtype("dcemp_heavy_rain_int", "carpetedhallway");
      set_reverb_drylevel("dcemp_heavy_rain_int", 0.9);
      set_reverb_wetlevel("dcemp_heavy_rain_int", 0.25);
      set_reverb_fadetime("dcemp_heavy_rain_int", 6);
      set_reverb_priority("dcemp_heavy_rain_int", "snd_enveffectsprio_level");
      define_reverb("dcemp_heavy_rain_tunnel");
      set_reverb_roomtype("dcemp_heavy_rain_tunnel", "cave");
      set_reverb_drylevel("dcemp_heavy_rain_tunnel", 0.8);
      set_reverb_wetlevel("dcemp_heavy_rain_tunnel", 0.3);
      set_reverb_fadetime("dcemp_heavy_rain_tunnel", 6);
      set_reverb_priority("dcemp_heavy_rain_tunnel", "snd_enveffectsprio_level");
      break;
    case "roadkill":
    case "trainer":
      define_reverb("exterior_level2");
      set_reverb_roomtype("exterior_level2", "city");
      set_reverb_drylevel("exterior_level2", 0.95);
      set_reverb_wetlevel("exterior_level2", 0.15);
      set_reverb_fadetime("exterior_level2", 2);
      set_reverb_priority("exterior_level2", "snd_enveffectsprio_level");
      break;
    case "favela":
      define_reverb("favela_ext0");
      set_reverb_roomtype("favela_ext0", "city");
      set_reverb_drylevel("favela_ext0", 0.9);
      set_reverb_wetlevel("favela_ext0", 0.15);
      set_reverb_fadetime("favela_ext0", 6);
      set_reverb_priority("favela_ext0", "snd_enveffectsprio_level");
      define_reverb("favela_int0");
      set_reverb_roomtype("favela_int0", "livingroom");
      set_reverb_drylevel("favela_int0", 0.9);
      set_reverb_wetlevel("favela_int0", 0.1);
      set_reverb_fadetime("favela_int0", 2);
      set_reverb_priority("favela_int0", "snd_enveffectsprio_level");
      define_reverb("favela_int_shanty0");
      set_reverb_roomtype("favela_int_shanty0", "livingroom");
      set_reverb_drylevel("favela_int_shanty0", 0.9);
      set_reverb_wetlevel("favela_int_shanty0", 0.1);
      set_reverb_fadetime("favela_int_shanty0", 2);
      set_reverb_priority("favela_int_shanty0", "snd_enveffectsprio_level");
      break;
    case "favela_escape":
      define_reverb("favela_escape_ext0");
      set_reverb_roomtype("favela_escape_ext0", "city");
      set_reverb_drylevel("favela_escape_ext0", 0.9);
      set_reverb_wetlevel("favela_escape_ext0", 0.15);
      set_reverb_fadetime("favela_escape_ext0", 6);
      set_reverb_priority("favela_escape_ext0", "snd_enveffectsprio_level");
      break;
    case "so_showers_gulag":
    case "gulag":
      define_reverb("ambient_gulag_ext0");
      set_reverb_roomtype("ambient_gulag_ext0", "city");
      set_reverb_drylevel("ambient_gulag_ext0", 0.95);
      set_reverb_wetlevel("ambient_gulag_ext0", 0.15);
      set_reverb_fadetime("ambient_gulag_ext0", 2);
      set_reverb_priority("ambient_gulag_ext0", "snd_enveffectsprio_level");
      define_reverb("gulag_hall_int0");
      set_reverb_roomtype("gulag_hall_int0", "sewerpipe");
      set_reverb_drylevel("gulag_hall_int0", 0.95);
      set_reverb_wetlevel("gulag_hall_int0", 0.15);
      set_reverb_fadetime("gulag_hall_int0", 2);
      set_reverb_priority("gulag_hall_int0", "snd_enveffectsprio_level");
      define_reverb("gulag_shower_int0");
      set_reverb_roomtype("gulag_shower_int0", "bathroom");
      set_reverb_drylevel("gulag_shower_int0", 0.9);
      set_reverb_wetlevel("gulag_shower_int0", 0.2);
      set_reverb_fadetime("gulag_shower_int0", 2);
      set_reverb_priority("gulag_shower_int0", "snd_enveffectsprio_level");
      define_reverb("gulag_exit");
      set_reverb_roomtype("gulag_exit", "sewerpipe");
      set_reverb_drylevel("gulag_exit", 0.95);
      set_reverb_wetlevel("gulag_exit", 0.15);
      set_reverb_fadetime("gulag_exit", 2);
      set_reverb_priority("gulag_exit", "snd_enveffectsprio_level");
      break;
    case "oilrig":
      define_reverb("amb_underwater_test1v1");
      set_reverb_roomtype("amb_underwater_test1v1", "underwater");
      set_reverb_drylevel("amb_underwater_test1v1", 0.5);
      set_reverb_wetlevel("amb_underwater_test1v1", 0.6);
      set_reverb_fadetime("amb_underwater_test1v1", 2);
      set_reverb_priority("amb_underwater_test1v1", "snd_enveffectsprio_level");
      define_reverb("ambient_oilrig_test_ext1");
      set_reverb_roomtype("ambient_oilrig_test_ext1", "city");
      set_reverb_drylevel("ambient_oilrig_test_ext1", 0.9);
      set_reverb_wetlevel("ambient_oilrig_test_ext1", 0.15);
      set_reverb_fadetime("ambient_oilrig_test_ext1", 6);
      set_reverb_priority("ambient_oilrig_test_ext1", "snd_enveffectsprio_level");
      define_reverb("ambient_oilrig_int1");
      set_reverb_roomtype("ambient_oilrig_int1", "city");
      set_reverb_drylevel("ambient_oilrig_int1", 0.9);
      set_reverb_wetlevel("ambient_oilrig_int1", 0.15);
      set_reverb_fadetime("ambient_oilrig_int1", 6);
      set_reverb_priority("ambient_oilrig_int1", "snd_enveffectsprio_level");
      break;
    case "cliffhanger":
      define_reverb("snow_base_white");
      set_reverb_roomtype("snow_base_white", "mountains");
      set_reverb_drylevel("snow_base_white", 0.8);
      set_reverb_wetlevel("snow_base_white", 0.3);
      set_reverb_fadetime("snow_base_white", 5);
      set_reverb_priority("snow_base_white", "snd_enveffectsprio_level");
      break;
  }
}

old_iw4_filters() {
  switch (level.script) {
    case "ac130":
      define_filter("ac130");
      set_filter_type("ac130", 0, "highshelf");
      set_filter_freq("ac130", 0, 2800);
      set_filter_gain("ac130", 0, -12);
      set_filter_q("ac130", 0, 1);
      set_filter_type("ac130", 1, "lowshelf");
      set_filter_freq("ac130", 1, 1000);
      set_filter_gain("ac130", 1, -6);
      set_filter_q("ac130", 1, 1);
      add_channel_to_filter("ac130", "auto");
      add_channel_to_filter("ac130", "auto2");
      add_channel_to_filter("ac130", "effects2");
      add_channel_to_filter("ac130", "vehicle");
      add_channel_to_filter("ac130", "weapon");
      break;
    case "af_caves":
      define_filter("af_caves_int");
      set_filter_type("af_caves_int", 0, "highshelf");
      set_filter_freq("af_caves_int", 0, 5500);
      set_filter_gain("af_caves_int", 0, -12);
      set_filter_q("af_caves_int", 0, 1);
      add_channel_to_filter("af_caves_int", "ambient");
      add_channel_to_filter("af_caves_int", "element");
      add_channel_to_filter("af_caves_int", "vehicle");
      add_channel_to_filter("af_caves_int", "weapon");
      add_channel_to_filter("af_caves_int", "voice");
      break;
    case "airport":
      define_filter("airport_basement0");
      set_filter_type("airport_basement0", 0, "highshelf");
      set_filter_freq("airport_basement0", 0, 7500);
      set_filter_gain("airport_basement0", 0, -12);
      set_filter_q("airport_basement0", 0, 1);
      add_channel_to_filter("airport_basement0", "ambient");
      add_channel_to_filter("airport_basement0", "element");
      add_channel_to_filter("airport_basement0", "vehicle");
      add_channel_to_filter("airport_basement0", "weapon");
      add_channel_to_filter("airport_basement0", "voice");
      define_filter("airport_terminal0");
      set_filter_type("airport_terminal0", 0, "highshelf");
      set_filter_freq("airport_terminal0", 0, 7500);
      set_filter_gain("airport_terminal0", 0, -8);
      set_filter_q("airport_terminal0", 0, 1);
      add_channel_to_filter("airport_terminal0", "ambient");
      add_channel_to_filter("airport_terminal0", "element");
      add_channel_to_filter("airport_terminal0", "vehicle");
      add_channel_to_filter("aairport_terminal0", "weapon");
      add_channel_to_filter("airport_terminal0", "voice");
      break;
    case "dc_whitehouse":
    case "dcemp":
      define_filter("dcemp_dry_int");
      set_filter_type("dcemp_dry_int", 0, "highshelf");
      set_filter_freq("dcemp_dry_int", 0, 6500);
      set_filter_gain("dcemp_dry_int", 0, -15);
      set_filter_q("dcemp_dry_int", 0, 1);
      add_channel_to_filter("dcemp_dry_int", "ambient");
      add_channel_to_filter("dcemp_dry_int", "element");
      add_channel_to_filter("dcemp_dry_int", "vehicle");
      add_channel_to_filter("dcemp_dry_int", "voice");
      define_filter("dcemp_light_rain_int");
      set_filter_type("dcemp_light_rain_int", 0, "highshelf");
      set_filter_freq("dcemp_light_rain_int", 0, 5200);
      set_filter_gain("dcemp_light_rain_int", 0, -21);
      set_filter_q("dcemp_light_rain_int", 0, 1);
      add_channel_to_filter("dcemp_light_rain_int", "ambient");
      add_channel_to_filter("dcemp_light_rain_int", "element");
      add_channel_to_filter("dcemp_light_rain_int", "vehicle");
      add_channel_to_filter("dcemp_light_rain_int", "voice");
      define_filter("dcemp_heavy_rain_int");
      set_filter_type("dcemp_heavy_rain_int", 0, "highshelf");
      set_filter_freq("dcemp_heavy_rain_int", 0, 4800);
      set_filter_gain("dcemp_heavy_rain_int", 0, -21);
      set_filter_q("dcemp_heavy_rain_int", 0, 1);
      set_filter_type("dcemp_heavy_rain_int", 1, "lowshelf");
      set_filter_freq("dcemp_heavy_rain_int", 1, 80);
      set_filter_gain("dcemp_heavy_rain_int", 1, -6);
      set_filter_q("dcemp_heavy_rain_int", 1, 1);
      add_channel_to_filter("dcemp_heavy_rain_int", "ambient");
      add_channel_to_filter("dcemp_heavy_rain_int", "element");
      add_channel_to_filter("dcemp_heavy_rain_int", "vehicle");
      add_channel_to_filter("dcemp_heavy_rain_int", "weapon");
      add_channel_to_filter("dcemp_heavy_rain_int", "voice");
      define_filter("dcemp_heavy_rain_tunnel");
      set_filter_type("dcemp_heavy_rain_tunnel", 0, "highshelf");
      set_filter_freq("dcemp_heavy_rain_tunnel", 0, 3500);
      set_filter_gain("dcemp_heavy_rain_tunnel", 0, -21);
      set_filter_q("dcemp_heavy_rain_tunnel", 0, 1);
      set_filter_type("dcemp_heavy_rain_tunnel", 1, "lowshelf");
      set_filter_freq("dcemp_heavy_rain_tunnel", 1, 110);
      set_filter_gain("dcemp_heavy_rain_tunnel", 1, -6);
      set_filter_q("dcemp_heavy_rain_tunnel", 1, 1);
      add_channel_to_filter("dcemp_heavy_rain_tunnel", "ambient");
      add_channel_to_filter("dcemp_heavy_rain_tunnel", "element");
      add_channel_to_filter("dcemp_heavy_rain_tunnel", "vehicle");
      add_channel_to_filter("dcemp_heavy_rain_tunnel", "weapon");
      add_channel_to_filter("dcemp_heavy_rain_tunnel", "voice");
      break;
    case "favela":
      define_filter("favela_int0");
      set_filter_type("favela_int0", 0, "highshelf");
      set_filter_freq("favela_int0", 0, 3500);
      set_filter_gain("favela_int0", 0, -10);
      set_filter_q("favela_int0", 0, 1);
      add_channel_to_filter("favela_int0", "ambient");
      add_channel_to_filter("favela_int0", "element");
      add_channel_to_filter("favela_int0", "auto");
      add_channel_to_filter("favela_int0", "auto2");
      add_channel_to_filter("favela_int0", "vehicle");
      add_channel_to_filter("favela_int0", "weapon");
      add_channel_to_filter("favela_int0", "voice");
      define_filter("favela_int_shanty0");
      set_filter_type("favela_int_shanty0", 0, "highshelf");
      set_filter_freq("favela_int_shanty0", 0, 3500);
      set_filter_gain("favela_int_shanty0", 0, -10);
      set_filter_q("favela_int_shanty0", 0, 1);
      add_channel_to_filter("favela_int_shanty0", "ambient");
      add_channel_to_filter("favela_int_shanty0", "element");
      add_channel_to_filter("favela_int_shanty0", "auto");
      add_channel_to_filter("favela_int_shanty0", "auto2");
      add_channel_to_filter("favela_int_shanty0", "vehicle");
      add_channel_to_filter("favela_int_shanty0", "weapon");
      add_channel_to_filter("favela_int_shanty0", "voice");
      break;
    case "so_showers_gulag":
    case "gulag":
      define_filter("gulag_hall_int0");
      set_filter_type("gulag_hall_int0", 0, "highshelf");
      set_filter_freq("gulag_hall_int0", 0, 7500);
      set_filter_gain("gulag_hall_int0", 0, -12);
      set_filter_q("gulag_hall_int0", 0, 1);
      add_channel_to_filter("gulag_hall_int0", "ambient");
      add_channel_to_filter("gulag_hall_int0", "element");
      add_channel_to_filter("gulag_hall_int0", "vehicle");
      add_channel_to_filter("gulag_hall_int0", "weapon");
      add_channel_to_filter("gulag_hall_int0", "voice");
      define_filter("gulag_shower_int0");
      set_filter_type("gulag_shower_int0", 0, "highshelf");
      set_filter_freq("gulag_shower_int0", 0, 8500);
      set_filter_gain("gulag_shower_int0", 0, -8);
      set_filter_q("gulag_shower_int0", 0, 1);
      add_channel_to_filter("gulag_shower_int0", "ambient");
      add_channel_to_filter("gulag_shower_int0", "element");
      add_channel_to_filter("gulag_shower_int0", "vehicle");
      add_channel_to_filter("gulag_shower_int0", "weapon");
      add_channel_to_filter("gulag_shower_int0", "voice");
      define_filter("gulag_exit");
      set_filter_type("gulag_exit", 0, "highshelf");
      set_filter_freq("gulag_exit", 0, 7500);
      set_filter_gain("gulag_exit", 0, -12);
      set_filter_q("gulag_exit", 0, 1);
      add_channel_to_filter("gulag_exit", "ambient");
      add_channel_to_filter("gulag_exit", "element");
      add_channel_to_filter("gulag_exit", "vehicle");
      add_channel_to_filter("gulag_exit", "weapon");
      add_channel_to_filter("gulag_exit", "voice");
      define_filter("gulag_cavein");
      set_filter_type("gulag_cavein", 0, "highshelf");
      set_filter_freq("gulag_cavein", 0, 1000);
      set_filter_gain("gulag_cavein", 0, -25);
      set_filter_q("gulag_cavein", 0, 1);
      set_filter_type("gulag_cavein", 1, "lowshelf");
      set_filter_freq("gulag_cavein", 1, 1200);
      set_filter_gain("gulag_cavein", 1, -4);
      set_filter_q("gulag_cavein", 1, 1);
      add_all_channels_to_filter("gulag_cavein");
      define_filter("gulag_ending_fadeout");
      set_filter_type("gulag_ending_fadeout", 0, "lowpass");
      set_filter_freq("gulag_ending_fadeout", 0, 0);
      set_filter_gain("gulag_ending_fadeout", 0, 0);
      set_filter_q("gulag_ending_fadeout", 0, 1);
      add_all_channels_to_filter("gulag_ending_fadeout");
      break;
    case "oilrig":
      define_filter("ambient_oilrig_int1");
      set_filter_type("ambient_oilrig_int1", 0, "highshelf");
      set_filter_freq("ambient_oilrig_int1", 0, 3500);
      set_filter_gain("ambient_oilrig_int1", 0, -10);
      set_filter_q("ambient_oilrig_int1", 0, 1);
      add_channel_to_filter("ambient_oilrig_int1", "ambient");
      add_channel_to_filter("ambient_oilrig_int1", "element");
      add_channel_to_filter("ambient_oilrig_int1", "auto");
      add_channel_to_filter("ambient_oilrig_int1", "auto2");
      add_channel_to_filter("ambient_oilrig_int1", "vehicle");
      add_channel_to_filter("ambient_oilrig_int1", "weapon");
      add_channel_to_filter("ambient_oilrig_int1", "voice");
      break;
  }

  if(maps\_utility::is_specialop()) {
    define_filter("specialop_fadeout");
    set_filter_type("specialop_fadeout", 0, "highshelf");
    set_filter_freq("specialop_fadeout", 0, 800);
    set_filter_gain("specialop_fadeout", 0, -25);
    set_filter_q("specialop_fadeout", 0, 1);
    set_filter_type("specialop_fadeout", 1, "lowshelf");
    set_filter_freq("specialop_fadeout", 1, 3000);
    set_filter_gain("specialop_fadeout", 1, -6);
    set_filter_q("specialop_fadeout", 1, 1);
    add_channel_to_filter("specialop_fadeout", "ambdist1");
    add_channel_to_filter("specialop_fadeout", "ambdist2");
    add_channel_to_filter("specialop_fadeout", "auto");
    add_channel_to_filter("specialop_fadeout", "auto2");
    add_channel_to_filter("specialop_fadeout", "auto2d");
    add_channel_to_filter("specialop_fadeout", "autodog");
    add_channel_to_filter("specialop_fadeout", "body");
    add_channel_to_filter("specialop_fadeout", "effects1");
    add_channel_to_filter("specialop_fadeout", "effects2");
    add_channel_to_filter("specialop_fadeout", "element");
    add_channel_to_filter("specialop_fadeout", "explosiveimpact");
    add_channel_to_filter("specialop_fadeout", "item");
    add_channel_to_filter("specialop_fadeout", "local");
    add_channel_to_filter("specialop_fadeout", "physics");
    add_channel_to_filter("specialop_fadeout", "reload");
    add_channel_to_filter("specialop_fadeout", "vehicle");
    add_channel_to_filter("specialop_fadeout", "vehiclelimited");
    add_channel_to_filter("specialop_fadeout", "voice");
    add_channel_to_filter("specialop_fadeout", "weapon");
  }
}

define_filter(var_0) {
  level.eq_defs[var_0] = [];
}

set_filter_type(var_0, var_1, var_2) {
  level.eq_defs[var_0]["type"][var_1] = var_2;
}

set_filter_freq(var_0, var_1, var_2) {
  level.eq_defs[var_0]["freq"][var_1] = var_2;
}

set_filter_gain(var_0, var_1, var_2) {
  level.eq_defs[var_0]["gain"][var_1] = var_2;
}

set_filter_q(var_0, var_1, var_2) {
  level.eq_defs[var_0]["q"][var_1] = var_2;
}

define_reverb(var_0) {
  level.ambient_reverb[var_0] = [];
}

set_reverb_roomtype(var_0, var_1) {
  level.ambient_reverb[var_0]["roomtype"] = var_1;
}

set_reverb_drylevel(var_0, var_1) {
  level.ambient_reverb[var_0]["drylevel"] = var_1;
}

set_reverb_wetlevel(var_0, var_1) {
  level.ambient_reverb[var_0]["wetlevel"] = var_1;
}

set_reverb_fadetime(var_0, var_1) {
  level.ambient_reverb[var_0]["fadetime"] = var_1;
}

set_reverb_priority(var_0, var_1) {
  level.ambient_reverb[var_0]["priority"] = var_1;
}

getfilter(var_0) {
  if(!isdefined(level.eq_defs))
    return undefined;

  if(!isdefined(level.eq_defs[var_0]))
    return undefined;

  return level.eq_defs[var_0];
}

add_channel_to_filter(var_0, var_1) {
  if(!isdefined(level.ambient_eq[var_0]))
    level.ambient_eq[var_0] = [];

  level.ambient_eq[var_0][var_1] = 1;
}

add_all_channels_to_filter(var_0) {
  if(!isdefined(level.ambient_eq[var_0]))
    level.ambient_eq[var_0] = [];

  var_1 = get_all_channels();

  foreach(var_4, var_3 in var_1)
  level.ambient_eq[var_0][var_4] = 1;
}

add_all_channels_but_music_and_mission(var_0) {
  if(!isdefined(level.ambient_eq[var_0]))
    level.ambient_eq[var_0] = [];

  var_1 = get_all_channels();
  var_1["music"] = undefined;
  var_1["mission"] = undefined;

  foreach(var_4, var_3 in var_1)
  level.ambient_eq[var_0][var_4] = 1;
}

add_all_channels_but_music(var_0) {
  if(!isdefined(level.ambient_eq[var_0]))
    level.ambient_eq[var_0] = [];

  var_1 = get_all_channels();
  var_1["music"] = undefined;

  foreach(var_4, var_3 in var_1)
  level.ambient_eq[var_0][var_4] = 1;
}

get_all_channels() {
  var_0 = [];
  var_0["announcer"] = 1;
  var_0["ambient"] = 1;
  var_0["ambdist1"] = 1;
  var_0["ambdist2"] = 1;
  var_0["auto"] = 1;
  var_0["auto2"] = 1;
  var_0["auto2d"] = 1;
  var_0["autodog"] = 1;
  var_0["body"] = 1;
  var_0["body2d"] = 1;
  var_0["bulletimpact"] = 1;
  var_0["bulletwhizbyin"] = 1;
  var_0["bulletwhizbyout"] = 1;
  var_0["effects1"] = 1;
  var_0["effects2"] = 1;
  var_0["element"] = 1;
  var_0["explosiveimpact"] = 1;
  var_0["hurt"] = 1;
  var_0["item"] = 1;
  var_0["local"] = 1;
  var_0["local2"] = 1;
  var_0["local3"] = 1;
  var_0["menu"] = 1;
  var_0["mission"] = 1;
  var_0["music"] = 1;
  var_0["nonshock"] = 1;
  var_0["player1"] = 1;
  var_0["player2"] = 1;
  var_0["physics"] = 1;
  var_0["reload"] = 1;
  var_0["reload2d"] = 1;
  var_0["vehicle"] = 1;
  var_0["vehiclelimited"] = 1;
  var_0["voice"] = 1;
  var_0["weapon"] = 1;
  return var_0;
}