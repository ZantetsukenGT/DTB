stock KickPlayer(playerid, const reason[] = "none", by_playerid = INVALID_PLAYER_ID, const by_irc_user[] = "none")
{
	if (g_IsPlayerKicked { playerid })
		return 0;

	new message[128];

	format(message, sizeof(message), "<< %s (ID: %i) has been kicked, reason: %s.", g_PlayerName[playerid], playerid, reason);
	SendClientMessageToAll(COLOR_ORANGE, message);

	ClearPlayerChat(playerid);

	SendClientMessage(playerid, COLOR_ORANGE, "You have been kicked!");

	format(message, sizeof(message), "Reason: {FFFFFF}%s", reason);
	SendClientMessage(playerid, COLOR_ORANGE, message);

	g_IsPlayerKicked { playerid } = true;
	DelayKick(playerid);

	CallLocalFunction("OnPlayerKicked", "iiss", playerid, by_playerid, by_irc_user, reason);
	return 1;
}
