
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	foreach (new playerid : Player)
	{
		if (g_pWeaponMenu { playerid } != INVALID_WEAPONMENU_ID)
			HidePlayerWeaponMenu(playerid);
	}
}
