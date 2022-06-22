#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	for (new teamid; teamid < 2; teamid++)
	{
		g_ObjectiveTD[teamid] = TextDrawCreate(380.0, 341.0, "_");
		TextDrawAlignment(g_ObjectiveTD[teamid], 2);
		TextDrawBackgroundColor(g_ObjectiveTD[teamid], 255);
		TextDrawFont(g_ObjectiveTD[teamid], 1);
		TextDrawLetterSize(g_ObjectiveTD[teamid], 0.58, 2.4);
		TextDrawColor(g_ObjectiveTD[teamid], -1);
		TextDrawSetOutline(g_ObjectiveTD[teamid], 0);
		TextDrawSetProportional(g_ObjectiveTD[teamid], 1);
		TextDrawSetShadow(g_ObjectiveTD[teamid], 2);
		TextDrawTextSize(g_ObjectiveTD[teamid], 20.0, 400.0);
	}
}
