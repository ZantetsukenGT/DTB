// On Player Health Set: OPHS

#include <YSI_Coding\y_hooks>

static Float: old_health[MAX_PLAYERS];
forward OnPlayerHealthSet(playerid, Float: new_health, Float: old_health);
hook native SetPlayerHealth(playerid, Float: health)
{
	continue(playerid, health);
	CallLocalFunction("OnPlayerHealthSet", "iff", playerid, health, old_health[playerid]);
	old_health[playerid] = health;
}
