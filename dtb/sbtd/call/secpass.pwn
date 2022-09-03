
#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	if (g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		foreach (new playerid : Player)
		{
			PlayerTextDrawHide(playerid, g_pScoreboardResultTD[playerid]);
		}

		for (new column; column < 4; column++) TextDrawHideForAll(g_ScoreboardColumnTD[column]);

		for (new teamid; teamid < 2; teamid++)
		{
			TextDrawHideForAll(g_ScoreboardBoxTD[teamid]);
			TextDrawHideForAll(g_ScoreboardRowTD[teamid]);
			TextDrawHideForAll(g_ScoreboardTeamTD[teamid]);

			foreach (new slot : Player)
			{
				TextDrawHideForAll(g_ScoreboardPlayerTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardBombTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardHealthTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardScoreTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardDamageTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardAccuracyTD[teamid][slot]);
			}
		}
	}
	return 1;
}
