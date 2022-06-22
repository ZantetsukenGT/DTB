// On Player Armour Set: OPAS

#include <YSI_Coding\y_hooks>

static Float: old_armour[MAX_PLAYERS];
forward OnPlayerArmourSet(playerid, Float: new_armour, Float: old_armour);
hook native SetPlayerArmour(playerid, Float: armour)
{
	continue(playerid, armour);
	CallLocalFunction("OnPlayerArmourSet", "iff", playerid, armour, old_armour[playerid]);
	old_armour[playerid] = armour;
}
