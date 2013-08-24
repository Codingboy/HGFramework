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
class CfgHints
{
    class HintMainClass
    {
        displayName = "HGFramework / Hangar Games";
        class HintClass1
        {
            displayName = "Humanity Rate";
            description = "The humanity rate influences your %3fatigue%4, %3hunger%4 and %3thirst%4.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "The faster you move (vehicles excluded) the faster the humanity rate will increase. It is increased exponential!";
        };
        class HintClass2
        {
            displayName = "Sleep";
            description = "If you want to sleep, lay down and select %3sleep%4 from the actionmenu.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "The time you sleep you can not see or hear anything. The time slept is exponential. That means it is a lot better to sleep often! If you do not sleep, you character will not be able to run and even will fall asleep at a point. Fatigue is influenced by %3Humanity Rate%4.";
        };
        class HintClass3
        {
            displayName = "Hunger";
            description = "You need to find something to eat from time to time.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "If you do not eat, your character will not be able to run or even will get damage. Hunger is influenced by %3Humanity Rate%4.";
        };
        class HintClass4
        {
            displayName = "Thirst";
            description = "You need to find something to drink from time to time.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "If you do not drink, your character will not be able to run or even will get damage. Thirst is influenced by %3Humanity Rate%4.";
        };
        class HintClass5
        {
            displayName = "Infected Wounds";
            description = "Your wounds have a chance to become infected.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "To deny getting infected wounds which deal damage over time. You shall heal yourself as often as possible. The chance getting an infected wound is bigger when you have more damage. To treat an infected wound you need a medikit.";
        };
        class HintClass6
        {
            displayName = "Bleeding";
            description = "If you have bad wounds you start to bleed.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "Bleeding deals damage over time until your wounds have been bandaged or you are dead.";
        };
        class HintClass7
        {
            displayName = "Jump";
            description = "To jump, hit %3SPACE%4 while running.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "Deny using objects as ramp!";
        };
        class HintClass8
        {
            displayName = "Repack Magazines";
            description = "Unload your weapon and hit %3CTRL+R%4.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "All magazines will be repacked. That means taking bullets from a magazine to make another magazine full.";
        };
        class HintClass9
        {
            displayName = "Borders";
            description = "Do not leave the arena!";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "All player leaving the arena will be killed Within a few seconds.";
        };
        class HintClass10
        {
            displayName = "Folding Map";
            description = "Hit %3SHIFT+M%4 to display a folding map.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "";
        };
        class HintClass11
        {
            displayName = "Revive (WIP)";
            description = "Go near a dead player and select the %3revive%4 option from the actionmenu.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "To be able to revive you need a medikit. A player is really dead after some time, if he took too much damage or if you kill him by selecting kill from the actionmenu if you are near to him.";
        };
        class HintClass12
        {
            displayName = "Explosive Interface (WIP)";
            description = "Move explosives by selecting %3move X%4 from the actionmenu.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "The explosives can be dropped by hitting %3SPACE%4. Explosives can be attached to other objects. To move more complicated explosives you need a toolkit.";
        };
        class HintClass13
        {
            displayName = "Temperature";
            description = "Temperature influences hunger and thirst.";
            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            tip = "The colder you are the more food and the less water you need. The warmer you are the less food and the more water you need.";
        };
    };
};