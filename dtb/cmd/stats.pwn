COMMAND:stats(playerid, params[])
{
	if(isnull(params))
		return ShowPlayerStatsDialog(playerid, playerid), 1;

	new id;
	if(sscanf(params, "r", id))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Stats <playerid/name>"), 1;

	if(id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	return ShowPlayerStatsDialog(playerid, id), 1;
}
