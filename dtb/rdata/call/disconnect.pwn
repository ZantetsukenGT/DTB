
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
	ResetPlayerRoundVariables(playerid);
	return 1;
}
