/*****************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: character\character_sp_usmc_james_nod.gsc
*****************************************************/

main() {
  self setmodel("body_usmc_desert_assault_james");
  self attach("head_usmc_desert_support_ryan_nv", "", 1);
  self.headmodel = "head_usmc_desert_support_ryan_nv";
  self.voice = "american";
  self setclothtype("vestlight");
}

precache() {
  precachemodel("body_usmc_desert_assault_james");
  precachemodel("head_usmc_desert_support_ryan_nv");
}