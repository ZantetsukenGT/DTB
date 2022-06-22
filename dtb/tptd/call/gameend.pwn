
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	for (new teamid; teamid < 2; teamid++)
	{
		foreach (new i : Player) TextDrawHideForAll(g_TeamPlayersTD[teamid][i]);
	}
}
