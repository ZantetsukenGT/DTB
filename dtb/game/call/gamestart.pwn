
#include <YSI_Coding\y_hooks>

hook function OnGameStart()
{
	foreach (new playerid : Player)
	{
		TogglePlayerSpectating(playerid, false);
	}
	return continue();
}
