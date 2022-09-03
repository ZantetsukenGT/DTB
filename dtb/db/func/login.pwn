LoginPlayer(playerid, accountid, bool: autologin)
{
	g_IsPlayerLoggedIn { playerid } = true;

	new msg[128];
	format(
		msg, sizeof(msg), "Account %s logged in! (Account ID: %i)", autologin ? "automatically" : "successfully",
		accountid);
	SendClientMessage(playerid, COLOR_GREEN, msg);
	TogglePlayerSpectating(playerid, false);
}
