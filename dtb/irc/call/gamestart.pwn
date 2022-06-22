
#include <YSI_Coding\y_hooks>

hook OnGameStart()
{
	new mapname[MAX_MAP_NAME + 1], message[100];

	GetMapName(mapname, sizeof(mapname), GetCurrentMapID);

	format(message, sizeof(message), "1,7A new round starts in %i seconds, map: %s", g_GameTime, mapname);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
}
