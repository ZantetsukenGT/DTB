
#include <YSI_Coding\y_hooks>

hook OnPlayerLeaveTeam(playerid, teamid, reason)
{
	if (reason == LEAVE_TEAM_DEATH && g_pWeaponMenu { playerid } != INVALID_WEAPONMENU_ID)
		HidePlayerWeaponMenu(playerid);
}
