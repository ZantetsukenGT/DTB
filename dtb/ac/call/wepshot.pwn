
#include <YSI_Coding\y_hooks>

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float: fX, Float: fY, Float: fZ)
{
	ac_CheckPlayerNoReload(playerid, weaponid);
	return 1;
}
