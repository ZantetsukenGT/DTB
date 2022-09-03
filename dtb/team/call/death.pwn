
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	PlayerLeaveTeam(playerid, LEAVE_TEAM_DEATH);
	return 1;
}
