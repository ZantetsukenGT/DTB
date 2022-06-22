
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	KillTimer(g_GameTimer);
}
