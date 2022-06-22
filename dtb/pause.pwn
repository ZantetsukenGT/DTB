
#include <YSI_Coding\y_hooks>

static g_PlayerLastUpdate[MAX_PLAYERS];

stock GetPlayerPausedSeconds(playerid) { return (GetTickCount() - g_PlayerLastUpdate[playerid]) / 1000; }
stock bool: IsPlayerPaused(playerid) { return GetTickCount() - g_PlayerLastUpdate[playerid] > 2000; }
hook OnPlayerConnect(playerid) { g_PlayerLastUpdate[playerid] = GetTickCount(); }
hook OnPlayerUpdate(playerid) { g_PlayerLastUpdate[playerid] = GetTickCount(); }
