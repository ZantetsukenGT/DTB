
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	g_acMoneyWarnings { playerid }	  = 0;
	g_acJetpackWarnings { playerid }  = 0;
	g_acFlyhackWarnings { playerid }  = 0;
	g_acNoReloadWarnings { playerid } = 0;
	g_acMessageWarnings { playerid }  = 0;
	g_acMessageString[playerid]		  = "";

	for (new slot; slot < 13; slot++)
	{
		g_acWeaponWarnings[playerid][slot] = 0;
		g_acWeaponSynced[playerid][slot]   = false;
	}
	return 1;
}
