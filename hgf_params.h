class Params
{
//vehicles
	//height vehicles are paradropped at
	class CODI_hgf_vehicleDropHeight
	{
		title = "CODI_hgf_vehicleDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//time between 2 vehiclespawns
	class CODI_hgf_vehicleSpawnDelay
	{
		title = "CODI_hgf_vehicleSpawnDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900"};
		default = 300;
	};
	//time between teleport of the players to the arena and the first spawn of a vehicle
	class CODI_hgf_vehicleFirstDelay
	{
		title = "CODI_hgf_vehicleFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700,86400};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900","960","1020","1080","1140","1200","1260","1320","1380","1440","1500","1560","1620","1680","1740","1800","1860","1920","1980","2040","2100","2160","2220","2280","2340","2400","2460","2520","2580","2640","2700","never"};
		default = 86400;
	};
	//time between players are teleported to the arena and spawn of first boat
	class CODI_hgf_boatFirstDelay
	{
		title = "CODI_hgf_boatFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700,86400};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900","960","1020","1080","1140","1200","1260","1320","1380","1440","1500","1560","1620","1680","1740","1800","1860","1920","1980","2040","2100","2160","2220","2280","2340","2400","2460","2520","2580","2640","2700","never"};
		default = 86400;
	};
	//paradropheight for boats
	class CODI_hgf_boatDropHeight
	{
		title = "CODI_hgf_boatDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//time between 2 boatspawns
	class CODI_hgf_boatSpawnDelay
	{
		title = "CODI_hgf_boatSpawnDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900"};
		default = 300;
	};
	class CODI_hgf_heliDropHeight
	{
		title = "CODI_hgf_heliDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//height helis are paradropped at
	class CODI_hgf_heliSpawnDelay
	{
		title = "CODI_hgf_heliSpawnDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900"};
		default = 300;
	};
	//time between teleport of the players to the arena and the first spawn of a heli
	class CODI_hgf_heliFirstDelay
	{
		title = "CODI_hgf_heliFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700,86400};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900","960","1020","1080","1140","1200","1260","1320","1380","1440","1500","1560","1620","1680","1740","1800","1860","1920","1980","2040","2100","2160","2220","2280","2340","2400","2460","2520","2580","2640","2700","never"};
		default = 86400;
	};
	//1 -> disables nv and tv for all vehicles
	class CODI_hgf_disableTIEquipment
	{
		title = "CODI_hgf_disableTIEquipment";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> disables nv and tv for all vehicles
	class CODI_hgf_dayz
	{
		title = "CODI_hgf_dayz";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};



//start
	//time between teleporting players to the arena and the deactivation of the mines
	class CODI_hgf_mineTimer
	{
		title = "CODI_hgf_mineTimer";
		values[] = {0,30,60,90,120};
		texts[] = {"0","30","60","90","120"};
		default = 30;
	};
	//radius of the circle the players create after teleporting to the arena
	class CODI_hgf_startRadius
	{
		title = "CODI_hgf_startRadius";
		values[] = {25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100};
		texts[] = {"25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100"};
		default = 50;
	};
	//time until startcrates despawn
	class CODI_hgf_startCrateDespawnTime
	{
		title = "CODI_hgf_startCrateDespawnTime";
		values[] = {120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 120;
	};



//loot
	//number of magazines in each ammobox
	class CODI_hgf_loot_magazineCount
	{
		title = "CODI_hgf_loot_magazineCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 4;
	};
	//number of explosives in each explosivebox
	class CODI_hgf_loot_explosivesCount
	{
		title = "CODI_hgf_loot_explosivesCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 2;
	};
	//number of grenades in each grenadebox
	class CODI_hgf_loot_grenadeCount
	{
		title = "CODI_hgf_loot_grenadeCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 5;
	};
	//number of special items in each specialbox
	class CODI_hgf_loot_specialCount
	{
		title = "CODI_hgf_loot_specialCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 7;
	};
	//number of support items in each supportbox
	class CODI_hgf_loot_supportCount
	{
		title = "CODI_hgf_loot_supportCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 3;
	};
	//number of weapons/magazines in each weaponbox
	class CODI_hgf_loot_weaponCount
	{
		title = "CODI_hgf_loot_weaponCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 1;
	};
	//drop height for paradroped special loot crates
	class CODI_hgf_specialCrateDropHeight
	{
		title = "CODI_hgf_specialCrateDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//time between players are teleported to the arena and the first spawn of a special loot crate
	class CODI_hgf_specialCrateFirstDelay
	{
		title = "CODI_hgf_specialCrateFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 0;
	};
	//time between 2 spawns of a special loot crate
	class CODI_hgf_specialCrateDelay
	{
		title = "CODI_hgf_specialCrateDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 300;
	};
	//time between touching ground of a special loot crate and its despawn
	class CODI_hgf_specialCrateDespawnTime
	{
		title = "CODI_hgf_specialCrateDespawnTime";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 120;
	};
	//chance for a normal loot crate to spawn; 0 -> no loot crate will spawn; 100 -> all orange box have loot; reduce it to add a little random to the mission ~90
	class CODI_hgf_crateSpawnChance
	{
		title = "CODI_hgf_crateSpawnChance";
		values[] = {10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100};
		texts[] = {"10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100"};
		default = 50;
	};
	//chance to spawn a ammocrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_ammoChance
	{
		title = "CODI_hgf_loot_ammoChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a weaponcrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_weaponChance
	{
		title = "CODI_hgf_loot_weaponChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a grenadecrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_grenadeChance
	{
		title = "CODI_hgf_loot_grenadeChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a explosivecrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_explosiveChance
	{
		title = "CODI_hgf_loot_explosiveChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a supportcrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_supportChance
	{
		title = "CODI_hgf_loot_supportChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a specialcrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_specialChance
	{
		title = "CODI_hgf_loot_specialChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a watercrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_waterChance
	{
		title = "CODI_hgf_loot_waterChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a foodcrate on an orange marker; SUM(CODI_hgf_loot_*) ~ 100
	class CODI_hgf_loot_foodChance
	{
		title = "CODI_hgf_loot_foodChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//1 -> vas available at start; 0 -> 3 weaponcrates available on start
	class CODI_hgf_vasOnStart
	{
		title = "CODI_hgf_vasOnStart";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 0;
	};
	//1 -> vas paradropped as special loot crate
	class CODI_hgf_vasOnParadrop
	{
		title = "CODI_hgf_vasOnParadrop";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 0;
	};
	//guarantees n crates of each type, requires at least 8*n crates in the mission otherwise this may fail! Note: this crates are excluded from spawnchance calculation!
	class CODI_hgf_lootGuaranteePerType
	{
		title = "CODI_hgf_lootGuaranteePerType";
		values[] = {0,1,2,3,4,5};
		texts[] = {"0","1","2","3","4","5"};
		default = 3;
	};



//general settings
	//0 -> all civilians will be removed
	class CODI_hgf_civilianPresent
	{
		title = "CODI_hgf_civilianPresent";
		values[] = {1, 0};
		texts[] = {"true", "false"};
		default = 0;
	};
	//1 -> orange markers will be removed when lootcrates are spawned
	class CODI_hgf_deleteCrateMarkers
	{
		title = "CODI_hgf_deleteCrateMarkers";
		values[] = {1, 0};
		texts[] = {"true", "false"};
		default = 0;
	};

	//radius of the safezone
	class CODI_hgf_safeZoneDistance
	{
		title = "CODI_hgf_safeZoneDistance";
		values[] = {10, 25, 50, 75, 100, 125, 150, 175, 200};
		texts[] = {"10", "25", "50", "75", "100", "125", "150", "175", "200"};
		default = 25;
	};
	//defines the mission's starttime
	class CODI_hgf_startHour
	{
		title = "CODI_hgf_startHour";
		values[] = {-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		texts[] = {"evening","morning","night","day","random","0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"};
		default = -2;
	};
	//defines the mission's starttime
	class CODI_hgf_startMinute
	{
		title = "CODI_hgf_startMinute";
		values[] = {-1,0,5,10,15,20,25,30,35,40,45,50,55};
		texts[] = {"random","0","5","10","15","20","25","30","35","40","45","50","55"};
		default = -1;
	};
	//time before players are teleported to the arena; needed for framework initialisation; player can regroup while this time
	class CODI_hgf_groupUpTime
	{
		title = "CODI_hgf_groupUpTime";
		values[] = {0,10,20,30,40,50,60,70,80,90,100,110,120};
		texts[] = {"off","10","20","30","40","50","60","70","80","90","100","110","120"};
		default = 0;
	};
	//timeaccelerationfactor for the mission; 60 -> 1 rl second -> 1 ingame minute
	class CODI_hgf_acceleration
	{
		title = "CODI_hgf_acceleration";
		values[] = {1,2,4,8,16,24,30,60,90,120};
		texts[] = {"1","2","4","8","16","24","30","60","90","120"};
		default = 60;
	};
	//time between player died and removing of its corpse; 0 -> no removing
	class CODI_hgf_removePlayersTime
	{
		title = "CODI_hgf_removePlayersTime";
		values[] = {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300};
		texts[] = {"no", "30", "60", "90", "120", "150", "180", "210", "240", "270", "300"};
		default = 0;
	};
	//time between vehicle/heli/boat destroyed and removing of its wreck; 0 -> no removing
	class CODI_hgf_removeVehiclesTime
	{
		title = "CODI_hgf_removeVehiclesTime";
		values[] = {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300};
		texts[] = {"no", "30", "60", "90", "120", "150", "180", "210", "240", "270", "300"};
		default = 0;
	};
	//time between players are teleported to the arena and the deathzone warning pops up, deactivation of borders, hint where safezone will be
	class CODI_hgf_deathZoneWarningTime
	{
		title = "CODI_hgf_deathZoneWarningTime";
		values[] = {300,600,900,1200,1500,1800,2100,2400,2700,3000,3300,3600,86400};
		texts[] = {"300","600","900","1200","1500","1800","2100","2400","2700","3000","3300","3600","never"};
		default = 600;
	};
	//time between deathzone warning pops up and killing all players who are not in the safezone
	class CODI_hgf_deathZoneDelay
	{
		title = "CODI_hgf_deathZoneDelay";
		values[] = {60,120,180,240,300,360,420,480,540,600};
		texts[] = {"60","120","180","240","300","360","420","480","540","600"};
		default = 600;
	};
	//1 -> revive enabled
	class CODI_hgf_revive
	{
		title = "CODI_hgf_revive";
		values[] = {0,1};
		texts[] = {"disabled", "enabled"};
		default = 0;
	};
	//maximum error of playerposition and the marker displayed on the map for enemy players
	class CODI_hgf_markPlayersPrecision
	{
		title = "CODI_hgf_markPlayersPrecision";
		values[] = {0,100,200,300,400,500,600,700,800,900,1000};
		texts[] = {"0","100","200","300","400","500","600","700","800","900","1000"};
		default = 100;
	};
	//1 -> players name is added to its marker on the map
	class CODI_hgf_markPlayersName
	{
		title = "CODI_hgf_markPlayersName";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 0;
	};
	//1 -> enemy players are marked on the map
	class CODI_hgf_markPlayers
	{
		title = "CODI_hgf_markPlayers";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> delete all markers except lootcrates after teleporting players to the arena
	class CODI_hgf_deleteSpecialMarkers
	{
		title = "CODI_hgf_deleteSpecialMarkers";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//time between player leaves the allowed area and its kill
	class CODI_hgf_bordersReturnTime
	{
		title = "CODI_hgf_bordersReturnTime";
		values[] = {5,10,15,20};
		texts[] = {"5","10","15","20"};
		default = 10;
	};
	//1 -> players are killed if leaving the allowed area
	class CODI_hgf_bordersActive
	{
		title = "CODI_hgf_bordersActive";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> bullets are influenced by wind
	class CODI_hgf_windsystem
	{
		title = "CODI_hgf_windsystem";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> post process effects enabled
	class CODI_hgf_ppEffects
	{
		title = "CODI_hgf_ppEffects";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> rookie scripts (markPlayers) are disabled in harder modes, hard scripts (ppEffects) are enabled in hard modes
	class CODI_hgf_difficultyDependendSettings
	{
		title = "CODI_hgf_difficultyDependendSettings";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 0;
	};
	//how much the tao foldmap is magnified (lower values -> more magnification)
	class tao_foldmap_mapScale
	{
		title = "tao_foldmap_mapScale";
		values[] = {5,10,15,20,25};
		texts[] = {"0.05","0.10","0.15","0.20","0.25"};
		default = 10;
	};



//humanity
	//indirect amount of thirst increased per second
	class CODI_hgf_thirstRate
	{
		title = "CODI_hgf_thirstRate";
		values[] = {5,10,15,20,25,30,35,40,45,50};
		texts[] = {"0.005","0.010","0.015","0.020","0.025","0.030","0.035","0.040","0.045","0.050"};
		default = 35;
	};
	//indirect amount of hunger increased per second
	class CODI_hgf_hungerRate
	{
		title = "CODI_hgf_hungerRate";
		values[] = {5,10,15,20,25,30,35,40,45,50};
		texts[] = {"0.005","0.010","0.015","0.020","0.025","0.030","0.035","0.040","0.045","0.050"};
		default = 30;
	};
	//damage dealt per second if hunger == 100
	class CODI_hgf_hungerDamage
	{
		title = "CODI_hgf_hungerDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		texts[] = {"off","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010","0.011","0.012","0.013","0.014","0.015","0.016","0.017","0.018","0.019","0.020","0.021","0.022","0.023","0.024","0.025","0.026","0.027","0.028","0.029","0.030"};
		default = 10;
	};
	//damage dealt per second if thirst == 100
	class CODI_hgf_thirstDamage
	{
		title = "CODI_hgf_thirstDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		texts[] = {"off","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010","0.011","0.012","0.013","0.014","0.015","0.016","0.017","0.018","0.019","0.020","0.021","0.022","0.023","0.024","0.025","0.026","0.027","0.028","0.029","0.030"};
		default = 10;
	};
	//indirect amount of fatigue increased per second
	class CODI_hgf_fatigueRate
	{
		title = "CODI_hgf_fatigueRate";
		values[] = {5,10,15,20,25,30,35,40,45,50};
		texts[] = {"0.005","0.010","0.015","0.020","0.025","0.030","0.035","0.040","0.045","0.050"};
		default = 20;
	};
	//1 -> players are forced to walk if thirst/hunger/fatigue is too high
	class CODI_hgf_speedLimitation
	{
		title = "CODI_hgf_speedLimitation";
		values[] = {0,1};
		texts[] = {"0", "1"};
		default = 1;
	};
	//thirst needs to be > this value before the player is forced to walk
	class CODI_hgf_thirstSpeedLimitation
	{
		title = "CODI_hgf_thirstSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"50","55","60","65","70","75","80","85","90","95","100"};
		default = 75;
	};
	//hunger needs to be > this value before the player is forced to walk
	class CODI_hgf_hungerSpeedLimitation
	{
		title = "CODI_hgf_hungerSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"50","55","60","65","70","75","80","85","90","95","100"};
		default = 75;
	};
	//fatigue needs to be > this value before the player is forced to walk
	class CODI_hgf_fatigueSpeedLimitation
	{
		title = "CODI_hgf_fatigueSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"50","55","60","65","70","75","80","85","90","95","100"};
		default = 75;
	};
	//player's damage needs to be > this value before the player's damage is increased per second
	class CODI_hgf_bleedingDamageLimit
	{
		title = "CODI_hgf_fatigueSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"0.5","0.55","0.60","0.65","0.70","0.75","0.80","0.85","0.90","0.95","1"};
		default = 75;
	};
	//damage dealt per second if player is bleeding
	class CODI_hgf_bleedingDamage
	{
		title = "CODI_hgf_bleedingDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		texts[] = {"off","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010","0.011","0.012","0.013","0.014","0.015","0.016","0.017","0.018","0.019","0.020","0.021","0.022","0.023","0.024","0.025","0.026","0.027","0.028","0.029","0.030"};
		default = 2;
	};
	//rate how much the temperature changes per second
	class CODI_hgf_temperatureChangeValue
	{
		title = "CODI_hgf_temperatureChangeValue";
		values[] = {0,1,2,3,4,5};
		texts[] = {"0","0.001","0.002","0.003","0.004","0.005"};
		default = 3;
	};
	//damage dealt per second if temperature is too low or too high
	class CODI_hgf_temperatureDamage
	{
		title = "CODI_hgf_temperatureDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		texts[] = {"0","0.0001","0.0002","0.0003","0.0004","0.0005","0.0006","0.0007","0.0008","0.0009","0.0010","0.0011","0.0012","0.0013","0.0014","0.0015","0.0016","0.0017","0.0018","0.0019","0.0020"};
		default = 10;
	};
	//minimum temperature before damage is dealt
	class CODI_hgf_temperatureMin
	{
		title = "CODI_hgf_temperatureMin";
		values[] = {200,210,220,230,240,250,260,270,280,290,300};
		texts[] = {"20","21","22","23","24","25","26","27","28","29","30"};
		default = 280;
	};
	//normal temperature
	class CODI_hgf_temperatureAvg
	{
		title = "CODI_hgf_temperatureAvg";
		values[] = {350,360,370,380};
		texts[] = {"35","36","37","38"};
		default = 366;
	};
	//maximum temperature before damage is dealt
	class CODI_hgf_temperatureMax
	{
		title = "CODI_hgf_temperatureMax";
		values[] = {400,410,420,430,440,450,460,470,480,490,500};
		texts[] = {"40","41","42","43","44","45","46","47","48","49","50"};
		default = 440;
	};
	//1 -> temperature influences hunger and thirst
	class CODI_hgf_temperaturInfluencesThirstHunger
	{
		title = "CODI_hgf_temperaturInfluencesThirstHunger";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//how much bad effects influence the temperaturchange
	class CODI_hgf_temperatureBadFactor
	{
		title = "CODI_hgf_temperatureBadFactor";
		values[] = {1,2,3,4,5,6,7,8,9,10};
		texts[] = {"0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 3;
	};
	//damage player > this -> player gets blackouts
//	class CODI_hgf_damagesystemValue
//	{
//		title = "CODI_hgf_damagesystemValue";
//		values[] = {50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100};
//		texts[] = {"0.5", "0.55", "0.6", "0.65", "0.7", "0.75", "0.8", "0.85", "0.9", "0.95", "1"};
//		default = 75;
//	};
	//how much a player can eat per second (decrease hunger)
	class CODI_hgf_eatValue
	{
		title = "CODI_hgf_eatValue";
		values[] = {1,2,3,4,5,6,7,8,9,10,100};
		texts[] = {"1","2","3","4","5","6","7","8","9","10","100"};
		default = 2;
	};
	//how much a player can drink per second (decrease thirst)
	class CODI_hgf_drinkValue
	{
		title = "CODI_hgf_drinkValue";
		values[] = {1,2,3,4,5,6,7,8,9,10,100};
		texts[] = {"1","2","3","4","5","6","7","8","9","10","100"};
		default = 2;
	};
	//how much damage the player gets per second if he has an infected wound
	class CODI_hgf_infectionDamage
	{
		title = "CODI_hgf_infectionDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {"0","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010"};
		default = 1;
	};
	//chance (in percent) to get an infected wound per damagepoint per second
	class CODI_hgf_infectionChance
	{
		title = "CODI_hgf_infectionChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1.0"};
		default = 3;
	};



//hud
	//1 -> show thirst in hud
	class CODI_hgf_showThirst
	{
		title = "CODI_hgf_showThirst";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> hunger thirst in hud
	class CODI_hgf_showHunger
	{
		title = "CODI_hgf_showHunger";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> fatigue thirst in hud
	class CODI_hgf_showFatigue
	{
		title = "CODI_hgf_showFatigue";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> show damage in hud
	class CODI_hgf_showDamage
	{
		title = "CODI_hgf_showDamage";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> show temperature in hud
	class CODI_hgf_showTemperature
	{
		title = "CODI_hgf_showTemperature";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
};