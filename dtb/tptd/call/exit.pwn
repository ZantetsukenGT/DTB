
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	for (new teamid; teamid < 2; teamid++)
	{
		for (new slot; slot < MAX_TEAM_PLAYERS; slot++) TextDrawDestroy(g_TeamPlayersTD[teamid][slot]);
	}
}
