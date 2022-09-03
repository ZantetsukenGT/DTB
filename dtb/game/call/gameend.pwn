
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	foreach (new playerid : Player)
	{
		if (g_GameWinner == TEAM_NONE)
		{
			PlayerPlaySound(playerid, 5816, 0.0, 0.0, 0.0);
			if (IsPlayerSpawned(playerid))
				TogglePlayerControllable(playerid, false);
		}
		else
		{
			new losers = GetTeamOpponents(g_GameWinner);

			if (g_PlayerTeam[playerid] == g_GameWinner)
			{
				PlayerPlaySound(playerid, 31205, 0.0, 0.0, 0.0);

				if (IsPlayerSpawned(playerid))
					ApplyAnimation(playerid, "OTB", "wtchrace_win", 4.1, 1, 0, 0, 0, 0, 0);
			}
			else if (g_PlayerTeam[playerid] == losers)
			{
				PlayerPlaySound(playerid, 31202, 0.0, 0.0, 0.0);

				if (IsPlayerSpawned(playerid))
					ApplyAnimation(playerid, "OTB", "wtchrace_lose", 4.1, 1, 0, 0, 0, 0, 0);
			}
		}
	}
	return 1;
}
