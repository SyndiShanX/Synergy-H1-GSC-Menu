/**********************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\airlift_fog_hdr.gsc
**********************************************/

main() {
  sunflare();
  var_0 = maps\_utility::create_vision_set_fog("airlift");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.578337, 0.507404, 0.476874);
  var_0.atmosfoghazecolor = (0.773939, 0.326752, 0.0895501);
  var_0.atmosfoghazestrength = 0.125475;
  var_0.atmosfoghazespread = 0.0368574;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 14.0703;
  var_0.atmosfoghalfplanedistance = 3750;
  var_0.atmosfogstartdistance = 1000;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 150.16;
  var_0.atmosfogheightfoghalfplanedistance = 3746.79;
  var_0 = maps\_utility::create_vision_set_fog("airlift_cobra");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.578, 0.5, 0.47);
  var_0.atmosfoghazecolor = (0.742349, 0.281343, 0.0161221);
  var_0.atmosfoghazestrength = 0.146;
  var_0.atmosfoghazespread = 0.032;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 14.5;
  var_0.atmosfoghalfplanedistance = 3750;
  var_0.atmosfogstartdistance = 1000;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 150.16;
  var_0.atmosfogheightfoghalfplanedistance = 3746.79;
  var_0 = maps\_utility::create_vision_set_fog("airlift_intro");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.578337, 0.510883, 0.464725);
  var_0.atmosfoghazecolor = (0.588975, 0.248766, 0.0372107);
  var_0.atmosfoghazestrength = 0.161979;
  var_0.atmosfoghazespread = 0.026616;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 14.3356;
  var_0.atmosfoghalfplanedistance = 3750;
  var_0.atmosfogstartdistance = 1000;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 150.16;
  var_0.atmosfogheightfoghalfplanedistance = 3746.79;
  var_0 = maps\_utility::create_vision_set_fog("airlift_nuke");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.578337, 0.518097, 0.476874);
  var_0.atmosfoghazecolor = (0.588975, 0.22147, 0.0681485);
  var_0.atmosfoghazestrength = 0.807034;
  var_0.atmosfoghazespread = 0.026616;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 10.1103;
  var_0.atmosfoghalfplanedistance = 3750;
  var_0.atmosfogstartdistance = 1000;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.238191, 0.963719, 0.120461);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 150.16;
  var_0.atmosfogheightfoghalfplanedistance = 3746.79;
  var_0 = maps\_utility::create_vision_set_fog("airlift_nuke_flash");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.578337, 0.518097, 0.476874);
  var_0.atmosfoghazecolor = (0.588975, 0.22147, 0.0681485);
  var_0.atmosfoghazestrength = 0.125475;
  var_0.atmosfoghazespread = 0.026616;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 14.0703;
  var_0.atmosfoghalfplanedistance = 3750;
  var_0.atmosfogstartdistance = 1000;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.238191, 0.963719, 0.120461);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 150.16;
  var_0.atmosfogheightfoghalfplanedistance = 3746.79;
  var_0 = maps\_utility::create_vision_set_fog("airlift_nuke_wavehit");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.578337, 0.518097, 0.476874);
  var_0.atmosfoghazecolor = (0.588975, 0.22147, 0.0681485);
  var_0.atmosfoghazestrength = 0.125475;
  var_0.atmosfoghazespread = 0.026616;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 14.0703;
  var_0.atmosfoghalfplanedistance = 3750;
  var_0.atmosfogstartdistance = 1000;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.238191, 0.963719, 0.120461);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 150.16;
  var_0.atmosfogheightfoghalfplanedistance = 3746.79;
  var_0 = maps\_utility::create_vision_set_fog("airlift_streets");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.660603, 0.387731, 0.290519);
  var_0.atmosfoghazecolor = (0.572534, 0.329355, 0.183831);
  var_0.atmosfoghazestrength = 0.0722433;
  var_0.atmosfoghazespread = 0.0523852;
  var_0.atmosfogextinctionstrength = 0.975285;
  var_0.atmosfoginscatterstrength = 15.7681;
  var_0.atmosfoghalfplanedistance = 24525.6;
  var_0.atmosfogstartdistance = 152.091;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 0;
  var_0.atmosfogheightfoghalfplanedistance = 2130.06;
  var_0 = maps\_utility::create_vision_set_fog("airlift_streets_rescue");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.654739, 0.508507, 0.422351);
  var_0.atmosfoghazecolor = (0.635735, 0.330701, 0.204124);
  var_0.atmosfoghazestrength = 0.224054;
  var_0.atmosfoghazespread = 0.0698351;
  var_0.atmosfogextinctionstrength = 0.674905;
  var_0.atmosfoginscatterstrength = 15;
  var_0.atmosfoghalfplanedistance = 3500;
  var_0.atmosfogstartdistance = 150;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 0;
  var_0.atmosfogheightfoghalfplanedistance = 2130.06;
  var_0 = maps\_utility::create_vision_set_fog("airlift_rescue");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.654739, 0.508507, 0.422351);
  var_0.atmosfoghazecolor = (0.469052, 0.233517, 0.150605);
  var_0.atmosfoghazestrength = 0;
  var_0.atmosfoghazespread = 0.0523852;
  var_0.atmosfogextinctionstrength = 0.674905;
  var_0.atmosfoginscatterstrength = 13.7452;
  var_0.atmosfoghalfplanedistance = 3500;
  var_0.atmosfogstartdistance = 56.0836;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 0;
  var_0.atmosfogheightfoghalfplanedistance = 2130.06;
  var_0 = maps\_utility::create_vision_set_fog("airlift_interiors");
  var_0.startdist = 1813.95;
  var_0.halfwaydist = 1.4703;
  var_0.red = 1;
  var_0.green = 0.925269;
  var_0.blue = 0.847076;
  var_0.hdrcolorintensity = 12.2088;
  var_0.maxopacity = 0.703488;
  var_0.transitiontime = 0;
  var_0.sunfogenabled = 0;
  var_0.sunred = 0.5;
  var_0.sungreen = 0.5;
  var_0.sunblue = 0.5;
  var_0.hdrsuncolorintensity = -8;
  var_0.sundir = (0, 0, 0);
  var_0.sunbeginfadeangle = 0;
  var_0.sunendfadeangle = 1;
  var_0.normalfogscale = 1;
  var_0.skyfogintensity = 0.522093;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.534429, 0.654739, 0.583535);
  var_0.atmosfoghazecolor = (0.532882, 0.453978, 0.426203);
  var_0.atmosfoghazestrength = 0.0722433;
  var_0.atmosfoghazespread = 0.0523852;
  var_0.atmosfogextinctionstrength = 0.975285;
  var_0.atmosfoginscatterstrength = 13.4924;
  var_0.atmosfoghalfplanedistance = 24525.6;
  var_0.atmosfogstartdistance = 152.091;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 75175;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -10;
  var_0.atmosfogskyfalloffanglerange = 80;
  var_0.atmosfogsundirection = (0.516619, 0.851234, 0.0922248);
  var_0.atmosfogheightfogenabled = 1;
  var_0.atmosfogheightfogbaseheight = 0;
  var_0.atmosfogheightfoghalfplanedistance = 2130.06;
}

sunflare() {
  var_0 = maps\_utility::create_sunflare_setting("default");
  var_0.position = (-17.1551, 56.7753, 0);
  var_0 = maps\_utility::create_sunflare_setting("nuke");
  var_0.position = (-10.9, 79.785, 0);
  maps\_art::sunflare_changes("default", 0);
}