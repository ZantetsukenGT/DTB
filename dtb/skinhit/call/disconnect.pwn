
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	g_SkinhitIssuerID[playerid] = INVALID_PLAYER_ID;

	foreach (new loop_playerid : Player)
	{
		if (g_SkinhitIssuerID[loop_playerid] == playerid)
			g_SkinhitIssuerID[loop_playerid] = INVALID_PLAYER_ID;
	}
}
