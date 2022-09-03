
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	g_GameTimeTD = TextDrawCreate(318.0, 419.0, "00:00");
	TextDrawAlignment(g_GameTimeTD, 2);
	TextDrawBackgroundColor(g_GameTimeTD, 255);
	TextDrawFont(g_GameTimeTD, 2);
	TextDrawLetterSize(g_GameTimeTD, 0.309999, 1.5);
	TextDrawColor(g_GameTimeTD, COLOR_WHITE);
	TextDrawSetProportional(g_GameTimeTD, 1);
	TextDrawSetShadow(g_GameTimeTD, 1);
	return 1;
}
