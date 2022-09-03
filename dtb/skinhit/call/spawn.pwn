
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	SetPlayerTeam(playerid, playerid);
	return 1;
}
