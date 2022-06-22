
#include <YSI_Coding\y_hooks>

hook OnPlayerBanned(playerid, by_playerid, const by_irc_user[], const reason[])
{
	new message[100];
	format(
		message, sizeof(message), "1,4<< %s (ID: %i) has gotten banned from the server, reason: %s.", g_PlayerName[playerid],
		playerid, reason);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
}
