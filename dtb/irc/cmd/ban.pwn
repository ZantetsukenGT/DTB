IRCCMD:ban(botid, const channel[], const user[], const host[], const params[])
{
	if (botid == g_IRCBotID[0])
	{
		if (!IRC_IsOp(botid, channel, user))
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: You are not authorized to use this command!"), 1;

		new playerid, reason[50];
		if (sscanf(params, "rS(None)[*]", playerid, sizeof(reason), reason))
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1SYNTAX: !Ban <playerid/name> <reason>"), 1;

		if (playerid == INVALID_PLAYER_ID)
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: This player is not connected!"), 1;

		BanPlayer(playerid, reason, INVALID_PLAYER_ID, user);
	}
	return 1;
}
