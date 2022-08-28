
#include <YSI_Coding\y_hooks>

hook OnPlayerBanned(playerid, by_playerid, const reason[])
{
	new query[300];
	if (by_playerid == INVALID_PLAYER_ID)
	{
		mysql_format(
			g_DBHandle, query, sizeof(query),
			"INSERT INTO bans (ban_to_account_id, ban_to_name, ban_date, ban_reason) VALUES (%i, '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid], g_PlayerName[playerid], reason);
	}
	else
	{
		mysql_format(
			g_DBHandle, query, sizeof(query),
			"INSERT INTO bans (ban_to_account_id, ban_by_account_id, ban_to_name, ban_by_name, ban_date, ban_reason) VALUES (%i, %i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid], g_PlayerAccountID[by_playerid], g_PlayerName[playerid], g_PlayerName[by_playerid],
			reason);
	}
	mysql_tquery(g_DBHandle, query);
}
