
#include <YSI_Coding\y_hooks>

hook OnPlayerLeaveTeam(playerid, teamid, reason)
{
	new total_players, alive_players, dead_players;

	GetTeamPlayers(teamid, total_players, alive_players, dead_players);

	if (teamid == TEAM_ATTACK && !g_IsBombPlanted && alive_players == 0)
	{
		if (reason == LEAVE_TEAM_DISCONNECT)
			EndGame(REASON_ATTACK_DISCONNECT);
		else if (reason == LEAVE_TEAM_DEATH)
			EndGame(REASON_ATTACK_KILLED);
	}
	else if (teamid == TEAM_DEFEND && alive_players == 0)
	{
		if (reason == LEAVE_TEAM_DISCONNECT)
			EndGame(REASON_DEFEND_DISCONNECT);
		else if (reason == LEAVE_TEAM_DEATH)
			EndGame(REASON_DEFEND_KILLED);
	}
}
