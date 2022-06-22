
#include <YSI_Coding\y_hooks>

hook OnPlayerSpawn(playerid)
{
	new teamid = g_PlayerTeam[playerid];
	switch (teamid)
	{
		case TEAM_ATTACK, TEAM_DEFEND:
		{
			new mapid = g_MapID,
				Float: x,
				Float: y,
				Float: z,
				Float: angle;

			GetMapSpawnPos(mapid, teamid, x, y, z);
			GetMapSpawnAngle(mapid, teamid, angle);
			RandomizeFloat(x, 2);
			RandomizeFloat(y, 2);

			SetPlayerPos(playerid, x, y, z);
			SetPlayerFacingAngle(playerid, angle);
			SetPlayerInterior(playerid, GetMapInterior(mapid));
		}
	}
}
