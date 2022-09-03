
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	if (g_PlayerTeam[playerid] == TEAM_SPECTATE)
	{
		TogglePlayerSpectating(playerid, true);
		return ~1;
	}

	if (g_PlayerTeam[playerid] == TEAM_NONE)
	{
		if (g_GameState > STATE_COUNTDOWN)
		{
			// Enter Spectate Mode
			TogglePlayerSpectating(playerid, true);

			// Send message to player
			SendClientMessage(playerid, COLOR_RED, "You cannot spawn! The round has already started.");

			// Set team to spectator
			PlayerJoinTeam(playerid, TEAM_SPECTATE);
			return ~1;
		}

		new teamid = GetTeamToJoin(), total_players, alive_players, dead_players;

		GetTeamPlayers(teamid, total_players, alive_players, dead_players);

		if (total_players > MAX_TEAM_PLAYERS)
		{
			// Enter Spectate Mode
			TogglePlayerSpectating(playerid, true);

			// Send message to player
			SendClientMessage(playerid, COLOR_RED, "You cannot join any team! Both teams are full.");

			// Set team to spectator
			PlayerJoinTeam(playerid, TEAM_SPECTATE);
			return ~1;
		}

		PlayerJoinTeam(playerid, teamid);
	}
	return 1;
}
