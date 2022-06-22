
#include <YSI_Coding\y_hooks>

hook OnPlayerXPReceived(playerid, xp, const reason[])
{
	g_PlayerRoundScore[playerid] += xp;
	SetPlayerScore(playerid, g_PlayerRoundScore[playerid]);
}
