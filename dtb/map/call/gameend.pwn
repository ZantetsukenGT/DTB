
#include <YSI_Coding\y_hooks>

hook OnGameEnd(reason)
{
	g_NextMapID		= GetRandomMap();
	g_NextMapLoaded = true;
}
