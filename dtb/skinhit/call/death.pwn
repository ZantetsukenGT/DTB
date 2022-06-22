
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (g_SkinhitIssuerID[playerid] != INVALID_PLAYER_ID)
	{
		if (GetTickCount() - g_SkinhitTick[playerid] < 5000)
		{
			killerid = g_SkinhitIssuerID[playerid];
			reason	 = g_SkinhitReasonID[playerid];
		}
		g_SkinhitIssuerID[playerid] = INVALID_PLAYER_ID;
	}
}
