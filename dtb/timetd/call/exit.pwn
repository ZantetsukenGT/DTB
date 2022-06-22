
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	TextDrawDestroy(g_GameTimeTD);
}
