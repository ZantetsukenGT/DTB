
#include <YSI_Coding\y_hooks>

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	switch (newstate)
	{
		case PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER:
		{
			SetPlayerArmedWeapon(playerid, 0);

			new vehicleid = GetPlayerVehicleID(playerid);
			foreach (new spectatorid : Player)
			{
				if (!IsPlayerSpectating(spectatorid))
					continue;

				if (GetPlayerSpectatePlayer(spectatorid) == playerid)
					PlayerSpectateVehicle(spectatorid, vehicleid);
			}
		}
		case PLAYER_STATE_ONFOOT:
		{
			foreach (new spectatorid : Player)
			{
				if (!IsPlayerSpectating(spectatorid))
					continue;

				if (GetPlayerSpectatePlayer(spectatorid) == playerid)
					PlayerSpectatePlayer(spectatorid, playerid);
			}
		}
		case PLAYER_STATE_SPECTATING:
		{
			new total_players, alive_players, dead_players;

			GetTeamPlayers(g_PlayerTeam[playerid], total_players, alive_players, dead_players);

			SetPlayerSpectateMap(playerid);

			foreach (new new_target : Player)
			{
				if (!IsPlayerSpawned(new_target))
					continue;

				if ((g_PlayerTeam[playerid] == TEAM_ATTACK || g_PlayerTeam[playerid] == TEAM_DEFEND)
					&& g_PlayerTeam[playerid] != g_PlayerTeam[new_target] && alive_players > 0)
				{
					continue;
				}

				PlayerSpectatePlayer(playerid, new_target);
				break;
			}
		}
	}
}
