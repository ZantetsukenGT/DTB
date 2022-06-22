
#include <YSI_Coding\y_hooks>

hook OnPlayerText(playerid, text[])
{
	if (text[0] == '!')
	{
		if (text[1] == '\0')
			return 0;

		new teamid = g_PlayerTeam[playerid];
		if (teamid == TEAM_ATTACK || teamid == TEAM_DEFEND)
		{
			new message[128];
			format(message, sizeof(message), "(%s) %s: %s", g_TeamNames[teamid], g_PlayerName[playerid], text[1]);

			foreach (new i : Player)
			{
				if (g_PlayerTeam[i] == teamid)
					SendClientMessage(i, COLOR_AQUA, message);
			}
		}
		else
			SendClientMessage(playerid, COLOR_RED, "This chat is restricted for teams!");
		return 0;
	}
	return 1;
}
