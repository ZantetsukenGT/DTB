
#include <YSI_Coding\y_hooks>

hook OnPlayerUpdate(playerid)
{
	if (g_IsPlayerKicked { playerid })
		return 0;
	return 1;
}
