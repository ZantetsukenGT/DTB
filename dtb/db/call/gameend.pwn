
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	if (g_GameWinner != TEAM_NONE)
	{
		new losers = GetTeamOpponents(g_GameWinner);
		foreach (new playerid : Player)
		{
			if (g_PlayerTeam[playerid] == g_GameWinner)
				g_PlayerGamesWon[playerid]++;
			else if (g_PlayerTeam[playerid] == losers)
				g_PlayerGamesLost[playerid]++;
		}
	}
	return 1;
}
