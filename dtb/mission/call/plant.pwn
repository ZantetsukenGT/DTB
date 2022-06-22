#include <YSI_Coding\y_hooks>

hook OnBombPlanted(playerid, bombsiteid)
{
	g_IsObjectiveShown	 = true;
	g_ObjectiveShownTime = gettime();

	UpdateObjectiveTextdraws(bombsiteid);

	foreach (new loop_playerid : Player)
	{
		if (!IsPlayerSpawned(loop_playerid))
			continue;

		ShowPlayerObjectiveTextdraw(loop_playerid);
		SetPlayerCameraAtBombsite(loop_playerid, bombsiteid);
		TogglePlayerControllable(loop_playerid, false);
	}
}
