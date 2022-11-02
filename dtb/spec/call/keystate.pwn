
#include <YSI_Coding\y_hooks>

static GetPrevTarget(target) { return target == Iter_First(Player) ? Iter_Last(Player) : Iter_Prev(Player, target); }
static GetNextTarget(target) { return target == Iter_Last(Player) ? Iter_First(Player) : Iter_Next(Player, target); }

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

			for (new target = GetPrevTarget(currentTarget); target != currentTarget; target = GetPrevTarget(target))
			{
				if (!IsPlayerSpawned(target)
					|| TEAM_ATTACK <= g_PlayerTeam[playerid] <= TEAM_DEFEND && g_PlayerTeam[playerid] != g_PlayerTeam[target])
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

			for (new target = GetNextTarget(currentTarget); target != currentTarget; target = GetNextTarget(target))
			{
				if (!IsPlayerSpawned(target)
					|| TEAM_ATTACK <= g_PlayerTeam[playerid] <= TEAM_DEFEND && g_PlayerTeam[playerid] != g_PlayerTeam[target])
					continue;

				PlayerSpectatePlayer(playerid, target);
				break;
			}
		}
	}
	return 1;
}
