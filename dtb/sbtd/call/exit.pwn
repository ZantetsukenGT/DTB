
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	for (new column; column < 4; column++) TextDrawDestroy(g_ScoreboardColumnTD[column]);

	for (new teamid; teamid < 2; teamid++)
	{
		TextDrawDestroy(g_ScoreboardBoxTD[teamid]);
		TextDrawDestroy(g_ScoreboardRowTD[teamid]);
		TextDrawDestroy(g_ScoreboardTeamTD[teamid]);

		foreach (new slot : Player)
		{
			TextDrawDestroy(g_ScoreboardPlayerTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardBombTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardHealthTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardScoreTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardDamageTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardAccuracyTD[teamid][slot]);
		}
	}
	return 1;
}
