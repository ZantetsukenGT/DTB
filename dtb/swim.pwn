
#include <YSI_Coding\y_hooks>

bool: IsPlayerSwimming(playerid)
{
	switch (GetPlayerAnimationIndex(playerid))
	{
		case 1250, 1538, 1539, 1540, 1541, 1542, 1544: return 1;
	}
	return 0;
}

hook OnPlayerUpdate(playerid)
{
	if (IsPlayerSpawned(playerid) && IsPlayerSwimming(playerid))
		SetPlayerHealth(playerid, 0.0);
}
