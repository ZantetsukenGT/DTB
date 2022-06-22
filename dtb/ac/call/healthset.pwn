
#include <YSI_Coding\y_hooks>

hook OnPlayerHealthSet(playerid, Float: new_health, Float: old_health)
{
	g_acHealth[playerid]			= new_health;
	g_acHealthWarnings { playerid } = 0;
}
