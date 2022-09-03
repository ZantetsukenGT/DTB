
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

	ResetPlayerWeapons(playerid);
	ResetPlayerMoney(playerid);

	SetPlayerHealth(playerid, 100.0);
	SetPlayerArmour(playerid, 100.0);
	return 1;
}
