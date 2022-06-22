
#include <YSI_Coding\y_hooks>

hook OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if (IsPlayerStreamedIn(playerid, damagedid) && IsPlayerStreamedIn(damagedid, playerid))
		DamagePlayer(damagedid, playerid, amount, weaponid, bodypart);
}
