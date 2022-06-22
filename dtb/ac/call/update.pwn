
#include <YSI_Coding\y_hooks>

static previous_tick[MAX_PLAYERS];
static previous_vehicle[MAX_PLAYERS];

hook OnPlayerConnect(playerid) { previous_tick[playerid] = GetTickCount() - 1100; }

hook OnPlayerUpdate(playerid)
{
	if (GetTickCount() - previous_tick[playerid] > 1000)
	{
		ac_CheckPlayerMoney(playerid);
		ac_CheckPlayerArmour(playerid);
		ac_CheckPlayerHealth(playerid);
		ac_CheckPlayerJetpack(playerid);
		ac_CheckPlayerWeapons(playerid);
		ac_IsPlayerFlyhacking(playerid);

		previous_tick[playerid] = GetTickCount();
	}

	new vehicleid = GetPlayerVehicleID(playerid);
	if (vehicleid != previous_vehicle[playerid])
	{
		ac_CheckPlayerFlooding(playerid);
		previous_vehicle[playerid] = vehicleid;
	}
}
