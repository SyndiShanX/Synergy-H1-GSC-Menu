/****************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\bog_a_art.gsc
****************************************/

main() {
  level.tweakfile = 1;
  level.player = getentarray("player", "classname")[0];

  if(isusinghdr())
    maps\createart\bog_a_fog_hdr::main();
  else
    maps\createart\bog_a_fog::main();
}