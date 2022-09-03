
#include <YSI_Coding\y_hooks>

hook OnPlayerText(playerid, text[])
{
	if (text[0] == '#')
	{
		new start = 1, end = strlen(text);
		if (!Trim_HasContent(text, start, end))
			return ~0;

		if (g_PlayerAdminLevel { playerid } > 0)
		{
			new message[144];
			format(message, sizeof(message), "(Admins) %s: %s", g_PlayerName[playerid], text[start]);

			foreach (new i : Player)
			{
				if (g_PlayerAdminLevel { i } > 0)
					SendClientMessage(i, COLOR_ORANGE, message);
			}
		}
		else
			SendClientMessage(playerid, COLOR_RED, "This chat is restricted for admins!");
		return ~0;
	}
	return 1;
}
