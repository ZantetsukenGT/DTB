
#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
	if (mysql_close(g_DBHandle))
		print("Database connection closed.");
}
