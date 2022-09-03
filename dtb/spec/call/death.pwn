
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	foreach (new spectatorid : Player)
	{
		if (!IsPlayerSpectating(spectatorid))
			continue;

		if (GetPlayerSpectatePlayer(spectatorid) == playerid)
			TogglePlayerSpectating(spectatorid, false);
	}
	return 1;
}
