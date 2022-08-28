// On Player Health Set: OPHS

static Float: old_health[MAX_PLAYERS];

CheckHealthBefore(playerid, Float: health)
{
	old_health[playerid] = health;
}

CheckHealthAfter(playerid, Float: health)
{
	CallLocalFunction("OnPlayerHealthSet", "iff", playerid, health, old_health[playerid]);
}
