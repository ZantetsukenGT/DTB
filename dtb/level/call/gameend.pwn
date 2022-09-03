
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	if (g_GameWinner != TEAM_NONE)
	{
		foreach (new playerid : Player)
		{
			if (g_PlayerTeam[playerid] == g_GameWinner)
				GivePlayerXP(playerid, 1, "Round Winner");
		}
	}
	return 1;
}
