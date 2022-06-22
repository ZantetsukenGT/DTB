
#include <YSI_Coding\y_hooks>

hook OnPlayerUpdate(playerid)
{
	static last_lr[MAX_PLAYERS];

	new keys, ud, lr;

	GetPlayerKeys(playerid, keys, ud, lr);

	if (IsPlayerSpectating(playerid) && lr != last_lr[playerid])
	{
		if (lr == KEY_LEFT)
		{
			new target = GetPlayerSpectatePlayer(playerid), total_players, alive_players, dead_players;

			GetTeamPlayers(g_PlayerTeam[playerid], total_players, alive_players, dead_players);

			for (; (target = Iter_Prev(Player, target)) != Iter_Begin(Player);)
			{
				if (!IsPlayerSpawned(target))
					continue;

				if ((g_PlayerTeam[playerid] == TEAM_ATTACK || g_PlayerTeam[playerid] == TEAM_DEFEND)
					&& g_PlayerTeam[playerid] != g_PlayerTeam[target] && alive_players > 0)
				{
					continue;
				}

				PlayerSpectatePlayer(playerid, target);
				break;
			}
		}
		else if (lr == KEY_RIGHT)
		{
			new target = GetPlayerSpectatePlayer(playerid), total_players, alive_players, dead_players;

			GetTeamPlayers(g_PlayerTeam[playerid], total_players, alive_players, dead_players);

			for (; (target = Iter_Next(Player, target)) != Iter_End(Player);)
			{
				if (!IsPlayerSpawned(target))
					continue;

				if ((g_PlayerTeam[playerid] == TEAM_ATTACK || g_PlayerTeam[playerid] == TEAM_DEFEND)
					&& g_PlayerTeam[playerid] != g_PlayerTeam[target] && alive_players > 0)
				{
					continue;
				}

				PlayerSpectatePlayer(playerid, target);
				break;
			}
		}
	}

	last_lr[playerid] = lr;
}
