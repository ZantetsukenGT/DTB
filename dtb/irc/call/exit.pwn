
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	IRC_DestroyGroup(g_IRCGroupID);
	for (new bot; bot < MAX_IRC_BOTS; bot++) IRC_Quit(g_IRCBotID[bot], "Server Shutdown");
}
