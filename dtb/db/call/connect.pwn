
#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	LoadPlayerAccount(playerid);
	LoadPlayerSessions(playerid); // Loads previous sessions, then check for bans
	return 1;
}
