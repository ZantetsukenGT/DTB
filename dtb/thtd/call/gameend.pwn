
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	for (new teamid; teamid < 2; teamid++)
	{
		TextDrawHideForAll(g_TeamMaxHealthTD[teamid]);
		TextDrawHideForAll(g_TeamCurrentHealthTD[teamid]);
		TextDrawHideForAll(g_TeamTextHealthTD[teamid]);
	}
}
