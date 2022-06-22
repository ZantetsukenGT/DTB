
#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	new message[150];
	format(
		message, sizeof(message), "1,3>> %s (ID: %i) connected to the server from %s.", g_PlayerName[playerid], playerid,
		g_PlayerCountry[playerid]);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
}
