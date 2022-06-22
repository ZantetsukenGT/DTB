ShowPlayerForOpponents(playerid, bool: show)
{
	g_LastPlayerShowTime[playerid] = gettime();
	if (show == g_IsPlayerShown { playerid })
		return 0;

	g_IsPlayerShown { playerid } = show;

	new teamid = g_PlayerTeam[playerid], opposite_teamid = GetTeamOpponents(teamid);

	foreach (new loop_playerid : Player)
	{
		if (g_PlayerTeam[loop_playerid] != opposite_teamid)
			continue;

		if (IsPlayerStreamedIn(playerid, loop_playerid))
			ShowPlayerForPlayer(playerid, loop_playerid, show);
	}
	return 1;
}
