
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	if (g_PlayerAccountID[playerid] == 0 || g_IsPlayerRegistered { playerid } && !g_IsPlayerLoggedIn { playerid })
	{
		TogglePlayerSpectating(playerid, true);
		return 1;
	}
	return 1;
}
