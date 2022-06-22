COMMAND:get(playerid, params[])
{
	if (g_PlayerAdminLevel { playerid } < 1)
		return 0;

	new id;
	if (sscanf(params, "r", id))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Get <playerid/name>"), 1;

	if (id == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if (id == playerid)
		return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	if (!IsPlayerSpawned(playerid))
		return SendClientMessage(playerid, COLOR_RED, "You are not spawned!"), 1;

	if (!IsPlayerSpawned(id))
		return SendClientMessage(playerid, COLOR_RED, "This player is not spawned!"), 1;

	new Float: x,
		Float: y,
		Float: z,
		vehicleid = GetPlayerVehicleID(playerid);

	if (vehicleid)
		GetVehiclePos(vehicleid, x, y, z);
	else
		GetPlayerPos(playerid, x, y, z);
	SetPlayerPos(id, x, y, z);
	return 1;
}
