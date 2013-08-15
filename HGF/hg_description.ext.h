respawn = "BIRD";
respawnDelay = 0;
onLoadName = "Hangar Games";
loadScreen = "HGF\hungergames1920x960.jpg";
disableChannels[]={0,1,2,3,4,6};
disabledAI = 1;
debriefing = 1;
showGPS = 1;
showCompass = 1;
showMap = 1;
showWatch = 1;
respawnDialog = 0;
class Header
{
	gameType = DM;
	minPlayers = 2;
	maxPlayers = 24;
};
class CfgDebriefing
{
	class End1
	{
		title = "SURVIVED!";
		subtitle = "You survived the Hangar Games!";
		description = "Congratulations! You are the winner of the Hangar Games!";
		pictureBackground = "HGF\hungergames1920x960.jpg";
		picture = "HGF\hungergames1024x1024.jpg";
		pictureColor[] = {1.0,1.0,1.0,1.0};
	};
	class Killed
	{
		title = "KILLED!";
		subtitle = "You were killed during the Hangar Games!";
		description = "You died in the Hangar Games. No parent should have to bury their child...";
		pictureBackground = "HGF\hungergames1920x960.jpg";
		picture = "HGF\hungergames1024x1024.jpg";
		pictureColor[] = {1.0,1.0,1.0,1.0};
	};
};