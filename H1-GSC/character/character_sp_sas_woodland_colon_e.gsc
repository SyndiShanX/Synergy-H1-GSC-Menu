// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_sas_woodland_colon" );
    self attach( "head_sp_sas_woodland_hugh", "", 1 );
    self.headmodel = "head_sp_sas_woodland_hugh";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_sas_woodland_colon" );
    precachemodel( "head_sp_sas_woodland_hugh" );
}
