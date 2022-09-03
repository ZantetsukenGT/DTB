
#include <YSI_Coding\y_hooks>

bool: IsPlayerSwimming(playerid)
{
	switch (GetPlayerAnimationIndex(playerid))
	{
		case 1250, 1538, 1539, 1540, 1541, 1542, 1544: return true;
	}
	return false;
}

hook OnPlayerUpdate(playerid)
{
	if (IsPlayerSpawned(playerid) && IsPlayerSwimming(playerid))
		SetPlayerHealth(playerid, 0.0);
	return 1;
}
