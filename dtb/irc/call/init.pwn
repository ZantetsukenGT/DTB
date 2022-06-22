
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	g_IRCGroupID = IRC_CreateGroup();
	for (new bot, delay; bot < MAX_IRC_BOTS; bot++)
	{
		delay += 5;

		g_IRCBotID[bot] = IRC_Connect(IRC_SERVER, IRC_PORT, g_IRCBotNames[bot], g_IRCBotNames[bot], g_IRCBotNames[bot]);
		IRC_SetIntData(g_IRCBotID[bot], E_IRC_CONNECT_DELAY, delay);
	}
}
