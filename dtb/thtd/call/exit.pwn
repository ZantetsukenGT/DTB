
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	for (new teamid; teamid < 2; teamid++)
	{
		TextDrawDestroy(g_TeamMaxHealthTD[teamid]);
		TextDrawDestroy(g_TeamCurrentHealthTD[teamid]);
		TextDrawDestroy(g_TeamTextHealthTD[teamid]);
	}
	return 1;
}
