
#include <YSI_Coding\y_hooks>

#define MAX_COUNTRY_NAME 40
#define MAX_CITY_NAME	 40
#define MAX_ISP_NAME	 100

new g_PlayerCountry[MAX_PLAYERS][MAX_COUNTRY_NAME + 1];
new g_PlayerCity[MAX_PLAYERS][MAX_CITY_NAME + 1];
new g_PlayerISP[MAX_PLAYERS][MAX_ISP_NAME + 1];

hook OnPlayerConnect(playerid)
{
	GetIPCountry(g_PlayerIP[playerid], g_PlayerCountry[playerid], MAX_COUNTRY_NAME + 1);
	GetIPCity(g_PlayerIP[playerid], g_PlayerCity[playerid], MAX_CITY_NAME + 1);
	GetIPISP(g_PlayerIP[playerid], g_PlayerISP[playerid], MAX_ISP_NAME + 1);
}
