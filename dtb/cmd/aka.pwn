COMMAND:aka(playerid, params[])
{
	if (g_PlayerAdminLevel { playerid } < 1)
		return 0;

	new id;
	if (sscanf(params, "r", id))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Aka <playerid/name>"), 1;

	if (id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	new query[150];
	mysql_format(
		g_DBHandle, query, sizeof(query),
		"SELECT DISTINCT session_name FROM sessions WHERE session_account_id != %i AND session_ip = '%e'", g_PlayerAccountID[id],
		g_PlayerIP[id]);
	mysql_tquery(g_DBHandle, query, "OnPlayerAKALoaded", "ii", id, playerid);
	return 1;
}
