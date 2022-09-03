#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_PlayerHealthTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PlayerArmourTD[playerid]);

	g_PlayerHealthTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerHealthTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	return 1;
}
