#include <YSI_Coding\y_hooks>

hook OnRconLoginAttempt(ip[], password[], success)
{
	foreach (new i : Player)
	{
		if (IsPlayerAdmin(i))
		{
			KickPlayer(i, "RCON Login Attempt");
		}
	}
}
