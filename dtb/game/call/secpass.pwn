
#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	if (g_GameState == STATE_COUNTDOWN)
	{
		new alive_players[2];
		for (new teamid, total_players, dead_players; teamid < 2; teamid++)
			GetTeamPlayers(teamid, total_players, alive_players[teamid], dead_players);

		if (alive_players[TEAM_ATTACK] == 0 || alive_players[TEAM_DEFEND] == 0)
			return 0;

		if (g_GameTime > 0)
		{
			g_GameTime--;
			PlaySoundForAll(1056);
		}
		else
		{
			g_GameState++;
			g_GameTime = MISSION_TIME;
			PlaySoundForAll(1057);

			foreach (new playerid : Player)
			{
				TogglePlayerControllable(playerid, true);
			}
		}
	}
	else if (g_GameState == STATE_STARTED && g_GameTime > 0)
		g_GameTime--;
	else if (g_GameState == STATE_FINISHED)
	{
		if (g_GameTime > 0)
			g_GameTime--;
		else
		{
			foreach (new playerid : Player)
			{
				SetPlayerColor(playerid, COLOR_WHITE);

				if (IsPlayerSpawned(playerid))
					TogglePlayerSpectating(playerid, true);
			}
			StartGame();
		}
	}
	return 1;
}
