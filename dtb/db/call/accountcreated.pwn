hook OnPlayerAccountCreated(playerid)
{
	if (cache_affected_rows() > 0)
		g_PlayerAccountID[playerid] = cache_insert_id();
	return ~1;
}
