#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	g_IsObjectiveShown = false;

	if (reason == REASON_DESTROYED || reason == REASON_DEFUSED)
	{
		foreach (new playerid : Player)
		{
			HidePlayerObjectiveTextdraw(playerid);
			if (IsPlayerSpawned(playerid))
				SetPlayerCameraAtBombsite(playerid, g_BombPlantSite);
		}
	}
	return 1;
}
