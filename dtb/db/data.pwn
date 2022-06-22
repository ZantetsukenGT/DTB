#define MAX_PASSWORD_HASH  (128)
#define MAX_PASSWORD	   (20)
#define MIN_PASSWORD	   (6)
#define MAX_SALT		   (20)
#define MAX_LOGIN_ATTEMPTS (5)

#define SQL_HOST		   ("127.0.0.1")
#define SQL_USER		   ("root")
#define SQL_DB			   ("db_name")
#define SQL_PASSWORD	   ("db_password")

new MySQL: g_DBHandle;
new g_PlayerAccountID[MAX_PLAYERS];
new bool: g_IsPlayerRegistered[MAX_PLAYERS char];
new bool: g_IsPlayerLoggedIn[MAX_PLAYERS char];
new g_PlayerLoginAttempts[MAX_PLAYERS char];
new g_PlayerPassword[MAX_PLAYERS][MAX_PASSWORD_HASH + 1];
new g_PlayerSalt[MAX_PLAYERS][MAX_SALT + 1];
new g_PlayerAdminLevel[MAX_PLAYERS char];
new g_PlayerKills[MAX_PLAYERS];
new g_PlayerBestMultiKill[MAX_PLAYERS char];
new g_PlayerDeaths[MAX_PLAYERS];
new g_PlayerGamesWon[MAX_PLAYERS];
new g_PlayerGamesLost[MAX_PLAYERS];
new g_PlayerBombsPlanted[MAX_PLAYERS];
new g_PlayerBombsDefused[MAX_PLAYERS];
new g_PlayerPlayTime[MAX_PLAYERS];
