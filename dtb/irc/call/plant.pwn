
#include <YSI_Coding\y_hooks>

hook OnBombPlanted(playerid, bombsiteid)
{
	new message[100];
	format(message, sizeof(message), "1,7%s (ID: %i) has planted the bomb!", g_PlayerName[playerid], playerid);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
}
