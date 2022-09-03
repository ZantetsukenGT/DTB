
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	new teamid = g_PlayerTeam[playerid];
	switch (teamid)
	{
		case TEAM_ATTACK, TEAM_DEFEND:
		{
			// Preload Bomb Anim
			PreloadAnimLib(playerid, "BOMBER");

			// Attached Bomb
			if (g_BombCarrierID != playerid)
				UnattachBombFromPlayer(playerid);

			// Bombsite Mapicons
			for (new bombsite; bombsite < 2; bombsite++)
				ShowPlayerBombsiteIcon(playerid, bombsite, g_IsBombsiteCreated { bombsite });

			// Bomb Icon for Attackers
			if (teamid == TEAM_ATTACK && g_BombPickupID != INVALID_PICKUP_ID)
				ShowPlayerBombIcon(playerid, true);
			else
				ShowPlayerBombIcon(playerid, false);
		}
	}
	return 1;
}
