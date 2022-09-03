hook OnPlayerAutoLogin(playerid)
{
	new rows;
	if (!cache_get_row_count(rows))
		return ~1;
	if (rows > 0)
	{
		new last_ip[MAX_IPV4 + 1], last_gpci[MAX_GPCI + 1];

		cache_get_value(0, "session_ip", last_ip);
		cache_get_value(0, "session_gpci", last_gpci);

		if (!strcmp(g_PlayerIP[playerid], last_ip) && !strcmp(g_PlayerGPCI[playerid], last_gpci))
		{
			LoginPlayer(playerid, g_PlayerAccountID[playerid], true);
		}
		else
			ShowPlayerLoginDialog(playerid);
	}
	else
		ShowPlayerLoginDialog(playerid);
	return ~1;
}
