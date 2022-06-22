GetTeamPlayers(teamid, &total_players, &alive_players, &dead_players)
{
	new team_playerids[MAX_TEAM_PLAYERS] = { INVALID_PLAYER_ID, ... };

	foreach (new playerid : Player)
	{
		if (g_PlayerTeam[playerid] != teamid)
			continue;

		team_playerids[total_players++] = playerid;
		if (g_PlayerRoundKilled { playerid })
			dead_players++;
		else
			alive_players++;
	}
	return team_playerids;
}
