
#include <YSI_Coding\y_hooks>

new g_PlayerName[MAX_PLAYERS][MAX_PLAYER_NAME + 1];

hook native SetPlayerName(playerid, const name[])
{
	new success = continue(playerid, name);
	if (success)
		format(g_PlayerName[playerid], MAX_PLAYER_NAME + 1, name);
	return success;
}

hook OnPlayerConnect(playerid)
{
	GetPlayerName(playerid, g_PlayerName[playerid], MAX_PLAYER_NAME + 1);
	return 1;
}
