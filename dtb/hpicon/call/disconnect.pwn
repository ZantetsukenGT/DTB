
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	if (g_pDamageIconCreated { playerid })
	{
		g_pDamageIconCreated { playerid } = false;
		DestroyObject(g_pDamageIconObject[playerid]);
	}
	return 1;
}
