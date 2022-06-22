
#include <YSI_Coding\y_hooks>

hook OnPlayerKicked(playerid, by_playerid, const by_irc_user[], const reason[])
{
	new query[300];
	if (by_playerid == INVALID_PLAYER_ID)
	{
		mysql_format(
			g_DBHandle, query, sizeof(query),
			"INSERT INTO kicks (kick_to_account_id, kick_to_name, kick_by_irc_user, kick_date, kick_reason) VALUES (%i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid], g_PlayerName[playerid], by_irc_user, reason);
	}
	else
	{
		mysql_format(
			g_DBHandle, query, sizeof(query),
			"INSERT INTO kicks (kick_to_account_id, kick_by_account_id, kick_to_name, kick_by_name, kick_date, kick_reason) VALUES (%i, %i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid], g_PlayerAccountID[by_playerid], g_PlayerName[playerid], g_PlayerName[by_playerid],
			reason);
	}
	mysql_tquery(g_DBHandle, query);
}
