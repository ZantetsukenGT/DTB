hook OnPlayerAKALoaded(playerid, forplayerid)
{
	new rows;
	if (!cache_get_row_count(rows))
		return ~1;
	if (rows == 0)
		SendClientMessage(forplayerid, COLOR_RED, "This player has no other names!");
	else
	{
		new message[128];
		format(message, sizeof(message), "%s (ID: %i) has %i other name(s):", g_PlayerName[playerid], playerid, rows);
		SendClientMessage(forplayerid, COLOR_GREEN, message);

		for (new row; row < rows; row++)
		{
			new name[MAX_PLAYER_NAME + 1];
			cache_get_value(row, "session_name", name);
			SendClientMessage(forplayerid, COLOR_WHITE, name);
		}
	}
	return ~1;
}
