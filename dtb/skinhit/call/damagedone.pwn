
public OnPlayerDamageDone(playerid, Float: amount, issuerid, weapon, bodypart)
{
	// Round stats
	if (issuerid != INVALID_PLAYER_ID)
	{
		g_PlayerRoundDamage[issuerid] += amount;
		if (playerid != INVALID_PLAYER_ID)
			g_PlayerDamagedBy[playerid][issuerid] = true;
	}
	if (playerid != INVALID_PLAYER_ID)
	{
		CheckHealthAfter(playerid, GetPlayerHealth(playerid));
		CheckArmourAfter(playerid, GetPlayerArmour(playerid));
	}
	return 1;
}
