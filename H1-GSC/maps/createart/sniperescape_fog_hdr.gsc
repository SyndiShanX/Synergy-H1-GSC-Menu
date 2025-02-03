/***************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\sniperescape_fog_hdr.gsc
***************************************************/

main() {
  sunflare();
  var_0 = maps\_utility::create_vision_set_fog("sniperescape");
  var_0.startdist = 0;
  var_0.halfwaydist = 5000;
  var_0.red = 0;
  var_0.green = 0;
  var_0.blue = 0;
  var_0.hdrcolorintensity = 1;
  var_0.maxopacity = 0;
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
  var_0.skyfogintensity = 0;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.505446, 0.505446, 0.505446);
  var_0.atmosfoghazecolor = (0.546875, 0.546875, 0.546875);
  var_0.atmosfoghazestrength = 0.5;
  var_0.atmosfoghazespread = 0.5;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 17.3299;
  var_0.atmosfoghalfplanedistance = 2997.63;
  var_0.atmosfogstartdistance = 2324.79;
  var_0.atmosfogdistancescale = 1.00042;
  var_0.atmosfogskydistance = 98304;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -1.36411;
  var_0.atmosfogskyfalloffanglerange = 37.2449;
  var_0.atmosfogsundirection = (-0.599104, 0.707538, 0.374786);
  var_0.atmosfogheightfogenabled = 0;
  var_0.atmosfogheightfogbaseheight = 357.422;
  var_0.atmosfogheightfoghalfplanedistance = 256.269;
  var_0 = maps\_utility::create_vision_set_fog("sniperescape_ferriswheel");
  var_0.startdist = 0;
  var_0.halfwaydist = 5000;
  var_0.red = 0;
  var_0.green = 0;
  var_0.blue = 0;
  var_0.hdrcolorintensity = 1;
  var_0.maxopacity = 0;
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
  var_0.skyfogintensity = 0;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.505446, 0.505446, 0.505446);
  var_0.atmosfoghazecolor = (0.546875, 0.546875, 0.546875);
  var_0.atmosfoghazestrength = 0.5;
  var_0.atmosfoghazespread = 0.5;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 17.3299;
  var_0.atmosfoghalfplanedistance = 2997.63;
  var_0.atmosfogstartdistance = 2324.79;
  var_0.atmosfogdistancescale = 1.00042;
  var_0.atmosfogskydistance = 98304;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -1.36411;
  var_0.atmosfogskyfalloffanglerange = 37.2449;
  var_0.atmosfogsundirection = (-0.599104, 0.707538, 0.374786);
  var_0.atmosfogheightfogenabled = 0;
  var_0.atmosfogheightfogbaseheight = 357.422;
  var_0.atmosfogheightfoghalfplanedistance = 256.269;
  var_0 = maps\_utility::create_vision_set_fog("sniperescape_scope");
  var_0.startdist = 0;
  var_0.halfwaydist = 5000;
  var_0.red = 0;
  var_0.green = 0;
  var_0.blue = 0;
  var_0.hdrcolorintensity = 1;
  var_0.maxopacity = 0;
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
  var_0.skyfogintensity = 0;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.411217, 0.453531, 0.474196);
  var_0.atmosfoghazecolor = (0.546875, 0.546875, 0.546875);
  var_0.atmosfoghazestrength = 0.101563;
  var_0.atmosfoghazespread = 0.0859375;
  var_0.atmosfogextinctionstrength = 0.585938;
  var_0.atmosfoginscatterstrength = 19.3299;
  var_0.atmosfoghalfplanedistance = 1566.48;
  var_0.atmosfogstartdistance = 5951.76;
  var_0.atmosfogdistancescale = 1;
  var_0.atmosfogskydistance = 81920;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = 5.31512;
  var_0.atmosfogskyfalloffanglerange = 88.761;
  var_0.atmosfogsundirection = (-0.599104, 0.707538, 0.374786);
  var_0.atmosfogheightfogenabled = 0;
  var_0.atmosfogheightfogbaseheight = 357.422;
  var_0.atmosfogheightfoghalfplanedistance = 256.269;
  var_0 = maps\_utility::create_vision_set_fog("sniperescape_interior");
  var_0.startdist = 0;
  var_0.halfwaydist = 5000;
  var_0.red = 0;
  var_0.green = 0;
  var_0.blue = 0;
  var_0.hdrcolorintensity = 1;
  var_0.maxopacity = 0;
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
  var_0.skyfogintensity = 0;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.505446, 0.505446, 0.505446);
  var_0.atmosfoghazecolor = (0.546875, 0.546875, 0.546875);
  var_0.atmosfoghazestrength = 0.5;
  var_0.atmosfoghazespread = 0.5;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 17.3299;
  var_0.atmosfoghalfplanedistance = 2997.63;
  var_0.atmosfogstartdistance = 2324.79;
  var_0.atmosfogdistancescale = 1.00042;
  var_0.atmosfogskydistance = 98304;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -1.36411;
  var_0.atmosfogskyfalloffanglerange = 37.2449;
  var_0.atmosfogsundirection = (-0.599104, 0.707538, 0.374786);
  var_0.atmosfogheightfogenabled = 0;
  var_0.atmosfogheightfogbaseheight = 357.422;
  var_0.atmosfogheightfoghalfplanedistance = 256.269;
  var_0 = maps\_utility::create_vision_set_fog("sniperescape_pool");
  var_0.startdist = 0;
  var_0.halfwaydist = 5000;
  var_0.red = 0;
  var_0.green = 0;
  var_0.blue = 0;
  var_0.hdrcolorintensity = 1;
  var_0.maxopacity = 0;
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
  var_0.skyfogintensity = 0;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.505446, 0.505446, 0.505446);
  var_0.atmosfoghazecolor = (0.546875, 0.546875, 0.546875);
  var_0.atmosfoghazestrength = 0.5;
  var_0.atmosfoghazespread = 0.5;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 17.3299;
  var_0.atmosfoghalfplanedistance = 2997.63;
  var_0.atmosfogstartdistance = 2324.79;
  var_0.atmosfogdistancescale = 1.00042;
  var_0.atmosfogskydistance = 98304;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -1.36411;
  var_0.atmosfogskyfalloffanglerange = 37.2449;
  var_0.atmosfogsundirection = (-0.599104, 0.707538, 0.374786);
  var_0.atmosfogheightfogenabled = 0;
  var_0.atmosfogheightfogbaseheight = 357.422;
  var_0.atmosfogheightfoghalfplanedistance = 256.269;
  var_0 = maps\_utility::create_vision_set_fog("sniperescape_hotel");
  var_0.startdist = 0;
  var_0.halfwaydist = 5000;
  var_0.red = 0;
  var_0.green = 0;
  var_0.blue = 0;
  var_0.hdrcolorintensity = 1;
  var_0.maxopacity = 0;
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
  var_0.skyfogintensity = 0;
  var_0.skyfogminangle = 0;
  var_0.skyfogmaxangle = 0;
  var_0.heightfogenabled = 0;
  var_0.heightfogbaseheight = 0;
  var_0.heightfoghalfplanedistance = 1000;
  var_0.atmosfogenabled = 1;
  var_0.atmosfogsunfogcolor = (0.851562, 0.93042, 1);
  var_0.atmosfoghazecolor = (0.5, 0.5, 0.5);
  var_0.atmosfoghazestrength = 0.0625;
  var_0.atmosfoghazespread = 0.0390625;
  var_0.atmosfogextinctionstrength = 1;
  var_0.atmosfoginscatterstrength = 17.5799;
  var_0.atmosfoghalfplanedistance = 8967.51;
  var_0.atmosfogstartdistance = 4110.6;
  var_0.atmosfogdistancescale = 0.5625;
  var_0.atmosfogskydistance = 72850;
  var_0.atmosfogskyangularfalloffenabled = 1;
  var_0.atmosfogskyfalloffstartangle = -0.947922;
  var_0.atmosfogskyfalloffanglerange = 24.0658;
  var_0.atmosfogsundirection = (-0.678183, 0.697714, 0.230787);
  var_0.atmosfogheightfogenabled = 0;
  var_0.atmosfogheightfogbaseheight = 357.422;
  var_0.atmosfogheightfoghalfplanedistance = 256.269;
}

sunflare() {
  var_0 = maps\_utility::create_sunflare_setting("default");
  var_0.position = (-21.4618, 129.498, 0);
  maps\_art::sunflare_changes("default", 0);
}