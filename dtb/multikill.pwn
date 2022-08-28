
#include <YSI_Coding\y_hooks>

static last_kill_time[MAX_PLAYERS];
static stacked_kills[MAX_PLAYERS];

hook OnPlayerConnect(playerid) { last_kill_time[playerid] = GetTickCount() - 11000; }

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (killerid != INVALID_PLAYER_ID)
	{
		if (GetTickCount() - last_kill_time[killerid] > 10000)
			stacked_kills[killerid] = 1;
		else
		{
			new message[128];
			switch (++stacked_kills[killerid])
			{
				case 2:
				{
					format(
						message, sizeof(message), "%s (ID: %i) {FFFFFF}scored a double kill!", g_PlayerName[killerid], killerid);
				}
				case 3:
				{
					format(
						message, sizeof(message), "%s (ID: %i) {FFFFFF}scored a triple kill!", g_PlayerName[killerid], killerid);
				}
				case 4:
				{
					format(message, sizeof(message), "%s (ID: %i) {FFFFFF}scored a quad kill!", g_PlayerName[killerid], killerid);
				}
				default:
				{
					format(
						message, sizeof(message), "%s (ID: %i) {FFFFFF}scored a multi kill!", g_PlayerName[killerid], killerid);
				}
			}
			SendClientMessageToAll(GetPlayerColor(killerid), message);

			CallLocalFunction("OnPlayerMultiKill", "ii", killerid, stacked_kills[killerid]);
		}
		last_kill_time[killerid] = GetTickCount();
	}
}
