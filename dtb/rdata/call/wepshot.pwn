
#include <YSI_Coding\y_hooks>

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float: fX, Float: fY, Float: fZ)
{
	g_PlayerRoundShotsFired[playerid]++;
	if (hittype == BULLET_HIT_TYPE_PLAYER && g_PlayerTeam[playerid] != g_PlayerTeam[hitid])
		g_PlayerRoundShotsHit[playerid]++;
}
