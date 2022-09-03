
#include <YSI_Coding\y_hooks>

hook SkipClass(playerid)
{
	SpawnPlayer(playerid);
	return 1;
}

hook OnPlayerRequestClass(playerid, classid)
{
	SetTimerEx("SkipClass", 5, false, "i", playerid);
	return 1;
}
