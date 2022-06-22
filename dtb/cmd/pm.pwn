COMMAND:pm(playerid, params[])
{
	new id, message[100];

	if (sscanf(params, "rs[*]", id, sizeof(message), message))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Pm <playerid/name> <message>"), 1;

	if (id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if (id == playerid)
		return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	if (ac_CheckPlayerRepeatingChat(playerid, message))
		return 1;

	if (IsPlayerPaused(id))
		SendClientMessage(playerid, COLOR_RED, "This player is paused and might not see your message for a while!");

	new send_string[128], receive_string[128], admin_string[128];

	format(send_string, sizeof send_string, "PM sent to %s (ID: %i): %s", g_PlayerName[id], id, message);
	SendClientMessage(playerid, COLOR_YELLOW, send_string);

	format(receive_string, sizeof receive_string, "PM received from %s (ID: %i): %s", g_PlayerName[playerid], playerid, message);
	SendClientMessage(id, COLOR_YELLOW, receive_string);

	format(
		admin_string, sizeof admin_string, "PM Sent from %s (ID: %i) to %s (ID: %i) below:", g_PlayerName[playerid], playerid,
		g_PlayerName[id], id);

	foreach (new adminid : Player)
	{
		if (g_PlayerAdminLevel { adminid } == 0)
			continue;

		if (adminid == playerid)
			continue;

		if (adminid == id)
			continue;

		SendClientMessage(adminid, COLOR_ORANGE, admin_string);
		SendClientMessage(adminid, COLOR_ORANGE, message);
	}

	WriteChatlog(playerid, message, id);
	return 1;
}
