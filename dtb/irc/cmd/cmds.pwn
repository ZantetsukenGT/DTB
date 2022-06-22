IRCCMD:cmds(botid, const channel[], const user[], const host[], const params[])
{
	if (botid == g_IRCBotID[0])
	{
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "List of available channel commands:");
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "Everyone: !Players");
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "Operator: !Ban !Kick");
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "Owner: !Restart !Shutdown");
	}
	return 1;
}
