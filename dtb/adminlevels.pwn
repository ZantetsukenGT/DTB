GetAdminLevelName(level)
{
	new levelname[11];
	switch (level)
	{
		case 0: levelname = "Player";
		case 1: levelname = "Moderator";
		case 2: levelname = "Management";
		default: levelname = "Unknown";
	}
	return levelname;
}
