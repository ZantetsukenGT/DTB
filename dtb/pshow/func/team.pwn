ShowPlayerForTeam(playerid, teamid, bool: show)
{
	foreach (new loop_playerid : Player)
	{
		if (g_PlayerTeam[loop_playerid] == teamid)
		{
			// Show Team Player for Player
			if (IsPlayerStreamedIn(loop_playerid, playerid))
				ShowPlayerForPlayer(loop_playerid, playerid, show);

			// Show Player For Team Player
			if (IsPlayerStreamedIn(playerid, loop_playerid))
				ShowPlayerForPlayer(playerid, loop_playerid, show);
		}
	}
	return 1;
}
