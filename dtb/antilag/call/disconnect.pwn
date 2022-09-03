
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	g_PingWarnings[playerid]	   = 0;
	g_FpsWarnings[playerid]		   = 0;
	g_PacketLossWarnings[playerid] = 0;

	PlayerTextDrawDestroy(playerid, g_AntilagBoxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PingTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_FramerateTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PacketlossTD[playerid]);

	g_AntilagBoxTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PingTD[playerid]		 = PlayerText: INVALID_TEXT_DRAW;
	g_FramerateTD[playerid]	 = PlayerText: INVALID_TEXT_DRAW;
	g_PacketlossTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	return 1;
}
