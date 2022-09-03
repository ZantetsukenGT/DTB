
#include <YSI_Coding\y_hooks>

hook OnPlayerLeaveTeam(playerid, teamid, reason)
{
	if (!g_IsBombPlanted && g_BombCarrierID == playerid)
	{
		if (g_IsBombBeingPlanted)
			CancelPlayerPlantingBomb(playerid);

		new Float: x,
			Float: y,
			Float: z;
		GetPlayerPos(playerid, x, y, z);
		CreateBombPickup(x, y, z);
	}
	else if (g_IsBombBeingDefused && g_BombDefuserID == playerid)
		CancelPlayerDefusingBomb(playerid);
	return 1;
}
