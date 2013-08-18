respawn = "BIRD";
respawnDelay = 0;
onLoadName = "$STR_BRIEF_HANGARGAMES";
loadScreen = "HGF\media\hungergames1920x960.jpg";
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
		title = "$STR_DEBR_SURVIVED";
		subtitle = "$STR_DEBR_SURVIVEDSUBTITLE";
		description = "$STR_DEBR_SURVIVEDDESCRIPTION";
		pictureBackground = "HGF\media\hungergames1920x960.jpg";
		picture = "HGF\media\hungergames1024x1024.jpg";
		pictureColor[] = {1.0,1.0,1.0,1.0};
	};
	class Killed
	{
		title = "$STR_DEBR_KILLED";
		subtitle = "$STR_DEBR_KILLEDSUBTITLE";
		description = "$STR_DEBR_KILLEDDESCRIPTION";
		pictureBackground = "HGF\media\hungergames1920x960.jpg";
		picture = "HGF\media\hungergames1024x1024.jpg";
		pictureColor[] = {1.0,1.0,1.0,1.0};
	};
};