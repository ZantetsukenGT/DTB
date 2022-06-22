
#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	if (g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		foreach (new playerid : Player)
		{
			ResetPlayerRoundVariables(playerid);
			SetPlayerScore(playerid, 0);
		}
	}
}
