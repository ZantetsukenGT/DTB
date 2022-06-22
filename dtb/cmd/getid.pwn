COMMAND:getid(playerid, params[])
{
	new ids[MAX_PLAYERS];
	if (sscanf(params, "?<MATCH_NAME_PARTIAL=1>r[*]", sizeof(ids), ids))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Getid <part of name>"), 1;

	if (ids[MAX_PLAYERS - 1] == cellmin)
		return SendClientMessage(playerid, COLOR_RED, "Too many matches!"), 1;

	new players_found = 0;
	for (; ids[players_found] != INVALID_PLAYER_ID; ++players_found) {}
	if (players_found == 0)
		return SendClientMessage(playerid, COLOR_RED, "No players were found with a similar name!"), 1;
	else
	{
		new msg[128];
		format(msg, sizeof(msg), "%i player(s) were found with a similar name:", players_found);
		SendClientMessage(playerid, COLOR_GREEN, msg);

		for (new index; index < players_found; index++)
		{
			new id = ids[index];
			format(msg, sizeof(msg), "%s (ID: %i)", g_PlayerName[id], id);
			SendClientMessage(playerid, COLOR_WHITE, msg);
		}
	}
	return 1;
}
