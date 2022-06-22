PlaySoundForAll(soundid, Float: x = 0.0, Float: y = 0.0, Float: z = 0.0)
{
	foreach (new i : Player) { PlayerPlaySound(i, soundid, x, y, z); }
}
