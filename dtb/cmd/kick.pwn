COMMAND:kick(playerid, params[])
{
	if (g_PlayerAdminLevel { playerid } < 1)
		return 0;

	new id, reason[50];
	if (sscanf(params, "rS(None)[*]", id, sizeof(reason), reason))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Kick <playerid/name> <reason>"), 1;

	if (id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if (playerid == id)
		return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	KickPlayer(id, reason, playerid);
	return 1;
}
