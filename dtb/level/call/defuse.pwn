
#include <YSI_Coding\y_hooks>

hook OnBombDefused(playerid, bombsiteid)
{
	GivePlayerXP(playerid, 2, "Bomb Defused");
	return 1;
}
