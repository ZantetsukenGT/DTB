#include <YSI_Coding\y_hooks>

hook OnPlayerArmourSet(playerid, Float: new_armour, Float: old_armour)
{
	if (new_armour > 1.0)
	{
		new string[4];
		format(string, sizeof(string), "%i", floatround(new_armour));
		PlayerTextDrawSetString(playerid, g_PlayerArmourTD[playerid], string);
		PlayerTextDrawShow(playerid, g_PlayerArmourTD[playerid]);
	}
	else
		PlayerTextDrawHide(playerid, g_PlayerArmourTD[playerid]);
	return 1;
}
