#include <YSI_Coding\y_hooks>

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float: fX, Float: fY, Float: fZ)
{
	switch (weaponid)
	{
		case 22, 24, 25, 26, 27, 28, 32, 29, 30, 31, 33, 34, 38: ShowPlayerForOpponents(playerid, true);
	}
	return 1;
}
