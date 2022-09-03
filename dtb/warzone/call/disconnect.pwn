
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_ZoneBackgroundTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_ZoneTextTD[playerid]);

	g_IsPlayerInZone { playerid }	  = true;
	g_PlayerZoneWarnings { playerid } = 0;
	g_ZoneBackgroundTD[playerid]	  = PlayerText: INVALID_TEXT_DRAW;
	g_ZoneTextTD[playerid]			  = PlayerText: INVALID_TEXT_DRAW;
	return 1;
}
