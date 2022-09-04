
#include <YSI_Coding\y_hooks>

hook PublicKick(playerid)
{
	if (g_IsPlayerKicked { playerid })
		KickPlayer(playerid);
	return 1;
}
