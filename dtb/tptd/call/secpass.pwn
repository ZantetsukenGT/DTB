
#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	if (g_GameState == STATE_STARTED && g_GameTime > 0)
	{
		for (new teamid; teamid < 2; teamid++) UpdateTeamPlayersTextdraws(teamid);
	}
	return 1;
}
