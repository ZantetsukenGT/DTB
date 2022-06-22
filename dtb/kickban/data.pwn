new bool: g_IsPlayerKicked[MAX_PLAYERS char];

#define DelayKick(%0) (SetTimerEx("PublicKick", GetPlayerPing(%0 + 30), false, "i", %0))

forward OnPlayerKicked(playerid, by_playerid, const by_irc_user[], const reason[]);
forward OnPlayerBanned(playerid, by_playerid, const by_irc_user[], const reason[]);
