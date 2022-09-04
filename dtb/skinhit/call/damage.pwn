
public OnPlayerDamage(&playerid, &Float: amount, &issuerid, &weapon, &bodypart)
{
	if (issuerid != INVALID_PLAYER_ID && g_PlayerTeam[issuerid] == g_PlayerTeam[playerid])
		return 0;

	if (IsBulletWeapon(weapon))
	{
		switch (weapon)
		{
			case WEAPON_COLT45: amount *= 2.5;
			case WEAPON_MP5, WEAPON_UZI, WEAPON_TEC9: amount *= 1.5;
			case WEAPON_AK47, WEAPON_M4, WEAPON_VEHICLE_M4: amount *= 1.25;
			case WEAPON_RIFLE, WEAPON_SNIPER: amount *= 1.3;
			case WEAPON_DEAGLE: amount *= 1.2;
		}
	}
	CheckHealthBefore(playerid, GetPlayerHealth(playerid));
	CheckArmourBefore(playerid, GetPlayerArmour(playerid));

	return 1;
}
