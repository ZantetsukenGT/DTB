
#include <YSI_Coding\y_hooks>

hook OnGameStart()
{
	foreach (new playerid : Player)
	{
		TogglePlayerSpectating(playerid, false);
	}
}
