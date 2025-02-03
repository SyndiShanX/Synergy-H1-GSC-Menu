/************************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: aitype\ally_pilot_velinda_desert.gsc
************************************************/

main() {
  self.animtree = "";
  self.additionalassets = "";
  self.team = "allies";
  self.type = "human";
  self.subclass = "regular";
  self.accuracy = 0.2;
  self.health = 149;
  self.grenadeweapon = "fraggrenade";
  self.grenadeammo = 0;
  self.secondaryweapon = "beretta";
  self.sidearm = "beretta";

  if(isai(self)) {
    self setengagementmindist(256.0, 0.0);
    self setengagementmaxdist(768.0, 1024.0);
  }

  self.weapon = "mp5";
  character\character_sp_pilot_velinda_desert::main();
}

spawner() {
  self setspawnerteam("allies");
}

precache() {
  character\character_sp_pilot_velinda_desert::precache();
  precacheitem("mp5");
  precacheitem("beretta");
  precacheitem("beretta");
  precacheitem("fraggrenade");
}