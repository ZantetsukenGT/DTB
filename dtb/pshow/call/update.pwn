#include <YSI_Coding\y_hooks>

hook OnPlayerUpdate(playerid)
{
	new targetid = GetPlayerTargetPlayer(playerid);
	if (targetid != INVALID_PLAYER_ID)
	{
		new teamid = g_PlayerTeam[playerid], target_teamid = g_PlayerTeam[targetid];

		if (GetTeamOpponents(teamid) == target_teamid)
			ShowPlayerForOpponents(targetid, true);
	}

	if (g_IsPlayerShown { playerid } && (gettime() - g_LastPlayerShowTime[playerid]) >= 3)
		ShowPlayerForOpponents(playerid, false);
}
