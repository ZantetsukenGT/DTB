
#include <YSI_Coding\y_hooks>

static g_PlayerJoinTime[MAX_PLAYERS];

stock GetPlayerJoinTime(playerid) { return g_PlayerJoinTime[playerid]; }

stock GetPlayerSessionTime(playerid) { return gettime() - g_PlayerJoinTime[playerid]; }

hook OnPlayerConnect(playerid) { g_PlayerJoinTime[playerid] = gettime(); }
