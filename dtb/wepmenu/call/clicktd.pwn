
#include <YSI_Coding\y_hooks>

hook OnPlayerClickTextDraw(playerid, Text: clickedid)
{
	SendClientMessage(playerid, COLOR_GREEN, "OnPlayerClickTextDraw");
	if (clickedid == Text: INVALID_TEXT_DRAW && g_pWeaponMenu { playerid } != INVALID_WEAPONMENU_ID)
		SelectTextDraw(playerid, COLOR_RED);

	return 0;
}
