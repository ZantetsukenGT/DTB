
#include <YSI_Coding\y_hooks>

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float: fX, Float: fY, Float: fZ)
{
	switch (weaponid)
	{
		case 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 38: ac_CheckPlayerNoReload(playerid, weaponid);
		default: // spoof data
			return BanPlayer(playerid, "Spoof Weapon Data"), 0;
	}
	return 1;
}
