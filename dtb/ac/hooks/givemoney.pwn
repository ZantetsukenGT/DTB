
#include <YSI_Coding\y_hooks>

hook native GivePlayerMoney(playerid, money)
{
	g_acMoney[playerid] += money;
	return continue(playerid, money);
}
