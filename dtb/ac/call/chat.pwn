
#include <YSI_Coding\y_hooks>

hook OnPlayerText(playerid, text[])
{
	if (ac_CheckPlayerFlooding(playerid))
		return 0;

	if (ac_CheckPlayerRepeatingChat(playerid, text))
		return 0;
	return 1;
}
