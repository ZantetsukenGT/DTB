
#include <YSI_Coding\y_hooks>

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	ShowPlayerStatsDialog(playerid, clickedplayerid);
	return 1;
}
