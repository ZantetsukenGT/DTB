
#include <YSI_Coding\y_hooks>

forward SkipClass(playerid);
public SkipClass(playerid) { return SpawnPlayer(playerid); }

hook OnPlayerRequestClass(playerid, classid) { SetTimerEx("SkipClass", 5, false, "i", playerid); }
