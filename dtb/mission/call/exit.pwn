#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	for (new teamid; teamid < 2; teamid++) TextDrawDestroy(g_ObjectiveTD[teamid]);
	return 1;
}
