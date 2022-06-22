
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_BombProgressBackTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_BombProgressMaxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_BombProgressValueTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_BombTextTD[playerid]);

	g_BombProgressBackTD[playerid]	= PlayerText: INVALID_TEXT_DRAW;
	g_BombProgressMaxTD[playerid]	= PlayerText: INVALID_TEXT_DRAW;
	g_BombProgressValueTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_BombTextTD[playerid]			= PlayerText: INVALID_TEXT_DRAW;
}
