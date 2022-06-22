IRCCMD:ban(botid, channel[], user[], host[], params[])
{
	if(botid == g_IRCBotID[0])
	{
		if(!IRC_IsOp(botid, channel, user))
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: You are not authorized to use this command!"), 1;

		new playerid, reason[50];
		if(sscanf(params, "rS(None)[*]", playerid, sizeof(reason), reason))
	    	return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1SYNTAX: !Ban <playerid/name> <reason>"), 1;

		if(id == INVALID_PLAYER_ID)
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: This player is not connected!"), 1;

		Ban(playerid, reason, INVALID_PLAYER_ID, user);
	}
	return 1;
}
