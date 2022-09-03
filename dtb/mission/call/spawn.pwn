#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	switch (g_PlayerTeam[playerid])
	{
		case TEAM_ATTACK, TEAM_DEFEND:
		{
			ShowPlayerObjectiveTextdraw(playerid);
			SetPlayerCameraAtBombsite(playerid, g_ObjectiveBombsite);
		}
	}
	return 1;
}
