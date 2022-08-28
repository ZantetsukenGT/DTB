
#include <YSI_Coding\y_hooks>

static bool: g_IsPlayerSelectingClass[MAX_PLAYERS char];

hook native IsPlayerSpawned(playerid)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_WASTED
		&& g_IsPlayerSelectingClass { playerid })
		return 0;
	return continue(playerid);
}

hook OnPlayerRequestClass(playerid, classid) { g_IsPlayerSelectingClass { playerid } = true; }
hook OnPlayerSpawn(playerid) { g_IsPlayerSelectingClass { playerid } = false; }
