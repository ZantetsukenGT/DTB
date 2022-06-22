#define MAX_WARZONE_LIMIT	 (4000.0)
#define MIN_WARZONE_LIMIT	 (-4000.0)
#define WARZONE_ALPHA		 (200)
#define MAX_WARZONE_WARNINGS (10)

enum
{
	ZONE_WEST,
	ZONE_EAST,
	ZONE_NORTH,
	ZONE_SOUTH
};

new g_ZoneID[4];
new bool: g_IsPlayerInZone[MAX_PLAYERS char];
new g_PlayerZoneWarnings[MAX_PLAYERS char];
new PlayerText: g_ZoneBackgroundTD[MAX_PLAYERS] = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_ZoneTextTD[MAX_PLAYERS]		= { PlayerText: INVALID_TEXT_DRAW, ... };
