/************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: character\character_sp_usmc_mark.gsc
************************************************/

main() {
  self setmodel("body_usmc_desert_assault_mark");
  self attach("head_usmc_marine_griggs", "", 1);
  self.headmodel = "head_usmc_marine_griggs";
  self.voice = "american";
  self setclothtype("vestlight");
}

precache() {
  precachemodel("body_usmc_desert_assault_mark");
  precachemodel("head_usmc_marine_griggs");
}