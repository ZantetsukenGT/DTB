
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (killerid != INVALID_PLAYER_ID)
		GivePlayerXP(killerid, 2, "Enemy Killed");

	foreach (new assistid : Player)
	{
		if (assistid == killerid)
			continue;

		if (assistid == playerid)
			continue;

		if (g_PlayerDamagedBy[playerid][assistid])
			GivePlayerXP(assistid, 1, "Assisted Kill");
	}
	return 1;
}
