
#include <YSI_Coding\y_hooks>

hook OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	if (issuerid == INVALID_PLAYER_ID || (weaponid == 37 || weaponid == 49 || weaponid == 50 || weaponid == 51)
		|| (GetPlayerState(issuerid) == PLAYER_STATE_DRIVER && (weaponid == 31 || weaponid == 38)))
	{
		DamagePlayer(playerid, issuerid, amount, weaponid, bodypart);
	}
}
