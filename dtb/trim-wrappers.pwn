stock bool: Trim_HasContent(const str[], &start, &end)
{
	Trim(str, start, end);
	return start != end;
}
