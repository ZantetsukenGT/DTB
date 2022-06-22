
#include <YSI_Coding\y_hooks>

hook OnPlayerArmourSet(playerid, Float: new_armour, Float: old_armour)
{
	if (new_armour < old_armour)
		CreatePlayerDamageIcon(playerid, 1242);
}
