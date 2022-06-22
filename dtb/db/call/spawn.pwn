
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	if (g_PlayerAccountID[playerid] == 0)
		return TogglePlayerSpectating(playerid, true), 1;

	if (g_IsPlayerRegistered { playerid } && !g_IsPlayerLoggedIn { playerid })
		return TogglePlayerSpectating(playerid, true), 1;
	return 1;
}
