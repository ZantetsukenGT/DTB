
#include <YSI_Coding\y_hooks>

ClearPlayerChat(playerid)
{
	for (new i = 0; i < 99; i++) { SendClientMessage(playerid, COLOR_WHITE, ""); }
}

ClearChatForAll()
{
	for (new i = 0; i < 99; i++) { SendClientMessageToAll(COLOR_WHITE, ""); }
}

hook OnPlayerConnect(playerid) { ClearPlayerChat(playerid); }
