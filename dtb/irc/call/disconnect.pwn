
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	switch (reason)
	{
		case 0:
		{
			new message[100];
			format(
				message, sizeof(message), "1,3<< %s (ID: %i) disconnected from the server (Timed Out).", g_PlayerName[playerid],
				playerid);
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
		}
		case 1:
		{
			new message[100];
			format(
				message, sizeof(message), "1,3<< %s (ID: %i) disconnected from the server (Quit).", g_PlayerName[playerid],
				playerid);
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
		}
	}
}
