

#if defined _geolocation_included
	#endinput
#endif
#define _geolocation_included
/*

	GeoIP Include by Whitetiger
	-> SQLite GeoIP Include
	
	Credits: Whitetiger, RaekwonDaChef, Y_Less, Andreas Gohr.
	
	MaxMind, GeoIP and related marks are registered trademarks of MaxMind, Inc.
	
	---------------------------------------------------------------------------------------
	
*/

#include <a_samp>
#include <sscanf2>

/*
	---------------------------------------------------------------------------------------
	Variables
	---------------------------------------------------------------------------------------
*/

#if !defined GeoIP_MainFile
	#define GeoIP_MainFile "geoip.db"
#endif

#if !defined GeoIP_CityFile
	#define GeoIP_CityFile "geoip_city.db"
#endif

new DB: geoip_db;
new DB: geoip_city;

new stock g_iBackwardsCompat = -1;

new DBResult: _result;

/*
	---------------------------------------------------------------------------------------
	NATIVES
	---------------------------------------------------------------------------------------
*/

/*
	native GetPlayerCountry(playerid, string[], const len = sizeof(string));
	native GetPlayerISP(playerid, string[], const len = sizeof(string));
	native GetPlayerCity(playerid, string[], const len = sizeof(string));
	native GetPlayerGMT(playerid);
	native GetPlayerProxy(playerid);
*/

stock GetPlayerCountry(playerid, string[], const len = sizeof(string))
{
	new ip[24];
	GetPlayerIp(playerid, ip, sizeof(ip));

	GetIPCountry(ip, string, len);

	return true;
}

stock GetPlayerISP(playerid, string[], const len = sizeof(string))
{
	new ip[24];
	GetPlayerIp(playerid, ip, sizeof(ip));

	GetIPISP(ip, string, len);
	new placeholder[1];
	sscanf(string, "s[*]s[*]", sizeof(placeholder), placeholder, len, string);

	return true;
}

stock GetPlayerCity(playerid, string[], const len = sizeof(string))
{
	new ip[24];
	GetPlayerIp(playerid, ip, sizeof(ip));

	GetIPCity(ip, string, len);

	return true;
}

stock GetPlayerGMT(playerid)
{
	new ip[24];
	GetPlayerIp(playerid, ip, sizeof(ip));

	return GetIPGMT(ip);
}

stock GetPlayerProxy(playerid)
{
	new ip[24];
	GetPlayerIp(playerid, ip, sizeof(ip));

	return GetIPProxy(ip);
}

/*

	---------------------------------------------------------------------------------------
	INTERNAL FUNCTIONS
	---------------------------------------------------------------------------------------

	- stock GetIPCountry(ip[], dest[], len = sizeof(dest))
	- stock GetIPISP(ip[], dest[], len = sizeof(dest))
	- stock GetIPCity(ip[], dest[], len = sizeof(dest))
	- stock GetIPGMT(ip[])
	- stock GetIPProxy(ip[])
	- stock ip2long(ip[])

*/

stock GetIPCountry(const ip[], dest[], const len = sizeof(dest))
{
	new tmp[90];
	tmp = ip2long(ip);

	new string[500];

	geoip_db = db_open(GeoIP_MainFile);

	if (g_iBackwardsCompat == -1)
	{
		_result = db_query(geoip_db, "SELECT name FROM sqlite_master WHERE type='table' AND name='ip_country'");
		if (db_num_rows(_result) >= 1)
		{
			g_iBackwardsCompat = 1;
		}
		else
		{
			g_iBackwardsCompat = 0;
		}
		db_free_result(_result);
	}

	if (g_iBackwardsCompat == 1)
	{
		format(
			string, sizeof(string),
			"SELECT cn FROM ip_country WHERE idx >= (%s-(%s %% 65536)) AND ip_to >= %s AND  ip_from < %s LIMIT 1", tmp, tmp, tmp,
			tmp);
	}
	else
	{
		format(
			string, sizeof(string),
			"SELECT loc.*\n FROM loc_country loc,\n blocks_country blk\n WHERE blk.idx >= (%s-(%s %% 65536))\n AND blk.startIpNum < %s\n AND blk.endIpNum > %s\n AND loc.locId = blk.locId LIMIT 1;",
			tmp, tmp, tmp, tmp);
	}

	_result = db_query(geoip_db, string);
	if (db_num_rows(_result) >= 1)
	{
		db_get_field_assoc(_result, "cn", dest, len);
	}
	db_free_result(_result);
	db_close(geoip_db);

	if (!strlen(dest))
		format(dest, len, "Unknown");

	return true;
}

stock GetIPISP(const ip[], dest[], const len = sizeof(dest))
{
	new tmp[90];
	tmp = ip2long(ip);

	new string[500];
	format(
		string, sizeof(string),
		"SELECT internet_service_provider FROM geo_isp WHERE idx >= (%s-(%s %% 65536)) AND ip_to >= %s AND  ip_from < %s LIMIT 1",
		tmp, tmp, tmp, tmp);

	geoip_db = db_open(GeoIP_MainFile);
	_result	 = db_query(geoip_db, string);
	if (db_num_rows(_result) >= 1)
	{
		db_get_field_assoc(_result, "internet_service_provider", dest, len);
	}
	db_free_result(_result);
	db_close(geoip_db);

	if (!strlen(dest))
		format(dest, len, "Unknown");

	return true;
}

stock GetIPCity(const ip[], dest[], const len = sizeof(dest))
{
	new tmp[90];
	tmp = ip2long(ip);

	new string[500];
	format(
		string, sizeof(string),
		"SELECT loc.*\n FROM geolocation loc,\n geoblocks blk\n WHERE blk.idx = (%s-(%s %% 65536))\n AND blk.startIpNum < %s\n AND blk.endIpNum > %s\n AND loc.locId = blk.locId LIMIT 1;",
		tmp, tmp, tmp, tmp);

	geoip_city = db_open(GeoIP_CityFile);
	_result	   = db_query(geoip_city, string);
	if (db_num_rows(_result) >= 1)
	{
		db_get_field_assoc(_result, "city", dest, len);
	}
	db_free_result(_result);
	db_close(geoip_city);

	if (!strlen(dest))
		format(dest, len, "Unknown");

	return true;
}

stock GetIPGMT(const ip[])
{
	new tmp[90];
	tmp = ip2long(ip);

	new dest[50];

	new string[500];
	format(
		string, sizeof(string),
		"SELECT blk.*, loc.longitude\n FROM geolocation loc,\n geoblocks blk\n WHERE blk.idx = (%s-(%s %% 65536))\n AND blk.startIpNum < %s\n AND blk.endIpNum > %s\n AND loc.locId = blk.locId LIMIT 1;",
		tmp, tmp, tmp, tmp);

	geoip_city = db_open(GeoIP_CityFile);
	_result	   = db_query(geoip_city, string);
	if (db_num_rows(_result) >= 1)
	{
		db_get_field_assoc(_result, "longitude", dest, sizeof(dest));
	}
	db_free_result(_result);
	db_close(geoip_city);

	if (!strlen(dest))
		format(dest, sizeof(dest), "Unknown");

	return floatround(strval(dest) / 15);
}

stock GetIPProxy(const ip[])
{
	/*if (g_iBackwardsCompat == -1)
	{
		_result = db_query(geoip_db, "SELECT name FROM sqlite_master WHERE type='table' AND name='ip_country'");
		if (db_num_rows(_result) >= 1)
		{
			g_iBackwardsCompat = 1;
		}
		else
		{
			g_iBackwardsCompat = 0;
		}
	}

	if (g_iBackwardsCompat == 1)
	{
		printf("Error: GetIPProxy cannot work on old GeoIP Database files, please update your database files!");
		printf("http://forum.sa-mp.com/showthread.php?t=296171");
		return false;
	}
	if (strlen(ip) > 0)
	{
		new tmp[90];
		tmp = ip2long(ip);

		new dest[50];

		new string[500];
		format(
			string, sizeof(string),
			"SELECT blk.*\n FROM geolocation loc,\n geoblocks blk\n WHERE blk.idx = (%s-(%s %% 65536))\n AND blk.startIpNum < %s\n AND blk.endIpNum > %s\n AND loc.locId = blk.locId LIMIT 1;",
			tmp, tmp, tmp, tmp);

		geoip_city = db_open(GeoIP_CityFile);
		_result	   = db_query(geoip_city, string);
		if (db_num_rows(_result) >= 1)
		{
			db_get_field_assoc(_result, "is_anonymous_proxy", dest, sizeof(dest));
		}
		db_free_result(_result);
		db_close(geoip_city);

		return strval(dest);
	}*/

#pragma unused ip
	return false;
}

/*forward OnProxyRecieved(index, response_code, data[]);
public OnProxyRecieved(index, response_code, data[])
{
	if (IsPlayerConnected(index))
	{
		new ip[MAX_PLAYER_NAME];
		GetPlayerIp(index, ip, sizeof(ip));

		if (strlen(IPInfo[index]) > 0 && strlen(ip) > 0 && !strcmp(IPInfo[index], ip, true))
		{
			CallLocalFunction("OnProxyResponse", "ii", index, strval(data));
		}
	}
	IPInfo[index] = "";
}*/

stock ip2long(const ip[])
{
	new ips[4];
	sscanf(ip, "p<.>dddd", ips[0], ips[1], ips[2], ips[3]);
	new tmp[90];
	format(tmp, sizeof(tmp), "((16777216 * %d) + (65536 * %d) + (256 * %d) + %d)", ips[0], ips[1], ips[2], ips[3]);
	// we use a string here so it will not pass the 32-bit integer limits, the math is done later in the sql query
	return tmp;
}
