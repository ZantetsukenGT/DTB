
#include <YSI_Coding\y_hooks>

hook OnGameStart()
{
	new mapid;
	if (g_NextMapLoaded)
		mapid = g_NextMapID;
	else
		mapid = GetRandomMap();
	SetMapID(mapid);
}
