#include <YSI_Coding\y_hooks>

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_SPECTATING)
	{
		PlayerTextDrawHide(playerid, g_PlayerHealthTD[playerid]);
		PlayerTextDrawHide(playerid, g_PlayerArmourTD[playerid]);
	}
	return 1;
}
