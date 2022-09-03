hook OnPlayerSessionsLoaded(playerid)
{
	new rows;
	if (!cache_get_row_count(rows))
		return ~1;
	for (new row; row < rows; row++)
	{
		new accountid, query[100];
		cache_get_value_int(row, "session_account_id", accountid);

		mysql_format(g_DBHandle, query, sizeof(query), "SELECT * FROM bans WHERE ban_to_account_id = %i LIMIT 1", accountid);
		mysql_tquery(g_DBHandle, query, "OnPlayerBanLoaded", "i", playerid);
	}
	return ~1;
}
