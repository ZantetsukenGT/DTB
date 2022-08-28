
#include <YSI_Coding\y_hooks>

hook function OnGameStart()
{
	new mapid = g_MapID,
		Float: x,
		Float: y,
		Float: z;

	GetMapSpawnPos(mapid, TEAM_ATTACK, x, y, z);
	CreateBombPickup(x, y, z);

	for (new bombsite; bombsite < 2; bombsite++)
	{
		CreateBombsiteIcon(bombsite);
		CreateBombsiteObjects(bombsite);
	}
	return continue();
}
