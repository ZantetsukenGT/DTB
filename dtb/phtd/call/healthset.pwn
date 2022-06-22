#include <YSI_Coding\y_hooks>

hook OnPlayerHealthSet(playerid, Float: new_health, Float: old_health)
{
	if (new_health > 0.0)
	{
		new string[7];
		format(string, sizeof(string), "~r~%i", floatround(new_health));
		PlayerTextDrawSetString(playerid, g_PlayerHealthTD[playerid], string);
		PlayerTextDrawShow(playerid, g_PlayerHealthTD[playerid]);
	}
	else
		PlayerTextDrawHide(playerid, g_PlayerHealthTD[playerid]);
}
