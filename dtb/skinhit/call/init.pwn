
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	// pistol whip
	SetWeaponDamage(WEAPON_PISTOLWHIP, DAMAGE_TYPE_STATIC, 10.0);

	// running weapons and cheap dmg
	SetWeaponDamage(WEAPON_COLT45, DAMAGE_TYPE_STATIC, 8.0);
	SetWeaponDamage(WEAPON_UZI, DAMAGE_TYPE_STATIC, 8.0);
	SetWeaponDamage(WEAPON_TEC9, DAMAGE_TYPE_STATIC, 8.0);
	SetWeaponDamage(WEAPON_MP5, DAMAGE_TYPE_STATIC, 10.0);

	// entice silenced and rifle, nerf deagle and sniper into the ground
	SetWeaponDamage(WEAPON_SILENCED, DAMAGE_TYPE_STATIC, 18.0);
	SetWeaponDamage(WEAPON_DEAGLE, DAMAGE_TYPE_STATIC, 25.0);
	SetWeaponDamage(WEAPON_RIFLE, DAMAGE_TYPE_STATIC, 33.0);
	SetWeaponDamage(WEAPON_SNIPER, DAMAGE_TYPE_STATIC, 30.0);

	// standard damage
	SetWeaponDamage(WEAPON_AK47, DAMAGE_TYPE_STATIC, 10.0);
	SetWeaponDamage(WEAPON_M4, DAMAGE_TYPE_STATIC, 10.0);
	SetWeaponDamage(WEAPON_VEHICLE_M4, DAMAGE_TYPE_STATIC, 10.0);

	// basically stun gun
	SetWeaponDamage(WEAPON_MINIGUN, DAMAGE_TYPE_STATIC, 0.5);
	return 1;
}
