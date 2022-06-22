
#include <YSI_Coding\y_hooks>

hook OnPlayerHealthSet(playerid, Float: new_health, Float: old_health)
{
	if (new_health < old_health)
		CreatePlayerDamageIcon(playerid, 1240);
}
