/**************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\village_assault_art.gsc
**************************************************/

main() {
  level.tweakfile = 1;
  level.player = getentarray("player", "classname")[0];

  if(isusinghdr())
    maps\createart\village_assault_fog_hdr::main();
  else
    maps\createart\village_assault_fog::main();
}