
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason) { PlayerLeaveTeam(playerid, LEAVE_TEAM_DISCONNECT); }
