UpdateTeamPlayersTextdraws(teamid)
{
	new alive_players, dead_players, total_players;

	GetTeamPlayers(teamid, total_players, alive_players, dead_players);

	foreach (new i : Player)
	{
		if (i < total_players)
		{
			if (i < alive_players)
				TextDrawColor(g_TeamPlayersTD[teamid][i], g_TeamColors[teamid]);
			else
				TextDrawColor(g_TeamPlayersTD[teamid][i], g_TeamColors[teamid] - 200);
			TextDrawShowForAll(g_TeamPlayersTD[teamid][i]);
		}
		else
			TextDrawHideForAll(g_TeamPlayersTD[teamid][i]);
	}
	return 1;
}
