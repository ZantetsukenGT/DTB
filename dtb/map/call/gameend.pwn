
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	g_NextMapID = GetRandomMap();
	return 1;
}
