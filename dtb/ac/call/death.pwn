
#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (ac_CheckPlayerFlooding(playerid))
		return ~0;
	return 1;
}
