
#include <YSI_Coding\y_hooks>

static bool: g_IsPlayerSelectingClass[MAX_PLAYERS char];

IsPlayerSpawned(playerid)
{
	new player_state = GetPlayerState(playerid);
	switch (player_state)
	{
		case PLAYER_STATE_ONFOOT, PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER, PLAYER_STATE_SPAWNED: return 1;
		case PLAYER_STATE_WASTED: return g_IsPlayerSelectingClass { playerid } ? 0 : 1;
	}
	return 0;
}

hook OnPlayerRequestClass(playerid, classid) { g_IsPlayerSelectingClass { playerid } = true; }
hook OnPlayerSpawn(playerid) { g_IsPlayerSelectingClass { playerid } = false; }
