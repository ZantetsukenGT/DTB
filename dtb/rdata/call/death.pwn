
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	g_PlayerRoundKilled { playerid } = true;
	return 1;
}
