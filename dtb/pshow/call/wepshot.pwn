#include <YSI_Coding\y_hooks>

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float : fX, Float : fY, Float : fZ)
{
	if (IsBulletWeapon(weaponid) && weaponid != WEAPON_SILENCED)
		ShowPlayerForOpponents(playerid, true);
	return 1;
}
