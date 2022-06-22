
#include <YSI_Coding\y_hooks>

static previous_time[MAX_PLAYERS];

hook OnPlayerConnect(playerid) { previous_time[playerid] = GetTickCount() - 31000; }

hook OnPlayerUpdate(playerid)
{
	if ((GetTickCount() - previous_time[playerid]) > 30000)
	{
		if (g_PlayerAccountID[playerid] != 0 && g_IsPlayerRegistered { playerid } && g_IsPlayerLoggedIn { playerid })
			SavePlayerAccount(playerid, g_PlayerAccountID[playerid]);
		previous_time[playerid] = GetTickCount();
	}
}
