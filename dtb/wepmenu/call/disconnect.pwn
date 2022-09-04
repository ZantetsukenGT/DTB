
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	if (g_pWeaponMenu { playerid } != INVALID_WEAPONMENU_ID)
	{
		g_pWeaponMenu { playerid } = INVALID_WEAPONMENU_ID;
		CancelSelectTextDraw(playerid);
	}

	PlayerTextDrawDestroy(playerid, g_WeaponMenuBoxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_WeaponMenuTitleTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_WeaponMenuBackTD[playerid]);

	g_WeaponMenuBoxTD[playerid]	  = PlayerText: INVALID_TEXT_DRAW;
	g_WeaponMenuTitleTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_WeaponMenuBackTD[playerid]  = PlayerText: INVALID_TEXT_DRAW;

	for (new item, limit = sizeof(g_MenuWeapons); item < limit; item++)
	{
		PlayerTextDrawDestroy(playerid, g_WeaponMenuIconTD[playerid][item]);
		PlayerTextDrawDestroy(playerid, g_WeaponMenuNameTD[playerid][item]);

		g_WeaponMenuIconTD[playerid][item] = PlayerText: INVALID_TEXT_DRAW;
		g_WeaponMenuNameTD[playerid][item] = PlayerText: INVALID_TEXT_DRAW;
	}
	return 1;
}
