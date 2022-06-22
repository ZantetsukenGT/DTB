
#include <YSI_Coding\y_hooks>

static g_PlayerFramerate[MAX_PLAYERS];
static old_drunk[MAX_PLAYERS];

stock GetPlayerFramerate(playerid)
{
	new current_fps = g_PlayerFramerate[playerid];
	return current_fps - 1 <= 0 ? 0 : current_fps - 1;
}

hook OnPlayerUpdate(playerid)
{
	new new_drunk = GetPlayerDrunkLevel(playerid);
	if (new_drunk <= 100)
		SetPlayerDrunkLevel(playerid, 2000);
	else if (new_drunk != old_drunk[playerid])
	{
		new framerate = old_drunk[playerid] - new_drunk;
		if (framerate > 0)
			g_PlayerFramerate[playerid] = framerate;

		old_drunk[playerid] = new_drunk;
	}
}
