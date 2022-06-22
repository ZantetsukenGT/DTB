#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	new teamid = g_PlayerTeam[playerid];
	switch (teamid)
	{
		case TEAM_ATTACK, TEAM_DEFEND:
		{
			g_IsPlayerShown { playerid } = false;

			ShowPlayerForTeam(playerid, teamid, true);
			ShowPlayerForTeam(playerid, GetTeamOpponents(teamid), false);
		}
	}
}
