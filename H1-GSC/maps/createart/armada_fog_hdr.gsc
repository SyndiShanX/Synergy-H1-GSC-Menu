/*********************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\armada_fog_hdr.gsc
*********************************************/

main() {
  sunflare();
  var_0 = maps\_utility::create_vision_set_fog("armada");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 4256.31;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 0.953, 0.901);
  var_0.atmosfoghazestrength = 0;
  var_0.atmosfoghazespread = 0.15765;
  var_0.atmosfogextinctionstrength = 0.841332;
  var_0.atmosfoginscatterstrength = 18.4;
  var_0.atmosfoghalfplanedistance = 13000;
  var_0.atmosfogstartdistance = 1473;
  var_0.atmosfogdistancescale = 4.05894;
  var_0.atmosfogskydistance = 237643;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = 90;
  var_0.atmosfogskyfalloffanglerange = 720;
  var_0.atmosfogsundirection = (0.813442, 0.299168, 0.498809);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -68.5601;
  var_0.atmosfogheightfoghalfplanedistance = 128.313;
  var_0 = maps\_utility::create_vision_set_fog("armada_transit");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 4256.31;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 0.953, 0.901);
  var_0.atmosfoghazestrength = 0;
  var_0.atmosfoghazespread = 0.15765;
  var_0.atmosfogextinctionstrength = 0.72;
  var_0.atmosfoginscatterstrength = 17.5;
  var_0.atmosfoghalfplanedistance = 13000;
  var_0.atmosfogstartdistance = 2030;
  var_0.atmosfogdistancescale = 4.05894;
  var_0.atmosfogskydistance = 237643;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = 90;
  var_0.atmosfogskyfalloffanglerange = 720;
  var_0.atmosfogsundirection = (0.813442, 0.299168, 0.498809);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -68.5601;
  var_0.atmosfogheightfoghalfplanedistance = 128.313;
  var_0 = maps\_utility::create_vision_set_fog("armada_interior_tvstation_out");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 4256.31;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 0.953, 0.901);
  var_0.atmosfoghazestrength = 0.345739;
  var_0.atmosfoghazespread = 0.15573;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 17.4946;
  var_0.atmosfoghalfplanedistance = 11460.3;
  var_0.atmosfogstartdistance = 1868.76;
  var_0.atmosfogdistancescale = 4.05894;
  var_0.atmosfogskydistance = 237643;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = 90;
  var_0.atmosfogskyfalloffanglerange = 720;
  var_0.atmosfogsundirection = (0.805439, 0.285804, 0.519214);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -88.1494;
  var_0.atmosfogheightfoghalfplanedistance = 69.5534;
  var_0 = maps\_utility::create_vision_set_fog("armada_ride");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 4256.31;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (0.999987, 0.927006, 0.856375);
  var_0.atmosfoghazestrength = 0.688899;
  var_0.atmosfoghazespread = 0.0828343;
  var_0.atmosfogextinctionstrength = 0.973384;
  var_0.atmosfoginscatterstrength = 17.1827;
  var_0.atmosfoghalfplanedistance = 10000;
  var_0.atmosfogstartdistance = 1500;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 100000;
  var_0.atmosfogskyangularfalloffenabled = 0;
  var_0.atmosfogskyfalloffstartangle = 0;
  var_0.atmosfogskyfalloffanglerange = 90.3422;
  var_0.atmosfogsundirection = (0.95055, 0.31006, 0.0178106);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 323.194;
  var_0.atmosfogheightfoghalfplanedistance = 884.942;
  var_0 = maps\_utility::create_vision_set_fog("armada_ride2");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 4256.31;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 0.9625, 0.9315);
  var_0.atmosfoghazestrength = 0.688899;
  var_0.atmosfoghazespread = 0.0828343;
  var_0.atmosfogextinctionstrength = 0.973384;
  var_0.atmosfoginscatterstrength = 17.1827;
  var_0.atmosfoghalfplanedistance = 10000;
  var_0.atmosfogstartdistance = 1500;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 100000;
  var_0.atmosfogskyangularfalloffenabled = 0;
  var_0.atmosfogskyfalloffstartangle = 0;
  var_0.atmosfogskyfalloffanglerange = 90.3422;
  var_0.atmosfogsundirection = (0.95055, 0.31006, 0.0178106);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 323.194;
  var_0.atmosfogheightfoghalfplanedistance = 884.942;
  var_0 = maps\_utility::create_vision_set_fog("armada_tvs");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 3716.29;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 1, 0.824817);
  var_0.atmosfoghazestrength = 1;
  var_0.atmosfoghazespread = 0.0605707;
  var_0.atmosfogextinctionstrength = 0.5;
  var_0.atmosfoginscatterstrength = 20.2155;
  var_0.atmosfoghalfplanedistance = 4572.89;
  var_0.atmosfogstartdistance = 797.259;
  var_0.atmosfogdistancescale = 0.39;
  var_0.atmosfogskydistance = 100367;
  var_0.atmosfogskyangularfalloffenabled = 0;
  var_0.atmosfogskyfalloffstartangle = 0;
  var_0.atmosfogskyfalloffanglerange = 90;
  var_0.atmosfogsundirection = (0.813442, 0.299168, 0.498809);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -57;
  var_0.atmosfogheightfoghalfplanedistance = 50;
  var_0 = maps\_utility::create_vision_set_fog("armada_hq");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 3716.29;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 1, 0.824817);
  var_0.atmosfoghazestrength = 1;
  var_0.atmosfoghazespread = 0.0605707;
  var_0.atmosfogextinctionstrength = 0.5;
  var_0.atmosfoginscatterstrength = 20.2155;
  var_0.atmosfoghalfplanedistance = 4572.89;
  var_0.atmosfogstartdistance = 797.259;
  var_0.atmosfogdistancescale = 0.39;
  var_0.atmosfogskydistance = 100367;
  var_0.atmosfogskyangularfalloffenabled = 0;
  var_0.atmosfogskyfalloffstartangle = 0;
  var_0.atmosfogskyfalloffanglerange = 90;
  var_0.atmosfogsundirection = (0.813442, 0.299168, 0.498809);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -57;
  var_0.atmosfogheightfoghalfplanedistance = 50;
  var_0 = maps\_utility::create_vision_set_fog("armada_HeliTransition");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 4256.31;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -4.54084;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 64.7624;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 0.953, 0.901);
  var_0.atmosfoghazestrength = 0;
  var_0.atmosfoghazespread = 0.15765;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 19;
  var_0.atmosfoghalfplanedistance = 10575;
  var_0.atmosfogstartdistance = 4540;
  var_0.atmosfogdistancescale = 4.05894;
  var_0.atmosfogskydistance = 237643;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = 90;
  var_0.atmosfogskyfalloffanglerange = 720;
  var_0.atmosfogsundirection = (0.813442, 0.299168, 0.498809);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -150;
  var_0.atmosfogheightfoghalfplanedistance = 375;
  var_0 = maps\_utility::create_vision_set_fog("armada_hq_exit");
  var_0.startdist = 4078.01;
  var_0.halfwaydist = 3716.29;
  var_0.red = 0.972628;
  var_0.green = 0.974733;
  var_0.blue = 1;
  var_0.hdrcolorintensity = 13.2163;
  var_0.maxopacity = 0.460993;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 1;
  var_0.sungreen = 0;
  var_0.sunblue = 0;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (1, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 180;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 1;
  var_0.skyfogminangle = 89.5213;
  var_0.skyfogmaxangle = 89.5213;
  var_0.heightfogenabled = 1;
  var_0.heightfogbaseheight = 1737.59;
  var_0.heightfoghalfplanedistance = 249.202;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (1, 0.984048, 0.963269);
  var_0.atmosfoghazecolor = (1, 1, 0.824817);
  var_0.atmosfoghazestrength = 1;
  var_0.atmosfoghazespread = 0.0605707;
  var_0.atmosfogextinctionstrength = 0.5;
  var_0.atmosfoginscatterstrength = 20.2155;
  var_0.atmosfoghalfplanedistance = 4572.89;
  var_0.atmosfogstartdistance = 797.259;
  var_0.atmosfogdistancescale = 1.0382;
  var_0.atmosfogskydistance = 100367;
  var_0.atmosfogskyangularfalloffenabled = 0;
  var_0.atmosfogskyfalloffstartangle = 0;
  var_0.atmosfogskyfalloffanglerange = 90;
  var_0.atmosfogsundirection = (0.813442, 0.299168, 0.498809);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = -57;
  var_0.atmosfogheightfoghalfplanedistance = 50;
}

sunflare() {
  var_0 = maps\_utility::create_sunflare_setting("default");
  var_0.position = (-31.5782, 19.652, 0);
  maps\_art::sunflare_changes("default", 0);
}