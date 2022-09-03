
#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	g_pDamageIconTick[playerid] = GetTickCount() - 1100;
	return 1;
}

hook OnPlayerUpdate(playerid)
{
	if (g_pDamageIconCreated { playerid } && (GetTickCount() - g_pDamageIconTick[playerid]) > 1000)
	{
		g_pDamageIconCreated { playerid } = false;
		DestroyObject(g_pDamageIconObject[playerid]);
	}
	return 1;
}
