#define MAX_IRC_BOTS (4)
#define IRC_SERVER	 ("not_set_yet")
#define IRC_PORT	 (1234)
#define IRC_CHANNEL	 ("#not_set_yet")

/*
	IRC Colors

00	IRC_WHITE
01	IRC_BLACK
02	IRC_BLUE
03	IRC_GREEN
04	IRC_LIGHTRED
05	IRC_BROWN
06	IRC_PURPLE
07	IRC_ORANGE
08	IRC_YELLOW
09	IRC_LIGHTGREEN
10	IRC_CYAN
11	IRC_LIGHTCYAN
12	IRC_LIGHTBLUE
13	IRC_PINK
14	IRC_GREY
15	IRC_LIGHTGREY
*/

new const g_IRCBotNames[MAX_IRC_BOTS][] = { "AlphaBot", "BetaBot", "CharlieBot", "DeltaBot" };

new g_IRCBotID[MAX_IRC_BOTS];
new g_IRCGroupID;
