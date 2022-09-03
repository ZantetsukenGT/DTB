
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (killerid != INVALID_PLAYER_ID)
	{
		new reason_name[20],
			Float: distance = 0.3048 * GetDistanceBetweenPlayers(playerid, killerid),
			Float: health = GetPlayerHealth(killerid),
			Float: armour = GetPlayerArmour(killerid),
			message[128];

		GetWeaponName(reason, reason_name, sizeof reason_name);

		format(
			message, sizeof(message), "%s {%06x}killed{%06x} %s {%06x}| %s | %.2fM | +%i", g_PlayerName[killerid],
			RGBAtoRGB(COLOR_WHITE), RGBAtoRGB(GetPlayerColor(playerid)), g_PlayerName[playerid], RGBAtoRGB(COLOR_WHITE),
			reason_name, distance, floatround(health) + floatround(armour));
		SendClientMessageToAll(GetPlayerColor(killerid), message);
	}
	SendDeathMessage(killerid, playerid, reason);
	return 1;
}
