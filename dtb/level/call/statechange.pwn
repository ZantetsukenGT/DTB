
#include <YSI_Coding\y_hooks>

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_SPECTATING)
		ShowPlayerLevelTextdraws(playerid, false);
	return 1;
}
