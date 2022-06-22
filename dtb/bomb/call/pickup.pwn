
#include <YSI_Coding\y_hooks>

hook OnPlayerPickUpPickup(playerid, pickupid)
{
	if (pickupid == g_BombPickupID && g_BombPickupID != INVALID_PICKUP_ID)
	{
		if (g_PlayerTeam[playerid] != TEAM_ATTACK)
			return 1;

		if (g_GameState != STATE_STARTED)
			return 1;

		g_BombCarrierID = playerid;
		DestroyBombPickup();
		AttachPlayerBombToBack(playerid);
		PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
	}
	return 0;
}
