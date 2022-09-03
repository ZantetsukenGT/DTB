#include <YSI_Coding\y_hooks>

hook OnRconLoginAttempt(ip[], password[], success)
{
	static id, level;
	foreach (new i : Player)
	{
		new pIP[MAX_IPV4 + 1] = "";
		GetPlayerIp(i, pIP);
		if (!strcmp(pIP, ip))
		{
			id = i;
			break;
		}
	}
	new message[128];
	if (success)
	{
		level = 2;
		g_PlayerAdminLevel { id } = level;

		new query[200];

		mysql_format(
			g_DBHandle, query, sizeof(query),
			"INSERT INTO setadmin (setadmin_to_account_id, setadmin_by_account_id, setadmin_level, setadmin_date) VALUES (%i, %i, %i, NOW())",
			g_PlayerAccountID[id], g_PlayerAccountID[id], level);
		mysql_tquery(g_DBHandle, query);

		format(
			message, sizeof(message), "%s (ID: %i) has logged into RCON and was given admin level %i (%s).",
			g_PlayerName[id], id, level, GetAdminLevelName(level));

		SendClientMessageToAll(COLOR_ORANGE, message);
	}
	else
	{
		format(
			message, sizeof(message), "%s (ID: %i) failed to log into RCON.",
			g_PlayerName[id], id);

		SendClientMessageToAll(COLOR_ORANGE, message);
	}
	return 1;
}
