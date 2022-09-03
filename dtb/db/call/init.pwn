
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	static mysql_host[MAX_PLAYER_NAME + 1],
		   mysql_username[MAX_PLAYER_NAME + 1],
		   mysql_password[MAX_PASSWORD_HASH + 1],
		   mysql_database[MAX_PLAYER_NAME + 1];
	GetConsoleVarAsString("mysql_host", mysql_host);
	GetConsoleVarAsString("mysql_username", mysql_username);
	GetConsoleVarAsString("mysql_password", mysql_password);
	GetConsoleVarAsString("mysql_database", mysql_database);

	g_DBHandle = mysql_connect(mysql_host, mysql_username, mysql_password, mysql_database);
	if (mysql_errno(g_DBHandle) == 0)
		print("Database connection established successfully!");
	else
		print("Database connection failed!");
}
