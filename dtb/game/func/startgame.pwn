StartGame()
{
	if (g_GameState == STATE_STARTED)
		return 0;

	g_GameTime	= COUNTDOWN_TIME;
	g_GameState = STATE_COUNTDOWN;

	OnGameStart();
	return 1;
}
