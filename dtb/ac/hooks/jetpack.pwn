
#include <YSI_Coding\y_hooks>

hook native SetPlayerSpecialAction(playerid, actionid)
{
	if (actionid == SPECIAL_ACTION_USEJETPACK)
	{
		g_acJetpack { playerid }		 = true;
		g_acJetpackWarnings { playerid } = 0;
	}
	return continue(playerid, actionid);
}
