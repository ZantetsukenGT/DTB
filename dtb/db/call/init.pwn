
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	g_DBHandle = mysql_connect(SQL_HOST, SQL_USER, SQL_PASSWORD, SQL_DB);
	if (mysql_errno(g_DBHandle) == 0)
		print("Database connection established successfully!");
	else
		print("Database connection failed!");
}
