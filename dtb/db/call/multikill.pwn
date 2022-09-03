
#include <YSI_Coding\y_hooks>

hook OnPlayerMultiKill(playerid, kills)
{
	if (kills > g_PlayerBestMultiKill { playerid })
		g_PlayerBestMultiKill { playerid } = kills;
	return 1;
}
