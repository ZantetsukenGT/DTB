
public OnPlayerDamage(&playerid, &Float: amount, &issuerid, &weapon, &bodypart)
{
	if (issuerid != INVALID_PLAYER_ID && g_PlayerTeam[issuerid] == g_PlayerTeam[playerid])
		return 0;

	if (bodypart == 9)
		amount *= 2;

	CheckHealthBefore(playerid, GetPlayerHealth(playerid));
	CheckArmourBefore(playerid, GetPlayerArmour(playerid));

	return 1;
}
