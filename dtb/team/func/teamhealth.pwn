GetTeamHealth(teamid, &current_health, &max_health)
{
	foreach (new playerid : Player)
	{
		if (g_PlayerTeam[playerid] != teamid)
			continue;

		max_health += 200;
		if (!g_PlayerRoundKilled { playerid })
		{
			new Float: health = GetPlayerHealth(playerid),
				Float: armour = GetPlayerArmour(playerid);

			current_health += (floatround(health) + floatround(armour));
		}
	}
}
