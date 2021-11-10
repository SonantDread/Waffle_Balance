
bool onServerProcessChat(CRules@ this, const string& in text_in, string& out text_out, CPlayer@ player)
{
	// cannot do commands while dead

	if (player is null)
		return true;

	CBlob@ blob = player.getBlob(); // now, when the code references "blob," it means the player who called the command

	if (blob is null)
	{
		return true;
	}

	Vec2f pos = blob.getPosition(); // grab player position (x, y)
	int team = blob.getTeamNum(); // grab player team number (for i.e. making all flags you spawn be your team's flags)

	// spawning things

	// these all require sv_test - no spawning without it
	// some also require the player to have mod status (!spawnwater)

	if (sv_test)
	{
		if (text_in == "!siegeframe")
		{
			CBlob@ siegeblock = server_CreateBlob("siegeblock", team, pos);
		}
		else if (text_in == "!siegearmor")
		{
			CBlob@ siegeblock = server_CreateBlob("siegeblock", team, pos);
			siegeblock.set_bool("armored", true);
			siegeblock.Sync("armored", true);
		}
		else if (text_in == "!siegewheel")
		{
			CBlob@ siegeblock = server_CreateBlob("siegeblock", team, pos);
			siegeblock.set_bool("wheel", true);
			siegeblock.Sync("wheel", true);
		}
		else if (text_in == "!siegeseat")
		{
			CBlob@ siegeblock = server_CreateBlob("siegeblock", team, pos);
			siegeblock.set_bool("seat", true);
			siegeblock.Sync("seat", true);
		}
	}

	return true;
}