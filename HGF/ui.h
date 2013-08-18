/*
 * Copyright of RscMapControl, TAO_RscStdText and Tao_FoldMap belongs to tao_foldmap.
 */
#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC 40
#define CT_XBUTTON          41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_ANIMATED_USER 99
#define CT_MAP              100
#define CT_MAP_MAIN 101
#define CT_LISTNBOX 102
// Static styles
#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96
#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176
#define ST_SHADOW 0x100
#define ST_NO_RECT 0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO 0x800
#define ST_TITLE ST_TITLE_BAR + ST_CENTER // Slider styles
#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HORZ 0x400
#define SL_TEXTURES 0x10 // Listbox styles
#define LB_TEXTURES 0x10
#define LB_MULTI 0x20
#define FontM "EtelkaNarrowMediumPro"
#define true 1
#define false 0
class TAO_RscStdText
{
   type = 0;
   idc = -1;
   style = 2;
   colorBackground[] = {0,0,0,0};
   colorText[] = {1,1,1,1};
   font = "EtelkaNarrowMediumPro";
   size = 2.3;
   sizeEx = 0.055;
   shadow = 2;
};
class RscMapControl
{
	text = "";
	colorTracks[] = {1,1,1,1};
	colorRoads[] = {1,1,1,1};
	colorMainRoads[] = {1,1,1,1};
	colorTracksFill[] = {0,0,0,0};
	colorRoadsFill[] = {0,0,0,0};
	colorMainRoadsFill[] = {0,0,0,0};
	colorGrid[] = {1,1,1,1};
	colorGridMap[] = {1,1,1,1};
};
class RscText
{
	moving = false;
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	sizeEx = 0.03;
	colorBackground[] = { 1, 1, 1, 0.3 };
	colorText[] = { 0, 0, 0, 1 };
	font = "EtelkaNarrowMediumPro";
};
class RscTitles
{
	class Tao_FoldMap
	{
		idd = -1;
		onLoad = "with uiNameSpace do { Tao_Foldmap = _this select 0 }; [] call tao_foldmap_initDialog;";
		onUnload = "";
		movingEnable = 1;
		duration = 1000000;
		fadeIn = 0;
		fadeOut = 0;
		controls[] = {"Tao_FoldMapBack", "TAO_Foldmap"};
		
		
		class Tao_FoldMapBack : TAO_RscStdText
		{
			idc = 23;
			x = safezoneX + 0.574 * safezoneW;
			y = safezoneY + 1 * safezoneW;
			w = safezoneW * 0.3325;
			h = safezoneH * 0.69;
			colorBackground[] = {1, 1, 0.84, 0.95};
			text = "";
		};
		
		
		class Tao_FoldMap : RscMapControl
		{
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

			font = "EtelkaNarrowMediumPro";
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

			fontLabel = "EtelkaNarrowMediumPro";
			sizeExLabel = 0.027000;
			fontGrid = "EtelkaNarrowMediumPro";
			sizeExGrid = 0.023000;
			fontUnits = "EtelkaNarrowMediumPro";
			sizeExUnits = 0.031000;
			fontNames = "EtelkaNarrowMediumPro";
			sizeExNames = 0.056000;
			fontInfo = "EtelkaNarrowMediumPro";
			sizeExInfo = 0.031000;
			fontLevel = "EtelkaNarrowMediumPro";
			sizeExLevel = 0.021000;
			
			maxSatelliteAlpha = 0;     // Alpha to 0 by default
			alphaFadeStartScale = 0.1; 
			alphaFadeEndScale = 3;   // Prevent div/0

			showCountourInterval=0;
			onMouseButtonClick = "";
			onMouseButtonDblClick = "";

			class CustomMark {
				icon = "";
				//icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0, 0, 1, 1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};

			class Legend {
				x = -1;
				y = -1;
				w = 0.340000;
				h = 0.152000;
				font = "EtelkaNarrowMediumPro";
				sizeEx = 0.039210;
				colorBackground[] = {0.906000, 0.901000, 0.880000, 0.800000};
				color[] = {0, 0, 0, 1};
			};

			class Bunker {
				icon = "";
				//icon = "\ca\ui\data\map_bunker_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 14;
				importance = "1.5 * 14 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Bush {
				icon = "";
				//icon = "\ca\ui\data\map_bush_ca.paa";
				color[] = {0.550000, 0.640000, 0.430000, 0};
				size = 14;
				importance = "0.2 * 14 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class BusStop {
				icon = "";
				//icon = "\ca\ui\data\map_busstop_ca.paa";
				color[] = {0, 0, 1, 1};
				size = 10;
				importance = "1 * 10 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Command {
				icon = "";
				//icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};

			class Cross {
				icon = "";
				//icon = "\ca\ui\data\map_cross_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "0.7 * 16 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Fortress {
				icon = "";
				//icon = "\ca\ui\data\map_bunker_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Fuelstation {
				icon = "";
				//icon = "\ca\ui\data\map_fuelstation_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.750000;
				coefMax = 4;
			};

			class Fountain {
				icon = "";
				//icon = "\ca\ui\data\map_fountain_ca.paa";
				color[] = {0, 0.350000, 0.700000, 1};
				size = 12;
				importance = "1 * 12 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Hospital {
				icon = "";
				//icon = "\ca\ui\data\map_hospital_ca.paa";
				color[] = {0.780000, 0, 0.050000, 1};
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.500000;
				coefMax = 4;
			};

			class Chapel {
				icon = "";
				//icon = "\ca\ui\data\map_chapel_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "1 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class Church {
				icon = "";
				//icon = "\ca\ui\data\map_church_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class Lighthouse {
				icon = "";
				//icon = "\ca\ui\data\map_lighthouse_ca.paa";
				color[] = {0.780000, 0, 0.050000, 1};
				size = 20;
				importance = "3 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class Quay {
				icon = "";
				//icon = "\ca\ui\data\map_quay_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "2 * 16 * 0.05";
				coefMin = 0.500000;
				coefMax = 4;
			};

			class Rock {
				icon = "";
				//icon = "\ca\ui\data\map_rock_ca.paa";
				color[] = {0, 0.900000, 0, 0};
				size = 12;
				importance = "0.5 * 12 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Ruin {
				icon = "";
				//icon = "\ca\ui\data\map_ruin_ca.paa";
				color[] = {0.780000, 0, 0.050000, 1};
				size = 16;
				importance = "1.2 * 16 * 0.05";
				coefMin = 1;
				coefMax = 4;
			};

			class SmallTree {
				icon = "";
				//icon = "\ca\ui\data\map_smalltree_ca.paa";
				color[] = {0.550000, 0.640000, 0.430000, 0};
				size = 12;
				importance = "0.6 * 12 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Stack {
				icon = "";
				//icon = "\ca\ui\data\map_stack_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 20;
				importance = "2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class Tree {
				icon = "";
				//icon = "\ca\ui\data\map_tree_ca.paa";
				color[] = {0.550000, 0.640000, 0.430000, 0};
				size = 12;
				importance = "0.9 * 16 * 0.05";
				coefMin = 0.250000;
				coefMax = 4;
			};

			class Tourism {
				icon = "";
				//icon = "\ca\ui\data\map_tourism_ca.paa";
				color[] = {0.780000, 0, 0.050000, 1};
				size = 16;
				importance = "1 * 16 * 0.05";
				coefMin = 0.700000;
				coefMax = 4;
			};

			class Transmitter {
				icon = "";
				//icon = "\ca\ui\data\map_transmitter_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 20;
				importance = "2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class ViewTower {
				icon = "";
				//icon = "\ca\ui\data\map_viewtower_ca.paa";
				color[] = {0, 0.900000, 0, 1};
				size = 16;
				importance = "2.5 * 16 * 0.05";
				coefMin = 0.500000;
				coefMax = 4;
			};

			class Watertower {
				icon = "";
				//icon = "\ca\ui\data\map_watertower_ca.paa";
				color[] = {0, 0.350000, 0.700000, 1};
				size = 32;
				importance = "1.2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class Waypoint {
				icon = "";
				//icon = "\ca\ui\data\map_waypoint_ca.paa";
				size = 20;
				color[] = {0, 0.900000, 0, 1};
				importance = "1.2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class Task {
				icon = "";
				//icon = "\ca\ui\data\map_waypoint_ca.paa";
				iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
				iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
				iconDone = "#(argb,8,8,3)color(0,0,0,1)";
				iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
				colorCreated[] = {1,1,1,1};
				colorCanceled[] = {1,1,1,1};
				colorDone[] = {1,1,1,1};
				colorFailed[] = {1,1,1,1};
				size = 20;
				color[] = {0, 0.900000, 0, 1};
				importance = "1.2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class WaypointCompleted {
				icon = "";
				//icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
				size = 20;
				color[] = {0, 0.900000, 0, 1};
				importance = "1.2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};

			class ActiveMarker {
				icon = "";
				//icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
				size = 20;
				color[] = {0, 0.900000, 0, 1};
				importance = "1.2 * 16 * 0.05";
				coefMin = 0.900000;
				coefMax = 4;
			};
		};
	};
	
	
	
	
	
	class hg_hud
	{
		idd = 55510;
		fadeout=0;
		fadein=0;
		duration = 86400;//24h
		name = "hg_hud";
		onLoad = "uiNamespace setVariable ['hg_hud', _this select 0]";

		class controlsBackground
		{
			class hg_thirst_key : RscText
			{
				idc = -1;
				text = "$STR_CUT_THIRST";
				x = 1.3975;
				y = 1.16;
				w = 0.12;
				h = 0.04;
			};
			class hg_thirst_value : RscText
			{
				idc = 55511;
				text = "?";
				x = 1.5175;
				y = 1.16;
				w = 0.07;
				h = 0.04;
			};
			class hg_hunger_key : RscText
			{
				idc = -1;
				text = "Hunger:";
				x = 1.3975;
				y = 1.12;
				w = 0.12;
				h = 0.04;
			};
			class hg_hunger_value : RscText
			{
				idc = 55512;
				text = "?";
				x = 1.5175;
				y = 1.12;
				w = 0.07;
				h = 0.04;
			};
			class hg_fatigue_key : RscText
			{
				idc = -1;
				text = "Fatigue:";
				x = 1.3975;
				y = 1.08;
				w = 0.12;
				h = 0.04;
			};
			class hg_fatigue_value : RscText
			{
				idc = 55513;
				text = "?";
				x = 1.5175;
				y = 1.08;
				w = 0.07;
				h = 0.04;
			};
			class hg_health_key : RscText
			{
				idc = -1;
				text = "Damage:";
				x = 1.3975;
				y = 1.04;
				w = 0.12;
				h = 0.04;
			};
			class hg_health_value : RscText
			{
				idc = 55514;
				text = "?";
				x = 1.5175;
				y = 1.04;
				w = 0.07;
				h = 0.04;
			};
			class hg_temperature_key : RscText
			{
				idc = -1;
				text = "Temperature:";
				x = 1.3975;
				y = 1.00;
				w = 0.12;
				h = 0.04;
			};
			class hg_temperature_value : RscText
			{
				idc = 55515;
				text = "?";
				x = 1.5175;
				y = 1.00;
				w = 0.07;
				h = 0.04;
			};
		};
	};
};