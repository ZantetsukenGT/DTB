
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	StartGame();
	g_GameTimer = SetTimer("OnSecondPassed", 1000, true);
}
