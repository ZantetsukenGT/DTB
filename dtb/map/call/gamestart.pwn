
OnGameStart()
{
	SetMapID(g_NextMapLoaded ? g_NextMapID : GetRandomMap());
	return 1;
}
