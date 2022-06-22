COMMAND:report(playerid, params[])
{
	new id, reason[50];

	if (sscanf(params, "rs[*]", id, sizeof(reason), reason))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Report <playerid/name> <reason>"), 1;

	if (id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if (id == playerid)
		return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	new send_string[144], admin_string[144];

	format(send_string, sizeof(send_string), "You have reported %s (ID: %i), reason: %s.", g_PlayerName[id], id, reason);
	SendClientMessage(playerid, COLOR_ORANGE, send_string);

	format(
		admin_string, sizeof(admin_string), "%s (ID: %i) has reported %s (ID: %i), reason: %s.", g_PlayerName[playerid], playerid,
		g_PlayerName[id], id, reason);

	foreach (new loop_playerid : Player)
	{
		if (loop_playerid == playerid)
			continue;

		if (loop_playerid == id)
			continue;

		if (g_PlayerAdminLevel { loop_playerid } > 0)
			SendClientMessage(loop_playerid, COLOR_ORANGE, admin_string);
	}
	return 1;
}
