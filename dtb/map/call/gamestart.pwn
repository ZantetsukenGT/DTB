
#include <YSI_Coding\y_hooks>

hook function OnGameStart()
{
	SetMapID(g_NextMapID);
	return continue();
}
