/**********************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: maps\createart\mp_carentan_art.gsc
**********************************************/

main() {
  level.tweakfile = 1;

  if(isusinghdr())
    maps\createart\mp_carentan_fog_hdr::setupfog();
  else
    maps\createart\mp_carentan_fog_hdr::setupfog();

  visionsetnaked("mp_carentan", 0);
}