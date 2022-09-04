
#include <YSI_Coding\y_hooks>

hook OnSecondPassed()
{
	switch (g_GameState)
	{
		case STATE_COUNTDOWN:
		{
			if (g_GameTime > 0)
			{
				new string[3];
				format(string, sizeof(string), "%i", g_GameTime);
				TextDrawSetString(g_GameTimeTD, string);
			}
			else
				TextDrawSetString(g_GameTimeTD, "go!");
		}
		case STATE_STARTED:
		{
			if (g_GameTime > 0)
			{
				new string[6];
				if (g_IsBombPlanted && !g_IsBombDefused)
				{
					format(string, sizeof(string), "~r~%i", g_GameTime);
					TextDrawSetString(g_GameTimeTD, string);
				}
				else
				{
					format(string, sizeof(string), "%02i:%02i", g_GameTime / 60, g_GameTime % 60);
					TextDrawSetString(g_GameTimeTD, string);
				}
			}
			else
				TextDrawSetString(g_GameTimeTD, "intermission");
		}
		case STATE_FINISHED:
		{
			new mapname[MAX_MAP_NAME + 1];
			GetMapName(mapname, sizeof(mapname), g_NextMapID);

			if (g_GameTime > 0)
			{
				new string[MAX_MAP_NAME + 35];
				format(string, sizeof(string), "~w~loading ~r~%s~w~ in %i seconds...", mapname, g_GameTime);
				TextDrawSetString(g_GameTimeTD, string);
			}
			else
			{
				new string[MAX_MAP_NAME + 21];
				format(string, sizeof(string), "~w~loading ~r~%s~w~...", mapname);
				TextDrawSetString(g_GameTimeTD, string);
			}
		}
	}
	TextDrawShowForAll(g_GameTimeTD);
	return 1;
}
