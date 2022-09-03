
#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	g_pScoreboardResultTD[playerid] = CreatePlayerTextDraw(playerid, 320.0, 66.0, "Result");
	PlayerTextDrawAlignment(playerid, g_pScoreboardResultTD[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, g_pScoreboardResultTD[playerid], 0xFF);
	PlayerTextDrawFont(playerid, g_pScoreboardResultTD[playerid], 2);
	PlayerTextDrawLetterSize(playerid, g_pScoreboardResultTD[playerid], 0.51, 2.60);
	PlayerTextDrawColor(playerid, g_pScoreboardResultTD[playerid], COLOR_WHITE);
	PlayerTextDrawSetProportional(playerid, g_pScoreboardResultTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, g_pScoreboardResultTD[playerid], 2);
	return 1;
}
