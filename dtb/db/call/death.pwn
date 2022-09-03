
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	g_PlayerDeaths[playerid]++;
	if (killerid != INVALID_PLAYER_ID)
		g_PlayerKills[killerid]++;

	WriteDeathlog(playerid, killerid, reason);
	return 1;
}
