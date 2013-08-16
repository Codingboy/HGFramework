class Params
{
//vehicles
	//height vehicles are paradropped at
	class hg_vehicleDropHeight
	{
		title = "hg_vehicleDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//time between 2 vehiclespawns
	class hg_vehicleSpawnDelay
	{
		title = "hg_vehicleSpawnDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900"};
		default = 300;
	};
	//time between teleport of the players to the arena and the first spawn of a vehicle
	class hg_vehicleFirstDelay
	{
		title = "hg_vehicleFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700,86400};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900","960","1020","1080","1140","1200","1260","1320","1380","1440","1500","1560","1620","1680","1740","1800","1860","1920","1980","2040","2100","2160","2220","2280","2340","2400","2460","2520","2580","2640","2700","never"};
		default = 86400;
	};
	//time between players are teleported to the arena and spawn of first boat
	class hg_boatFirstDelay
	{
		title = "hg_boatFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700,86400};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900","960","1020","1080","1140","1200","1260","1320","1380","1440","1500","1560","1620","1680","1740","1800","1860","1920","1980","2040","2100","2160","2220","2280","2340","2400","2460","2520","2580","2640","2700","never"};
		default = 86400;
	};
	//paradropheight for boats
	class hg_boatDropHeight
	{
		title = "hg_boatDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//time between 2 boatspawns
	class hg_boatSpawnDelay
	{
		title = "hg_boatSpawnDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900"};
		default = 300;
	};
	class hg_heliDropHeight
	{
		title = "hg_heliDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//height helis are paradropped at
	class hg_heliSpawnDelay
	{
		title = "hg_heliSpawnDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900"};
		default = 300;
	};
	//time between teleport of the players to the arena and the first spawn of a heli
	class hg_heliFirstDelay
	{
		title = "hg_heliFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720, 780, 840, 900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700,86400};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600", "660", "720", "780", "840", "900","960","1020","1080","1140","1200","1260","1320","1380","1440","1500","1560","1620","1680","1740","1800","1860","1920","1980","2040","2100","2160","2220","2280","2340","2400","2460","2520","2580","2640","2700","never"};
		default = 86400;
	};



//start
	//time between teleporting players to the arena and the deactivation of the mines
	class hg_mineTimer
	{
		title = "hg_mineTimer";
		values[] = {0,30,60,90,120};
		texts[] = {"0","30","60","90","120"};
		default = 30;
	};
	//radius of the circle the players create after teleporting to the arena
	class hg_startRadius
	{
		title = "hg_startRadius";
		values[] = {25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100};
		texts[] = {"25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100"};
		default = 50;
	};
	//time until startcrates despawn
	class hg_startCrateDespawnTime
	{
		title = "hg_startCrateDespawnTime";
		values[] = {120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 120;
	};



//loot
	//number of magazines in each ammobox
	class hg_loot_magazineCount
	{
		title = "hg_loot_magazineCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 4;
	};
	//number of explosives in each explosivebox
	class hg_loot_explosivesCount
	{
		title = "hg_loot_explosivesCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 2;
	};
	//number of grenades in each grenadebox
	class hg_loot_grenadeCount
	{
		title = "hg_loot_grenadeCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 5;
	};
	//number of special items in each specialbox
	class hg_loot_specialCount
	{
		title = "hg_loot_specialCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 5;
	};
	//number of support items in each supportbox
	class hg_loot_supportCount
	{
		title = "hg_loot_supportCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 3;
	};
	//number of weapons/magazines in each weaponbox
	class hg_loot_weaponCount
	{
		title = "hg_loot_weaponCount";
		values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		texts[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
		default = 1;
	};
	//drop height for paradroped special loot crates
	class hg_specialCrateDropHeight
	{
		title = "hg_specialCrateDropHeight";
		values[] = {500, 1000, 1500, 2000, 2500, 3000};
		texts[] = {"500", "1000", "1500", "2000", "2500", "3000"};
		default = 2000;
	};
	//time between players are teleported to the arena and the first spawn of a special loot crate
	class hg_specialCrateFirstDelay
	{
		title = "hg_specialCrateFirstDelay";
		values[] = {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"0", "60", "120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 0;
	};
	//time between 2 spawns of a special loot crate
	class hg_specialCrateDelay
	{
		title = "hg_specialCrateDelay";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 300;
	};
	//time between touching ground of a special loot crate and its despawn
	class hg_specialCrateDespawnTime
	{
		title = "hg_specialCrateDespawnTime";
		values[] = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
		texts[] = {"60", "120", "180", "240", "300", "360", "420", "480", "540", "600"};
		default = 120;
	};
	//chance for a normal loot crate to spawn; 0 -> no loot crate will spawn; 100 -> all orange box have loot; reduce it to add a little random to the mission ~90
	class hg_crateSpawnChance
	{
		title = "hg_crateSpawnChance";
		values[] = {10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100};
		texts[] = {"10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100"};
		default = 50;
	};
	//chance to spawn a ammocrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_ammoChance
	{
		title = "hg_loot_ammoChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a weaponcrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_weaponChance
	{
		title = "hg_loot_weaponChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a grenadecrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_grenadeChance
	{
		title = "hg_loot_grenadeChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a explosivecrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_explosiveChance
	{
		title = "hg_loot_explosiveChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a supportcrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_supportChance
	{
		title = "hg_loot_supportChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a specialcrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_specialChance
	{
		title = "hg_loot_specialChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a watercrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_waterChance
	{
		title = "hg_loot_waterChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//chance to spawn a foodcrate on an orange marker; SUM(hg_loot_*) ~ 100
	class hg_loot_foodChance
	{
		title = "hg_loot_foodChance";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
		texts[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"};
		default = 12;
	};
	//1 -> vas available at start; 0 -> 3 weaponcrates available on start
	class hg_vasOnStart
	{
		title = "hg_vasOnStart";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> vas paradropped as special loot crate
	class hg_vasOnParadrop
	{
		title = "hg_vasOnParadrop";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 0;
	};
	//guarantees n crates of each type, requires at least 8*n crates in the mission otherwise this may fail! Note: this crates are excluded from spawnchance calculation!
	class hg_lootGuaranteePerType
	{
		title = "hg_lootGuaranteePerType";
		values[] = {0,1,2,3,4,5};
		texts[] = {"0","1","2","3","4","5"};
		default = 3;
	};



//general settings
	//0 -> all civilians will be removed
	class hg_civilianPresent
	{
		title = "hg_civilianPresent";
		values[] = {1, 0};
		texts[] = {"true", "false"};
		default = 0;
	};
	//1 -> orange markers will be removed when lootcrates are spawned
	class hg_deleteCrateMarkers
	{
		title = "hg_deleteCrateMarkers";
		values[] = {1, 0};
		texts[] = {"true", "false"};
		default = 0;
	};

	//radius of the safezone
	class hg_safeZoneDistance
	{
		title = "hg_safeZoneDistance";
		values[] = {10, 25, 50, 75, 100, 125, 150, 175, 200};
		texts[] = {"10", "25", "50", "75", "100", "125", "150", "175", "200"};
		default = 25;
	};
	//defines the mission's starttime
	class hg_startHour
	{
		title = "hg_startHour";
		values[] = {-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		texts[] = {"evening","morning","night","day","random","0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"};
		default = -2;
	};
	//defines the mission's starttime
	class hg_startMinute
	{
		title = "hg_startMinute";
		values[] = {-1,0,5,10,15,20,25,30,35,40,45,50,55};
		texts[] = {"random","0","5","10","15","20","25","30","35","40","45","50","55"};
		default = -1;
	};
	//time before players are teleported to the arena; needed for framework initialisation; player can regroup while this time
	class hg_groupUpTime
	{
		title = "hg_groupUpTime";
		values[] = {0,10,20,30,40,50,60,70,80,90,100,110,120};
		texts[] = {"off","10","20","30","40","50","60","70","80","90","100","110","120"};
		default = 0;
	};
	//timeaccelerationfactor for the mission; 60 -> 1 rl second -> 1 ingame minute
	class hg_acceleration
	{
		title = "hg_acceleration";
		values[] = {1,2,4,8,16,24,30,60,90,120};
		texts[] = {"1","2","4","8","16","24","30","60","90","120"};
		default = 60;
	};
	//time between player died and removing of its corpse; 0 -> no removing
	class hg_removePlayersTime
	{
		title = "hg_removePlayersTime";
		values[] = {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300};
		texts[] = {"no", "30", "60", "90", "120", "150", "180", "210", "240", "270", "300"};
		default = 120;
	};
	//time between vehicle/heli/boat destroyed and removing of its wreck; 0 -> no removing
	class hg_removeVehiclesTime
	{
		title = "hg_removeVehiclesTime";
		values[] = {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300};
		texts[] = {"no", "30", "60", "90", "120", "150", "180", "210", "240", "270", "300"};
		default = 0;
	};
	//time between players are teleported to the arena and the deathzone warning pops up, deactivation of borders, hint where safezone will be
	class hg_deathZoneWarningTime
	{
		title = "hg_deathZoneWarningTime";
		values[] = {300,600,900,1200,1500,1800,2100,2400,2700,3000,3300,3600,86400};
		texts[] = {"300","600","900","1200","1500","1800","2100","2400","2700","3000","3300","3600","never"};
		default = 600;
	};
	//time between deathzone warning pops up and killing all players who are not in the safezone
	class hg_deathZoneDelay
	{
		title = "hg_deathZoneDelay";
		values[] = {60,120,180,240,300,360,420,480,540,600};
		texts[] = {"60","120","180","240","300","360","420","480","540","600"};
		default = 600;
	};
	//1 -> revive enabled
	class hg_revive
	{
		title = "hg_revive";
		values[] = {0,1};
		texts[] = {"disabled", "enabled"};
		default = 0;
	};
	//maximum error of playerposition and the marker displayed on the map for enemy players
	class hg_markPlayersPrecision
	{
		title = "hg_markPlayersPrecision";
		values[] = {0,100,200,300,400,500,600,700,800,900,1000};
		texts[] = {"0","100","200","300","400","500","600","700","800","900","1000"};
		default = 100;
	};
	//1 -> players name is added to its marker on the map
	class hg_markPlayersName
	{
		title = "hg_markPlayersName";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 0;
	};
	//1 -> enemy players are marked on the map
	class hg_markPlayers
	{
		title = "hg_markPlayers";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> delete all markers except lootcrates after teleporting players to the arena
	class hg_deleteSpecialMarkers
	{
		title = "hg_deleteSpecialMarkers";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//time between player leaves the allowed area and its kill
	class hg_bordersReturnTime
	{
		title = "hg_bordersReturnTime";
		values[] = {5,10,15,20};
		texts[] = {"5","10","15","20"};
		default = 10;
	};
	//1 -> players are killed if leaving the allowed area
	class hg_bordersActive
	{
		title = "hg_bordersActive";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//1 -> bullets are influenced by wind
	class hg_windsystem
	{
		title = "hg_windsystem";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};



//humanity
	//indirect amount of thirst increased per second
	class hg_thirstRate
	{
		title = "hg_thirstRate";
		values[] = {5,10,15,20,25,30,35,40,45,50};
		texts[] = {"0.005","0.010","0.015","0.020","0.025","0.030","0.035","0.040","0.045","0.050"};
		default = 35;
	};
	//indirect amount of hunger increased per second
	class hg_hungerRate
	{
		title = "hg_hungerRate";
		values[] = {5,10,15,20,25,30,35,40,45,50};
		texts[] = {"0.005","0.010","0.015","0.020","0.025","0.030","0.035","0.040","0.045","0.050"};
		default = 30;
	};
	//damage dealt per second if hunger == 100
	class hg_hungerDamage
	{
		title = "hg_hungerDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		texts[] = {"off","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010","0.011","0.012","0.013","0.014","0.015","0.016","0.017","0.018","0.019","0.020","0.021","0.022","0.023","0.024","0.025","0.026","0.027","0.028","0.029","0.030"};
		default = 10;
	};
	//damage dealt per second if thirst == 100
	class hg_thirstDamage
	{
		title = "hg_thirstDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		texts[] = {"off","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010","0.011","0.012","0.013","0.014","0.015","0.016","0.017","0.018","0.019","0.020","0.021","0.022","0.023","0.024","0.025","0.026","0.027","0.028","0.029","0.030"};
		default = 10;
	};
	//indirect amount of fatigue increased per second
	class hg_fatigueRate
	{
		title = "hg_fatigueRate";
		values[] = {5,10,15,20,25,30,35,40,45,50};
		texts[] = {"0.005","0.010","0.015","0.020","0.025","0.030","0.035","0.040","0.045","0.050"};
		default = 20;
	};
	//1 -> players are forced to walk if thirst/hunger/fatigue is too high
	class hg_speedLimitation
	{
		title = "hg_speedLimitation";
		values[] = {0,1};
		texts[] = {"0", "1"};
		default = 1;
	};
	//thirst needs to be > this value before the player is forced to walk
	class hg_thirstSpeedLimitation
	{
		title = "hg_thirstSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"50","55","60","65","70","75","80","85","90","95","100"};
		default = 75;
	};
	//hunger needs to be > this value before the player is forced to walk
	class hg_hungerSpeedLimitation
	{
		title = "hg_hungerSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"50","55","60","65","70","75","80","85","90","95","100"};
		default = 75;
	};
	//fatigue needs to be > this value before the player is forced to walk
	class hg_fatigueSpeedLimitation
	{
		title = "hg_fatigueSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"50","55","60","65","70","75","80","85","90","95","100"};
		default = 75;
	};
	//player's damage needs to be > this value before the player's damage is increased per second
	class hg_bleedingDamageLimit
	{
		title = "hg_fatigueSpeedLimitation";
		values[] = {50,55,60,65,70,75,80,85,90,95,100};
		texts[] = {"0.5","0.55","0.60","0.65","0.70","0.75","0.80","0.85","0.90","0.95","1"};
		default = 75;
	};
	//damage dealt per second if player is bleeding
	class hg_bleedingDamage
	{
		title = "hg_bleedingDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		texts[] = {"off","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010","0.011","0.012","0.013","0.014","0.015","0.016","0.017","0.018","0.019","0.020","0.021","0.022","0.023","0.024","0.025","0.026","0.027","0.028","0.029","0.030"};
		default = 2;
	};
	//rate how much the temperature changes per second
	class hg_temperatureChangeValue
	{
		title = "hg_temperatureChangeValue";
		values[] = {0,1,2,3,4,5};
		texts[] = {"0","0.001","0.002","0.003","0.004","0.005"};
		default = 3;
	};
	//damage dealt per second if temperature is too low or too high
	class hg_temperatureDamage
	{
		title = "hg_temperatureDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		texts[] = {"0","0.0001","0.0002","0.0003","0.0004","0.0005","0.0006","0.0007","0.0008","0.0009","0.0010","0.0011","0.0012","0.0013","0.0014","0.0015","0.0016","0.0017","0.0018","0.0019","0.0020"};
		default = 10;
	};
	//minimum temperature before damage is dealt
	class hg_temperatureMin
	{
		title = "hg_temperatureMin";
		values[] = {200,210,220,230,240,250,260,270,280,290,300};
		texts[] = {"20","21","22","23","24","25","26","27","28","29","30"};
		default = 280;
	};
	//normal temperature
	class hg_temperatureAvg
	{
		title = "hg_temperatureAvg";
		values[] = {350,360,370,380};
		texts[] = {"35","36","37","38"};
		default = 366;
	};
	//maximum temperature before damage is dealt
	class hg_temperatureMax
	{
		title = "hg_temperatureMax";
		values[] = {400,410,420,430,440,450,460,470,480,490,500};
		texts[] = {"40","41","42","43","44","45","46","47","48","49","50"};
		default = 440;
	};
	//1 -> temperature influences hunger and thirst
	class hg_temperaturInfluencesThirstHunger
	{
		title = "hg_temperaturInfluencesThirstHunger";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
	//how much bad effects influence the temperaturchange
	class hg_temperatureBadFactor
	{
		title = "hg_temperatureBadFactor";
		values[] = {1,2,3,4,5,6,7,8,9,10};
		texts[] = {"0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 3;
	};
	//damage player > this -> player gets blackouts
	class hg_damagesystemValue
	{
		title = "hg_damagesystemValue";
		values[] = {50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100};
		texts[] = {"0.5", "0.55", "0.6", "0.65", "0.7", "0.75", "0.8", "0.85", "0.9", "0.95", "1"};
		default = 75;
	};
	//how much a player can eat per second (decrease hunger)
	class hg_eatValue
	{
		title = "hg_eatValue";
		values[] = {1,2,3,4,5,6,7,8,9,10,100};
		texts[] = {"1","2","3","4","5","6","7","8","9","10","100"};
		default = 2;
	};
	//how much a player can drink per second (decrease thirst)
	class hg_drinkValue
	{
		title = "hg_drinkValue";
		values[] = {1,2,3,4,5,6,7,8,9,10,100};
		texts[] = {"1","2","3","4","5","6","7","8","9","10","100"};
		default = 2;
	};
	//how much damage the player gets per second if he has an infected wound
	class hg_infectionDamage
	{
		title = "hg_infectionDamage";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {"0","0.001","0.002","0.003","0.004","0.005","0.006","0.007","0.008","0.009","0.010"};
		default = 1;
	};



//hud
	//1 -> show thirst in hud
	class hg_showThirst
	{
		title = "hg_showThirst";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> hunger thirst in hud
	class hg_showHunger
	{
		title = "hg_showHunger";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> fatigue thirst in hud
	class hg_showFatigue
	{
		title = "hg_showFatigue";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> show damage in hud
	class hg_showDamage
	{
		title = "hg_showDamage";
		values[] = {0, 1};
		texts[] = {"yes", "no"};
		default = 1;
	};
	//1 -> show temperature in hud
	class hg_showTemperature
	{
		title = "hg_showTemperature";
		values[] = {0,1};
		texts[] = {"false","true"};
		default = 1;
	};
};