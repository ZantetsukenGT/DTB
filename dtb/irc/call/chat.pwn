
#include <YSI_Coding\y_hooks>

hook OnPlayerText(playerid, text[])
{
	// Neither team or admin chat
	if (text[0] != '!' && text[0] != '#')
	{
		new message[200];
		format(message, sizeof(message), "3%s (ID: %i):1 %s", g_PlayerName[playerid], playerid, text);
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
	}
}
