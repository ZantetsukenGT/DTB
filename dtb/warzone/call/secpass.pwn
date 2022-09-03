
#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	if (g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		for (new warzone; warzone < 4; warzone++) GangZoneDestroy(g_ZoneID[warzone]);
	}
	return 1;
}
