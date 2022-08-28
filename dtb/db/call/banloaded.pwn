hook OnPlayerBanLoaded(playerid)
{
	new rows;
	if (!cache_get_row_count(rows))
		return 1;
	if (rows > 0)
	{
		new ban_reason[50], kick_reason[64];

		cache_get_value(0, "ban_reason", ban_reason);
		format(kick_reason, sizeof(kick_reason), "Previous Ban (%s)", ban_reason);
		KickPlayer(playerid, kick_reason);
	}
	return 1;
}
