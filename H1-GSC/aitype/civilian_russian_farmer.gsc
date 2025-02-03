/**********************************************
 * Decompiled by Mjkzy
 * Edited by SyndiShanX
 * Script: aitype\civilian_russian_farmer.gsc
**********************************************/

main() {
  self.animtree = "";
  self.additionalassets = "";
  self.team = "allies";
  self.type = "human";
  self.subclass = "regular";
  self.accuracy = 0.2;
  self.health = 100;
  self.grenadeweapon = "fraggrenade";
  self.grenadeammo = 0;
  self.secondaryweapon = "beretta";
  self.sidearm = "colt45";

  if(isai(self)) {
    self setengagementmindist(256.0, 0.0);
    self setengagementmaxdist(768.0, 1024.0);
  }

  self.weapon = "ak47";
  character\character_sp_russian_farmer::main();
}

spawner() {
  self setspawnerteam("allies");
}

precache() {
  character\character_sp_russian_farmer::precache();
  precacheitem("ak47");
  precacheitem("beretta");
  precacheitem("colt45");
  precacheitem("fraggrenade");
}