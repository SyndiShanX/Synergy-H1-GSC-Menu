/****************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: aitype\ally_sas_woodland_smg_mp5_mzs.gsc
****************************************************/

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
  self.secondaryweapon = "usp_silencer";
  self.sidearm = "usp_silencer";

  if(isai(self)) {
    self setengagementmindist(256.0, 0.0);
    self setengagementmaxdist(768.0, 1024.0);
  }

  self.weapon = "mp5_muzzle_small";

  switch (codescripts\character::get_random_character(5)) {
    case 0:
      character\character_sp_sas_woodland_mac::main();
      break;
    case 1:
      character\character_sp_sas_woodland_zied::main();
      break;
    case 2:
      character\character_sp_sas_woodland_peter::main();
      break;
    case 3:
      character\character_sp_sas_woodland_todd::main();
      break;
    case 4:
      character\character_sp_sas_woodland_hugh::main();
      break;
  }
}

spawner() {
  self setspawnerteam("allies");
}

precache() {
  character\character_sp_sas_woodland_mac::precache();
  character\character_sp_sas_woodland_zied::precache();
  character\character_sp_sas_woodland_peter::precache();
  character\character_sp_sas_woodland_todd::precache();
  character\character_sp_sas_woodland_hugh::precache();
  precacheitem("mp5_muzzle_small");
  precacheitem("usp_silencer");
  precacheitem("usp_silencer");
  precacheitem("fraggrenade");
}