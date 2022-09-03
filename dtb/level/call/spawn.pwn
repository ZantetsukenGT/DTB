
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	ShowPlayerLevelTextdraws(playerid, true);
	return 1;
}
