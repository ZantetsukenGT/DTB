
#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	new message[128];
	format(
		message, sizeof(message), ">> %s (ID: %i) connected from %s.", g_PlayerName[playerid], playerid,
		g_PlayerCountry[playerid]);
	SendClientMessageToAll(COLOR_GREY, message);

	SetPlayerColor(playerid, COLOR_WHITE);
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);
}
