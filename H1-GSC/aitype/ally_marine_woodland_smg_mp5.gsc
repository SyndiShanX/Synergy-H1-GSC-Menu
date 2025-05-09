/***************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: aitype\ally_marine_woodland_smg_mp5.gsc
***************************************************/

main() {
  self.animtree = "";
  self.additionalassets = "";
  self.team = "allies";
  self.type = "human";
  self.subclass = "regular";
  self.accuracy = 0.2;
  self.health = 150;
  self.grenadeweapon = "fraggrenade";
  self.grenadeammo = 0;
  self.secondaryweapon = "usp";
  self.sidearm = "usp";

  if(isai(self)) {
    self setengagementmindist(256.0, 0.0);
    self setengagementmaxdist(768.0, 1024.0);
  }

  self.weapon = "mp5";

  switch (codescripts\character::get_random_character(3)) {
    case 0:
      character\character_sp_usmc_force_a::main();
      break;
    case 1:
      character\character_sp_usmc_force_b::main();
      break;
    case 2:
      character\character_sp_usmc_force_c::main();
      break;
  }
}

spawner() {
  self setspawnerteam("allies");
}

precache() {
  character\character_sp_usmc_force_a::precache();
  character\character_sp_usmc_force_b::precache();
  character\character_sp_usmc_force_c::precache();
  precacheitem("mp5");
  precacheitem("usp");
  precacheitem("usp");
  precacheitem("fraggrenade");
}