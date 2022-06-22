
#include <YSI_Coding\y_hooks>

static previous_tick[MAX_PLAYERS];
hook OnPlayerConnect(playerid) { previous_tick[playerid] = GetTickCount() - (MIN_AC_FLOOD_RATE + 10); }

bool: ac_CheckPlayerFlooding(playerid)
{
	static flood_warnings[MAX_PLAYERS char];

	if (GetTickCount() - previous_tick[playerid] > MIN_AC_FLOOD_RATE)
		flood_warnings { playerid } = 0;
	else
	{
		if (flood_warnings { playerid } >= MAX_AC_FLOOD_WARNINGS)
			KickPlayer(playerid, "Flooding");
		else
			flood_warnings { playerid }++;
	}

	previous_tick[playerid] = GetTickCount();
	return flood_warnings { playerid } >= MAX_AC_FLOOD_WARNINGS;
}
