
#include <YSI_Coding\y_hooks>

hook native ResetPlayerWeapons(playerid)
{
	for (new slot; slot < 13; slot++)
	{
		g_acWeaponData[playerid][slot][0]  = 0;
		g_acWeaponData[playerid][slot][1]  = 0;
		g_acWeaponWarnings[playerid][slot] = 0;
		g_acWeaponSynced[playerid][slot]   = false;
	}
	return continue(playerid);
}
