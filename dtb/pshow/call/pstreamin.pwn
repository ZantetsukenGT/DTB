#include <YSI_Coding\y_hooks>

hook OnPlayerStreamIn(playerid, forplayerid)
{
	if (g_PlayerTeam[playerid] == g_PlayerTeam[forplayerid] || g_PlayerTeam[forplayerid] == TEAM_SPECTATE)
		ShowPlayerForPlayer(playerid, forplayerid, true);
	else
		ShowPlayerForPlayer(playerid, forplayerid, g_IsPlayerShown { playerid });
}
