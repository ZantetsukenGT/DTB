
#include <YSI_Coding\y_hooks>

hook OnBombPlanted(playerid, bombsiteid)
{
	g_PlayerBombsPlanted[playerid]++;
	return 1;
}
