new bool: g_IsPlayerKicked[MAX_PLAYERS char];

#define DelayKick(%0) (SetTimerEx("PublicKick", GetPlayerPing(%0 + 30), false, "i", %0))
