#define true	1
#define false	0

class CfgPatches {
	class tao_foldmap_a3 {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {CBA_XEH, CBA_MAIN};
		version = 1.1;
		author[] = {"Taosenai"};
	};
};

class Extended_PreInit_EventHandlers {
	class tao_foldmap_a3 {
		clientInit = "call ('\tao_foldmap_a3\XEH_preClientInit.sqf' call SLX_XEH_COMPILE)";
	};
};

class TAO_RscStdText {
   type = 0;
   idc = -1;
   style = 2;
   colorBackground[] = {0,0,0,0};
   colorText[] = {1,1,1,1};
   font = "PuristaMedium";
   size = 2.3;
   sizeEx = 0.055;
   shadow = 2;
};

class RscMapControl;

class RscTitles {
	class Tao_FoldMap {
		idd = -1;
		onLoad = "with uiNameSpace do { Tao_Foldmap = _this select 0 }; [] call tao_foldmap_initDialog;";
		onUnload = "";
		movingEnable = 1;
		duration = 1000000;
		fadeIn = 0;
		fadeOut = 0;
		controls[] = {"Tao_FoldMapBack", "TAO_Foldmap"};
		
		
		class Tao_FoldMapBack : TAO_RscStdText {
			idc = 23;
			x = safezoneX + 0.574 * safezoneW;
			y = safezoneY + 1 * safezoneW;
			w = safezoneW * 0.3325;
			h = safezoneH * 0.69;
			colorBackground[] = {1, 1, 0.84, 0.95};
			text = "";
		};
		
		
		class Tao_FoldMap : RscMapControl {
			idc = 25;
			x = safezoneX + 0.58 * safezoneW;
			y = safezoneY + 1 * safezoneW;
			w = safezoneW * 0.32;
			h = safezoneH * 0.67;
			type = 101; // Use 100 to hide markers
			style = 48;
			colorLevels[] = {0.65, 0.6, 0.55, 1};
			colorSea[] = {0.46, 0.65, 0.74, 0.5};
			colorForest[] = {0.02, 0.5, 0.01, 0.3};
			colorForestBorder[] = {0.02, 0.5, 0.01, 0.27};
			colorRocks[] = {0, 0, 0, 0.3};
			colorCountlines[] = {0.65, 0.45, 0.27, 0.70};
			colorMainCountlines[] = {1, 0.1, 0.1, 0.9};
			colorCountlinesWater[] = {0.25, 0.4, 0.5, 0.3};
			colorMainCountlinesWater[] = {0.25, 0.4, 0.5, 0.9};
			colorPowerLines[] = {0.1, 0.1, 0.1, 1};
			colorRailWay[] = {0.8, 0.2, 0, 1};
			
			colorRocksBorder[] = {0, 0, 0, 0};
			colorNames[] = {0.1, 0.1, 0.1, 0.9};
			colorInactive[] = {1, 1, 1, 0.5};
			colorOutside[] = {0, 0, 0, 1};
			colorBackground[] = {1, 1, 0.85, 0.95};
			colorText[] = {1, 1, 1, 0.85};

			font = "PuristaMedium";
			sizeEx = 0.0270000;
			scaleMin = 1e-006;
			scaleMax = 1000;
			scaleDefault = 0.18;
		

			stickX[] = {0.20, {"Gamma", 1.00, 1.50} };
			stickY[] = {0.20, {"Gamma", 1.00, 1.50} };
			ptsPerSquareSea = 6;
			ptsPerSquareTxt = 8;
			ptsPerSquareCLn = 8;
			ptsPerSquareExp = 8;
			ptsPerSquareCost = 8;
			ptsPerSquareFor = "4.0f";
			ptsPerSquareForEdge = "10.0f";
			ptsPerSquareRoad = 2;
			ptsPerSquareObj = 10;

			fontLabel = "PuristaMedium";
			sizeExLabel = 0.027000;
			fontGrid = "PuristaMedium";
			sizeExGrid = 0.023000;
			fontUnits = "PuristaMedium";
			sizeExUnits = 0.031000;
			fontNames = "PuristaMedium";
			sizeExNames = 0.056000;
			fontInfo = "PuristaMedium";
			sizeExInfo = 0.031000;
			fontLevel = "PuristaMedium";
			sizeExLevel = 0.021000;
			
			maxSatelliteAlpha = 0;     // Alpha to 0 by default
			alphaFadeStartScale = 0.1; 
			alphaFadeEndScale = 3;   // Prevent div/0

			showCountourInterval=0;
			onMouseButtonClick = "";
			onMouseButtonDblClick = "";
			
			//text = "\ca\ui\data\map_background2_co.paa";

			// class CustomMark {
				// icon = "\ca\ui\data\map_waypoint_ca.paa";
				// color[] = {0, 0, 1, 1};
				// size = 18;
				// importance = 1;
				// coefMin = 1;
				// coefMax = 1;
			// };

			// class Legend {
				// x = -1;
				// y = -1;
				// w = 0.340000;
				// h = 0.152000;
				// font = "Zeppelin32";
				// sizeEx = 0.039210;
				// colorBackground[] = {0.906000, 0.901000, 0.880000, 0.800000};
				// color[] = {0, 0, 0, 1};
			// };

			// class Bunker {
				// icon = "\ca\ui\data\map_bunker_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 14;
				// importance = "1.5 * 14 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Bush {
				// icon = "\ca\ui\data\map_bush_ca.paa";
				// color[] = {0.550000, 0.640000, 0.430000, 0};
				// size = 14;
				// importance = "0.2 * 14 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class BusStop {
				// icon = "\ca\ui\data\map_busstop_ca.paa";
				// color[] = {0, 0, 1, 1};
				// size = 10;
				// importance = "1 * 10 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Command {
				// icon = "\ca\ui\data\map_waypoint_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 18;
				// importance = 1;
				// coefMin = 1;
				// coefMax = 1;
			// };

			// class Cross {
				// icon = "\ca\ui\data\map_cross_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "0.7 * 16 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Fortress {
				// icon = "\ca\ui\data\map_bunker_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Fuelstation {
				// icon = "\ca\ui\data\map_fuelstation_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.750000;
				// coefMax = 4;
			// };

			// class Fountain {
				// icon = "\ca\ui\data\map_fountain_ca.paa";
				// color[] = {0, 0.350000, 0.700000, 1};
				// size = 12;
				// importance = "1 * 12 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Hospital {
				// icon = "\ca\ui\data\map_hospital_ca.paa";
				// color[] = {0.780000, 0, 0.050000, 1};
				// size = 16;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.500000;
				// coefMax = 4;
			// };

			// class Chapel {
				// icon = "\ca\ui\data\map_chapel_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "1 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class Church {
				// icon = "\ca\ui\data\map_church_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class Lighthouse {
				// icon = "\ca\ui\data\map_lighthouse_ca.paa";
				// color[] = {0.780000, 0, 0.050000, 1};
				// size = 20;
				// importance = "3 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class Quay {
				// icon = "\ca\ui\data\map_quay_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.500000;
				// coefMax = 4;
			// };

			// class Rock {
				// icon = "\ca\ui\data\map_rock_ca.paa";
				// color[] = {0, 0.900000, 0, 0};
				// size = 12;
				// importance = "0.5 * 12 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Ruin {
				// icon = "\ca\ui\data\map_ruin_ca.paa";
				// color[] = {0.780000, 0, 0.050000, 1};
				// size = 16;
				// importance = "1.2 * 16 * 0.05";
				// coefMin = 1;
				// coefMax = 4;
			// };

			// class SmallTree {
				// icon = "\ca\ui\data\map_smalltree_ca.paa";
				// color[] = {0.550000, 0.640000, 0.430000, 0};
				// size = 12;
				// importance = "0.6 * 12 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Stack {
				// icon = "\ca\ui\data\map_stack_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 20;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class Tree {
				// icon = "\ca\ui\data\map_tree_ca.paa";
				// color[] = {0.550000, 0.640000, 0.430000, 0};
				// size = 12;
				// importance = "0.9 * 16 * 0.05";
				// coefMin = 0.250000;
				// coefMax = 4;
			// };

			// class Tourism {
				// icon = "\ca\ui\data\map_tourism_ca.paa";
				// color[] = {0.780000, 0, 0.050000, 1};
				// size = 16;
				// importance = "1 * 16 * 0.05";
				// coefMin = 0.700000;
				// coefMax = 4;
			// };

			// class Transmitter {
				// icon = "\ca\ui\data\map_transmitter_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 20;
				// importance = "2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class ViewTower {
				// icon = "\ca\ui\data\map_viewtower_ca.paa";
				// color[] = {0, 0.900000, 0, 1};
				// size = 16;
				// importance = "2.5 * 16 * 0.05";
				// coefMin = 0.500000;
				// coefMax = 4;
			// };

			// class Watertower {
				// icon = "\ca\ui\data\map_watertower_ca.paa";
				// color[] = {0, 0.350000, 0.700000, 1};
				// size = 32;
				// importance = "1.2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class Waypoint {
				// icon = "\ca\ui\data\map_waypoint_ca.paa";
				// size = 20;
				// color[] = {0, 0.900000, 0, 1};
				// importance = "1.2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class Task {
				// icon = "\ca\ui\data\map_waypoint_ca.paa";
				// iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
				// iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
				// iconDone = "#(argb,8,8,3)color(0,0,0,1)";
				// iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
				// colorCreated[] = {1,1,1,1};
				// colorCanceled[] = {1,1,1,1};
				// colorDone[] = {1,1,1,1};
				// colorFailed[] = {1,1,1,1};
				// size = 20;
				// color[] = {0, 0.900000, 0, 1};
				// importance = "1.2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class WaypointCompleted {
				// icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
				// size = 20;
				// color[] = {0, 0.900000, 0, 1};
				// importance = "1.2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };

			// class ActiveMarker {
				// icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
				// size = 20;
				// color[] = {0, 0.900000, 0, 1};
				// importance = "1.2 * 16 * 0.05";
				// coefMin = 0.900000;
				// coefMax = 4;
			// };	
		};
	};
};