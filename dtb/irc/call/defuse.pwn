
#include <YSI_Coding\y_hooks>

hook OnBombDefused(playerid, bombsiteid)
{
	new message[100];
	format(message, sizeof(message), "1,7%s (ID: %i) has defused the bomb!", g_PlayerName[playerid], playerid);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
}
