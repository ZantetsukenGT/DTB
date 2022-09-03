
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	switch (g_PlayerTeam[playerid])
	{
		case TEAM_ATTACK, TEAM_DEFEND:
		{
			SendClientMessage(playerid, COLOR_GREEN, "Showing Menu");
			ShowPlayerWeaponMenu(playerid, 0);
			SelectTextDraw(playerid, COLOR_RED);
		}
	}
	return 1;
}
