
#include <YSI_Coding\y_hooks>

hook native GivePlayerWeapon(playerid, weaponid, ammo)
{
	new slot						  = GetWeaponSlot(weaponid);
	g_acWeaponData[playerid][slot][0] = weaponid;
	g_acWeaponData[playerid][slot][1] += ammo;
	g_acWeaponWarnings[playerid][slot] = 0;
	g_acWeaponSynced[playerid][slot]   = false;

	if (weaponid == 39)
		GivePlayerWeapon(playerid, 40, 1);

	return continue(playerid, weaponid, ammo);
}
