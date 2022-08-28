hook OnPlayerAccountLoaded(playerid)
{
	new rows;
	if (!cache_get_row_count(rows))
		return 1;
	if (rows == 0)
	{
		SendClientMessage(playerid, COLOR_RED, "This name is not registered! Use /Register to register this name.");

		new query[100];
		mysql_format(
			g_DBHandle, query, sizeof(query), "INSERT INTO accounts (account_name) VALUES ('%e')", g_PlayerName[playerid]);
		mysql_tquery(g_DBHandle, query, "OnPlayerAccountCreated", "i", playerid);
	}
	else
	{
		new is_registered;
		cache_get_value_int(0, "account_id", g_PlayerAccountID[playerid]);
		cache_get_value_int(0, "account_registered", is_registered);
		g_IsPlayerRegistered { playerid } = is_registered ? true : false;

		if (g_IsPlayerRegistered { playerid } == false)
			SendClientMessage(playerid, COLOR_RED, "This name is not registered! Use /Register to register this name.");
		else
		{
			cache_get_value(0, "account_password", g_PlayerPassword[playerid]);
			cache_get_value(0, "account_salt", g_PlayerSalt[playerid]);

			new admin_level;
			cache_get_value_int(0, "account_admin", admin_level);
			g_PlayerAdminLevel { playerid } = admin_level;
			cache_get_value_int(0, "account_kills", g_PlayerKills[playerid]);
			cache_get_value_int(0, "account_deaths", g_PlayerDeaths[playerid]);
			cache_get_value_int(0, "account_games_won", g_PlayerGamesWon[playerid]);
			cache_get_value_int(0, "account_games_lost", g_PlayerGamesLost[playerid]);
			cache_get_value_int(0, "account_bombs_planted", g_PlayerBombsPlanted[playerid]);
			cache_get_value_int(0, "account_bombs_defused", g_PlayerBombsDefused[playerid]);
			cache_get_value_int(0, "account_playtime", g_PlayerPlayTime[playerid]);
			new player_level;
			cache_get_value_int(0, "account_level", player_level);
			g_PlayerLevel { playerid } = player_level;
			cache_get_value_int(0, "account_xp", g_PlayerXP[playerid]);

			new query[100];
			mysql_format(
				g_DBHandle, query, sizeof(query),
				"SELECT * FROM sessions WHERE session_account_id = %i ORDER BY session_end DESC LIMIT 1",
				g_PlayerAccountID[playerid]);
			mysql_tquery(g_DBHandle, query, "OnPlayerAutoLogin", "i", playerid);
		}
	}
	return 1;
}
