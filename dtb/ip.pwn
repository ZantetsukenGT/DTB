
#include <YSI_Coding\y_hooks>

#define MAX_IPV4 15

new g_PlayerIP[MAX_PLAYERS][MAX_IPV4 + 1];

hook OnPlayerConnect(playerid)
{
	GetPlayerIp(playerid, g_PlayerIP[playerid], MAX_IPV4 + 1);
	return 1;
}
