#define MIN_XP_VALUE	(497.0)
#define MAX_XP_VALUE	(605.0)
#define OFFSET_XP_VALUE (MAX_XP_VALUE - MIN_XP_VALUE)

new g_PlayerLevel[MAX_PLAYERS char];
new g_PlayerXP[MAX_PLAYERS];
new PlayerText: g_PlayerLevelBoxTD[MAX_PLAYERS]	  = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_PlayerXPMaxTD[MAX_PLAYERS]	  = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_PlayerXPProgressTD[MAX_PLAYERS] = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_PlayerLevelTextTD[MAX_PLAYERS]  = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_PlayerXPTextTD[MAX_PLAYERS]	  = { PlayerText: INVALID_TEXT_DRAW, ... };

#define GetLevelXP(%0) ((%0 * 10) + 10)
