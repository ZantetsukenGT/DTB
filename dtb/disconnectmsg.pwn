
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	switch (reason)
	{
		case 0:
		{
			new message[128];
			format(message, sizeof(message), "<< %s (ID: %i) disconnected (Timed Out).", g_PlayerName[playerid], playerid);
			SendClientMessageToAll(COLOR_GREY, message);
		}
		case 1:
		{
			new message[128];
			format(message, sizeof(message), "<< %s (ID: %i) disconnected (Quit).", g_PlayerName[playerid], playerid);
			SendClientMessageToAll(COLOR_GREY, message);
		}
	}

	// Death Message
	SetPlayerColor(playerid, COLOR_WHITE);
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);
	return 1;
}
