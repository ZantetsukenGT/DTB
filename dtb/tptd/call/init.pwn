
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	for (new teamid; teamid < 2; teamid++)
	{
		for (new slot; slot < MAX_TEAM_PLAYERS; slot++)
		{
			if (teamid == TEAM_ATTACK)
				g_TeamPlayersTD[teamid][slot] = TextDrawCreate(267.0 - (slot * 14.0), 412.0, "LD_OTB2:Ric2");
			else if (teamid == TEAM_DEFEND)
				g_TeamPlayersTD[teamid][slot] = TextDrawCreate(346.0 + (slot * 14.0), 412.0, "LD_OTB2:Ric1");
			TextDrawAlignment(g_TeamPlayersTD[teamid][slot], 2);
			TextDrawFont(g_TeamPlayersTD[teamid][slot], 4);
			TextDrawUseBox(g_TeamPlayersTD[teamid][slot], 1);
			TextDrawTextSize(g_TeamPlayersTD[teamid][slot], 26.0, 29.0);
		}
	}
}
