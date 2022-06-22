
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	for (new warzone; warzone < 4; warzone++) GangZoneShowForPlayer(playerid, g_ZoneID[warzone], WARZONE_ALPHA);
}
