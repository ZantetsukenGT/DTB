
#include <YSI_Coding\y_hooks>

hook OnGameStart()
{
	for (new warzone; warzone < 4; warzone++)
	{
		new Float: minx,
			Float: miny,
			Float: maxx,
			Float: maxy;
		GetZoneLimits(warzone, minx, miny, maxx, maxy);
		g_ZoneID[warzone] = GangZoneCreate(minx, miny, maxx, maxy);
		GangZoneShowForAll(g_ZoneID[warzone], WARZONE_ALPHA);
	}
}
