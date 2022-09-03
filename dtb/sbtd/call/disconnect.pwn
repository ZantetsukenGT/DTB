
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_pScoreboardResultTD[playerid]);
	g_pScoreboardResultTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	return 1;
}
