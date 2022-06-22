
#include <YSI_Coding\y_hooks>

#define OnPlayerClickPlayerTextDraw OnPClickPTD

hook OnPClickPTD(playerid, PlayerText: playertextid)
{
	SendClientMessage(playerid, COLOR_GREEN, "OnPClickPTD");

	if (playertextid == g_WeaponMenuBackTD[playerid])
	{
		ShowPlayerWeaponMenu(playerid, 0);
		PlayerPlaySound(playerid, 4203, 0.0, 0.0, 0.0);
		return 1;
	}
	for (new item, limit = sizeof(g_MenuWeapons); item < limit; item++)
	{
		if (playertextid == g_WeaponMenuIconTD[playerid][item])
		{
			new menu_index						   = g_pWeaponMenu { playerid };
			g_pChosenWeapons[playerid][menu_index] = g_pMenuWeapons[playerid][item];

			if (menu_index == 0)
				ShowPlayerWeaponMenu(playerid, 1);
			else if (menu_index == 1)
			{
				new weaponid[2], weaponname[2][20], msg[128];

				for (new index; index < 2; index++)
				{
					weaponid[index] = g_pChosenWeapons[playerid][index];
					GetWeaponName(weaponid[index], weaponname[index], 20);
					GivePlayerWeapon(playerid, weaponid[index], 500);
				}

				format(msg, sizeof(msg), "You have chosen the weapons \"%s\" and \"%s\".", weaponname[0], weaponname[1]);
				SendClientMessage(playerid, COLOR_GREEN, msg);

				HidePlayerWeaponMenu(playerid);
			}

			PlayerPlaySound(playerid, 43000, 0.0, 0.0, 0.0);
			return 1;
		}
	}
	return 0;
}
