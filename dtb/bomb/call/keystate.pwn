
#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		new bombsiteid = g_PlayerBombsite { playerid };
		if (KEY_PRESSED(KEY_SECONDARY_ATTACK) && bombsiteid != INVALID_BOMBSITE_ID)
		{
			if (!g_IsBombPlanted && g_BombCarrierID == playerid)
				StartPlayerPlantingBomb(playerid, bombsiteid);
			else if (
				g_PlayerTeam[playerid] == TEAM_DEFEND && g_IsBombPlanted && !g_IsBombDefused && !g_IsBombBeingDefused
				&& g_BombPlantSite == bombsiteid)
				StartPlayerDefusingBomb(playerid);
		}
		else if (KEY_RELEASED(KEY_SECONDARY_ATTACK))
		{
			if (g_IsBombBeingPlanted && g_BombPlanterID == playerid)
				CancelPlayerPlantingBomb(playerid);
			else if (g_IsBombBeingDefused && g_BombDefuserID == playerid)
				CancelPlayerDefusingBomb(playerid);
		}
	}
	return 1;
}
