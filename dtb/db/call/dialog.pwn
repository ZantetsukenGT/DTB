
#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_LOGIN)
	{
		new accountid = g_PlayerAccountID[playerid];
		if (accountid == 0)
			return ~1;

		if (!g_IsPlayerRegistered { playerid })
			return ~1;

		if (!response)
		{
			ShowPlayerLoginDialog(playerid);
			return ~1;
		}

		if (inputtext[0] == 0)
		{
			SendClientMessage(playerid, COLOR_RED, "You did not enter any password!");
			ShowPlayerLoginDialog(playerid);
			return ~1;
		}

		new saltpass[MAX_PASSWORD + MAX_SALT + 1], hash[MAX_PASSWORD_HASH + 1];

		SaltPassword(saltpass, sizeof saltpass, inputtext, g_PlayerSalt[playerid]);
		WP_Hash(hash, sizeof hash, saltpass);

		if (!strcmp(g_PlayerPassword[playerid], hash))
			LoginPlayer(playerid, accountid, false);
		else
		{
			if (g_PlayerLoginAttempts { playerid } >= MAX_LOGIN_ATTEMPTS)
				KickPlayer(playerid, "Failed to login");
			else
			{
				g_PlayerLoginAttempts { playerid }++;
				ShowPlayerLoginDialog(playerid);
			}
		}
		return ~1;
	}
	return 1;
}
