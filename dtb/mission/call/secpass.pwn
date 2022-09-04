#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	if (g_GameState == STATE_COUNTDOWN)
	{
		if (g_GameTime == 5)
		{
			g_ObjectiveBombsite = BOMBSITE_A;
			UpdateObjectiveTextdraws(g_ObjectiveBombsite);
		}
		else if (g_GameTime == 2)
		{
			g_ObjectiveBombsite = BOMBSITE_B;
			UpdateObjectiveTextdraws(g_ObjectiveBombsite);

			foreach (new playerid : Player)
			{
				if (!IsPlayerSpawned(playerid))
					continue;

				ShowPlayerObjectiveTextdraw(playerid);
				SetPlayerCameraAtBombsite(playerid, g_ObjectiveBombsite);
			}
		}
		else if (g_GameTime == 0)
		{
			g_ObjectiveBombsite = BOMBSITE_A;

			foreach (new playerid : Player)
			{
				HidePlayerObjectiveTextdraw(playerid);
				if (IsPlayerSpawned(playerid))
					SetCameraBehindPlayer(playerid);
			}
		}
	}
	else if (g_IsObjectiveShown && (gettime() - g_ObjectiveShownTime) >= 5)
	{
		g_IsObjectiveShown = false;

		foreach (new playerid : Player)
		{
			HidePlayerObjectiveTextdraw(playerid);
			if (!IsPlayerSpawned(playerid))
				continue;

			TogglePlayerControllable(playerid, true);
			SetCameraBehindPlayer(playerid);
		}
	}
	return 1;
}
