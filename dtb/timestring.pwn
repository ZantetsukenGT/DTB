TimeToString(seconds)
{
	new hours = seconds / 3600;
	seconds = seconds % 3600; 
	new minutes = seconds / 60;
	seconds = seconds % 60;

	new string[30];
	if (hours > 0)
		format(string, sizeof(string), "%i H, %i M, %i S", hours, minutes, seconds);
	else if (minutes > 0)
		format(string, sizeof(string), "%i M, %i S", minutes, seconds);
	else
		format(string, sizeof(string), "%i S", seconds);
	return string;
}
