#include <YSI_Coding\y_hooks>

hook OnRconLoginAttempt(ip[], password[], success)
{
	foreach (new i : Player)
	{
		if (IsPlayerAdmin(i))
		{
			Kick(i, "RCON Login Attempt");
		}
	}
}
