
#include <YSI_Coding\y_hooks>

#define MAX_GPCI 40

new g_PlayerGPCI[MAX_PLAYERS][MAX_GPCI + 1];

hook OnPlayerConnect(playerid) { gpci(playerid, g_PlayerGPCI[playerid], MAX_GPCI + 1); }
