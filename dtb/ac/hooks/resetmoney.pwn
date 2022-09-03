
#include <YSI_Coding\y_hooks>

hook native ResetPlayerMoney(playerid)
{
	g_acMoney[playerid] = 0;
	return continue(playerid);
}
