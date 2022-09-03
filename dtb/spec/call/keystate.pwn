
#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (IsPlayerSpectating(playerid))
	{
		if (KEY_PRESSED(KEY_FIRE))
		{
			new currentTarget = GetPlayerSpectatePlayer(playerid);
			if (currentTarget == INVALID_PLAYER_ID)
			{
				currentTarget = Iter_Random(Player);
				if (currentTarget == cellmin)
					return 1;
			}

			for (new target = currentTarget;;)
			{
				if ((target = Iter_Prev(Player, target)) == Iter_Begin(Player))
					target = Iter_Last(Player);
				if (target == currentTarget)
					break;
				if (!IsPlayerSpawned(target))
					continue;

				if (TEAM_ATTACK <= g_PlayerTeam[playerid] <= TEAM_DEFEND && g_PlayerTeam[playerid] != g_PlayerTeam[target])
					continue;

				PlayerSpectatePlayer(playerid, target);
				break;
			}
		}
		else if (KEY_PRESSED(KEY_HANDBRAKE))
		{
			new currentTarget = GetPlayerSpectatePlayer(playerid);
			if (currentTarget == INVALID_PLAYER_ID)
			{
				currentTarget = Iter_Random(Player);
				if (currentTarget == cellmin)
					return 1;
			}

			for (new target = currentTarget;;)
			{
				if ((target = Iter_Next(Player, target)) == Iter_End(Player))
					target = Iter_First(Player);
				if (target == currentTarget)
					break;
				if (!IsPlayerSpawned(target))
					continue;

				if (TEAM_ATTACK <= g_PlayerTeam[playerid] <= TEAM_DEFEND && g_PlayerTeam[playerid] != g_PlayerTeam[target])
					continue;

				PlayerSpectatePlayer(playerid, target);
				break;
			}
		}
	}
	return 1;
}
