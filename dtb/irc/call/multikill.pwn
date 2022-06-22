
#include <YSI_Coding\y_hooks>

hook OnPlayerMultiKill(playerid, kills)
{
	new message[100];
	format(message, sizeof(message), "1,7%s (ID: %i) has killed %i players in a row!", g_PlayerName[playerid], playerid, kills);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
}
