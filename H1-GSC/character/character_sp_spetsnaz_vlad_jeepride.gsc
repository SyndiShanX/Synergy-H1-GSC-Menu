/*************************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: character\character_sp_spetsnaz_vlad_jeepride.gsc
*************************************************************/

main() {
  self setmodel("body_spetsnaz_assault_vlad_jeepride");
  self attach("head_spetsnaz_assault_vlad_facemask_jeepride", "", 1);
  self.headmodel = "head_spetsnaz_assault_vlad_facemask_jeepride";
  self.voice = "russian";
  self setclothtype("vestlight");
}

precache() {
  precachemodel("body_spetsnaz_assault_vlad_jeepride");
  precachemodel("head_spetsnaz_assault_vlad_facemask_jeepride");
}