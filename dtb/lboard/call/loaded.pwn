forward OnLeaderboardLoaded(playerid, dialogid);
public OnLeaderboardLoaded(playerid, dialogid)
{
	switch (dialogid)
	{
		case DIALOG_LB_KILLS:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), kills, name[MAX_PLAYER_NAME + 1];
				cache_get_value_int(row, "account_kills", kills);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, kills);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Kills", full_info, "Back", "");
		}
		case DIALOG_LB_DEATHS:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), deaths, name[MAX_PLAYER_NAME + 1];
				cache_get_value_int(row, "account_deaths", deaths);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, deaths);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Deaths", full_info, "Back", "");
		}
		case DIALOG_LB_MULTIKILL:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), multi_kill, name[MAX_PLAYER_NAME + 1];
				cache_get_value_int(row, "account_multikill", multi_kill);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, multi_kill);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(
				playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Best Multi-Kills", full_info, "Back", "");
		}
		case DIALOG_LB_KD:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), Float: kdratio,
					name[MAX_PLAYER_NAME + 1];
				cache_get_value_float(row, "account_kdratio", kdratio);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%.2f\n", row_color, row + 1, name, kdratio);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: K/D Ratio", full_info, "Back", "");
		}
		case DIALOG_LB_WONGAMES:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), games_won, name[MAX_PLAYER_NAME + 1];

				cache_get_value_int(row, "account_games_won", games_won);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, games_won);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Rounds Won", full_info, "Back", "");
		}
		case DIALOG_LB_LOSTGAMES:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), games_lost, name[MAX_PLAYER_NAME + 1];
				cache_get_value_int(row, "account_games_lost", games_lost);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, games_lost);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Rounds Lost", full_info, "Back", "");
		}
		case DIALOG_LB_ALLGAMES:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), games_played, name[MAX_PLAYER_NAME + 1];

				cache_get_value_int(row, "account_games_played", games_played);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, games_played);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(
				playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Rounds Played", full_info, "Back", "");
		}
		case DIALOG_LB_WL:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), Float: wlratio,
					name[MAX_PLAYER_NAME + 1];

				cache_get_value_float(row, "account_wlratio", wlratio);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%.2f\n", row_color, row + 1, name, wlratio);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: W/L Ratio", full_info, "Back", "");
		}
		case DIALOG_LB_PLANTED:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), bombs_planted, name[MAX_PLAYER_NAME + 1];

				cache_get_value_int(row, "account_bombs_planted", bombs_planted);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, bombs_planted);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(
				playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Bombs Planted", full_info, "Back", "");
		}
		case DIALOG_LB_DEFUSED:
		{
			new sub_info[50], full_info[500], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), bombs_defused, name[MAX_PLAYER_NAME + 1];

				cache_get_value_int(row, "account_bombs_defused", bombs_defused);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i\n", row_color, row + 1, name, bombs_defused);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(
				playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Bombs Defused", full_info, "Back", "");
		}
		case DIALOG_LB_TIME:
		{
			new sub_info[100], full_info[1000], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), playtime, name[MAX_PLAYER_NAME + 1];

				cache_get_value_int(row, "account_playtime", playtime);
				cache_get_value(row, "account_name", name);

				format(
					sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%s\n", row_color, row + 1, name, TimeToString(playtime));
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Playtime", full_info, "Back", "");
		}
		case DIALOG_LB_LEVEL:
		{
			new sub_info[100], full_info[1000], rows;
			cache_get_row_count(rows);
			for (new row; row < rows; row++)
			{
				new row_color = IsOdd(row) ? (0xFF0000) : (0xFFFFFF), level, xp, name[MAX_PLAYER_NAME + 1];

				cache_get_value_int(row, "account_level", level);
				cache_get_value_int(row, "account_xp", xp);
				cache_get_value(row, "account_name", name);

				format(sub_info, sizeof(sub_info), "{%x}%02i. %s\n\t\t\t\t%i (%i XP)\n", row_color, row + 1, name, level + 1, xp);
				strcat(full_info, sub_info);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "{FFFFFF}Leaderboard: Level", full_info, "Back", "");
		}
	}
	return 1;
}
