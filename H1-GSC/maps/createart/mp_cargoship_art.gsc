/***********************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\mp_cargoship_art.gsc
***********************************************/

main() {
  level.tweakfile = 1;

  if(isusinghdr())
    maps\createart\mp_cargoship_fog_hdr::main();
  else
    maps\createart\mp_cargoship_fog::main();

  visionsetnaked("mp_cargoship", 0);
}