
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_PlayerLevelBoxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PlayerXPMaxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PlayerXPProgressTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PlayerLevelTextTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PlayerXPTextTD[playerid]);

	g_PlayerLevel { playerid }	   = 0;
	g_PlayerXP[playerid]		   = 0;
	g_PlayerLevelBoxTD[playerid]   = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerXPMaxTD[playerid]	   = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerXPProgressTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerLevelTextTD[playerid]  = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerXPTextTD[playerid]	   = PlayerText: INVALID_TEXT_DRAW;
}
