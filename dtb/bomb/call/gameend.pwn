
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	if (g_IsBombBeingPlanted)
		CancelPlayerPlantingBomb(g_BombPlanterID);
	if (g_IsBombBeingDefused)
		CancelPlayerDefusingBomb(g_BombDefuserID);
}
