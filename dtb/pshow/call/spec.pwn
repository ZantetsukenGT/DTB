#include <YSI_Coding\y_hooks>

hook OnPlayerSpectatePlayer(playerid, targetplayerid, mode)
{
	if (IsPlayerStreamedIn(targetplayerid, playerid))
		ShowPlayerForPlayer(targetplayerid, playerid, true);
	return 1;
}
