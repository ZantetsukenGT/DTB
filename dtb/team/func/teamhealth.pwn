GetTeamHealth(teamid, &current_health, &max_health)
{
	foreach (new playerid : Player)
	{
		if (g_PlayerTeam[playerid] != teamid)
			continue;

		max_health += 200;
		if (!g_PlayerRoundKilled { playerid })
		{
			new Float: health,
				Float: armour;

			ac_GetPlayerHealth(playerid, health);
			ac_GetPlayerArmour(playerid, armour);

			current_health += (floatround(health) + floatround(armour));
		}
	}
}
