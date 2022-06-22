
#include <YSI_Coding\y_hooks>

hook OnPlayerArmourSet(playerid, Float: new_armour, Float: old_armour)
{
	g_acArmour[playerid]			= new_armour;
	g_acArmourWarnings { playerid } = 0;
}
