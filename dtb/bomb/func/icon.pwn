ShowPlayerBombIcon(playerid, bool: show)
{
	if (show)
	{
		new Float: x,
			Float: y,
			Float: z;
		GetBombPickupPos(x, y, z);
		SetPlayerMapIcon(playerid, 2, x, y, z, 0, COLOR_GREEN, MAPICON_GLOBAL);
	}
	else
		RemovePlayerMapIcon(playerid, 2);
}

ShowTeamBombIcon(teamid, bool: show)
{
	foreach (new i : Player)
	{
		if (g_PlayerTeam[i] == teamid)
			ShowPlayerBombIcon(i, show);
	}
}
