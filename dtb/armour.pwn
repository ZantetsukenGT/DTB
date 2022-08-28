// On Player Armour Set: OPAS

static Float: old_armour[MAX_PLAYERS];

CheckArmourBefore(playerid, Float: armour)
{
	old_armour[playerid] = armour;
}

CheckArmourAfter(playerid, Float: armour)
{
	CallLocalFunction("OnPlayerArmourSet", "iff", playerid, armour, old_armour[playerid]);
}
