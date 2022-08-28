
#include <YSI_Coding\y_hooks>

static g_PlayerSpectating[MAX_PLAYERS] = { INVALID_PLAYER_ID, ... };

stock GetPlayerSpectatePlayer(playerid) { return g_PlayerSpectating[playerid]; }
stock bool: IsPlayerSpectating(playerid) { return GetPlayerState(playerid) == PLAYER_STATE_SPECTATING; }

hook native TogglePlayerSpectating(playerid, toggle)
{
	new success = continue(playerid, toggle);
	if (success)
		g_PlayerSpectating[playerid] = INVALID_PLAYER_ID;
	return success;
}

/******************************************************************************/

hook native PlayerSpectatePlayer(playerid, targetplayerid, mode = SPECTATE_MODE_NORMAL)
{
	new success = continue(playerid, targetplayerid, mode);
	if (success)
	{
		new vehicleid = GetPlayerVehicleID(targetplayerid);
		if (vehicleid)
			PlayerSpectateVehicle(playerid, vehicleid, mode);

		g_PlayerSpectating[playerid] = targetplayerid;
		CallLocalFunction("OnPlayerSpectatePlayer", "iii", playerid, targetplayerid, mode);
	}
	return success;
}
/******************************************************************************/
