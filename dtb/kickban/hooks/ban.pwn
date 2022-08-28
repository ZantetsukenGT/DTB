stock BanPlayer(playerid, const reason[] = "none", by_playerid = INVALID_PLAYER_ID)
{
	if (g_IsPlayerKicked { playerid })
		return 0;

	new year, month, day, hour, minute, second, message[128];

	getdate(year, month, day);
	gettime(hour, minute, second);

	format(message, sizeof(message), "<< %s (ID: %i) has been banned, reason: %s.", g_PlayerName[playerid], playerid, reason);
	SendClientMessageToAll(COLOR_ORANGE, message);

	ClearPlayerChat(playerid);

	SendClientMessage(playerid, COLOR_RED, "You have been banned!");

	format(message, sizeof(message), "Your Name: {FFFFFF}%s", g_PlayerName[playerid]);
	SendClientMessage(playerid, COLOR_RED, message);

	format(message, sizeof(message), "Date: {FFFFFF}%i-%02i-%02i", year, month, day);
	SendClientMessage(playerid, COLOR_RED, message);

	format(message, sizeof(message), "Time: {FFFFFF}%02i:%02i:%02i", hour, minute, second);
	SendClientMessage(playerid, COLOR_RED, message);

	format(message, sizeof(message), "Reason: {FFFFFF}%s", reason);
	SendClientMessage(playerid, COLOR_RED, message);

	g_IsPlayerKicked { playerid } = true;
	DelayKick(playerid);

	CallLocalFunction("OnPlayerBanned", "iis", playerid, by_playerid, reason);
	return 1;
}
