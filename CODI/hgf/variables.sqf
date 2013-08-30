for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
};
if (CODI_hgf_difficultyDependendSettings == 1) then
{
	if (difficulty == 0) then
	{
		CODI_hgf_ppEffects = 0;
		CODI_hgf_windsystem = 0;
		CODI_hgf_deleteSpecialMarkers = 0;
		CODI_hgf_markPlayers = 1;
		CODI_hgf_deleteCrateMarkers = 0;
	};
	if (difficulty == 1) then
	{
		CODI_hgf_ppEffects = 0;
		CODI_hgf_windsystem = 0;
		CODI_hgf_deleteSpecialMarkers = 0;
		CODI_hgf_markPlayers = 0;
		CODI_hgf_deleteCrateMarkers = 0;
	};
	if (difficulty == 2) then
	{
		CODI_hgf_ppEffects = 0;
		CODI_hgf_windsystem = 1;
		CODI_hgf_deleteSpecialMarkers = 1;
		CODI_hgf_markPlayers = 0;
		CODI_hgf_deleteCrateMarkers = 0;
	};
	if (difficulty == 3) then
	{
		CODI_hgf_showDamage = 0;
		CODI_hgf_ppEffects = 1;
		CODI_hgf_windsystem = 1;
		CODI_hgf_deleteSpecialMarkers = 1;
		CODI_hgf_markPlayers = 0;
		CODI_hgf_deleteCrateMarkers = 1;
	};
};
CODI_hgf_thirstRate = CODI_hgf_thirstRate / 1000;
CODI_hgf_hungerRate = CODI_hgf_hungerRate / 1000;
CODI_hgf_fatigueRate = CODI_hgf_fatigueRate / 1000;
CODI_hgf_hungerDamage = CODI_hgf_hungerDamage / 1000;
CODI_hgf_thirstDamage = CODI_hgf_thirstDamage / 1000;
CODI_hgf_bleedingDamageLimit = CODI_hgf_bleedingDamageLimit / 100;
CODI_hgf_bleedingDamage = CODI_hgf_bleedingDamage / 1000;
CODI_hgf_temperatureChangeValue = CODI_hgf_temperatureChangeValue / 1000;
CODI_hgf_temperatureDamage = CODI_hgf_temperatureDamage / 10000;
CODI_hgf_temperatureMin = CODI_hgf_temperatureMin / 10;
CODI_hgf_temperatureAvg = CODI_hgf_temperatureAvg / 10;
CODI_hgf_temperatureMax = CODI_hgf_temperatureMax / 10;
CODI_hgf_temperatureBadFactor = CODI_hgf_temperatureBadFactor / 10;
//CODI_hgf_damagesystemValue = CODI_hgf_damagesystemValue / 100;
CODI_hgf_infectionDamage = CODI_hgf_infectionDamage / 1000;
CODI_hgf_infectionChance = CODI_hgf_infectionChance / 10000;
tao_foldmap_mapScale = tao_foldmap_mapScale / 100;

CODI_hgf_startColor = "ColorBlack";
CODI_hgf_crateColor = "ColorOrange";
CODI_hgf_specialCrateColor = "ColorRed";
CODI_hgf_safeZoneColor = "ColorGreen";
CODI_hgf_vehicleColor = "ColorBlue";
CODI_hgf_heliColor = "ColorYellow";
CODI_hgf_boatColor = "ColorWhite";

CODI_hgf_allowedAreasColor = "ColorGreen";
CODI_hgf_disallowedAreasColor = "ColorRed";
CODI_hgf_markPlayerColor = "ColorBlack";
CODI_hgf_markPlayerSelfColor = "ColorBlue";

CODI_hgf_loot_weapons = ["arifle_MX_F", "LMG_Zafir_F", "arifle_MX_GL_F", "srifle_GM6_F", "arifle_Katiba_C_F", "srifle_EBR_F", "arifle_Katiba_F", "arifle_Katiba_GL_F", "arifle_MXM_F", "arifle_MXC_F", "srifle_LRR_F", "arifle_Mk20_plain_F", "arifle_Mk20C_plain_F", "arifle_Mk20_GL_plain_F", "arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F", "LMG_Mk200_F", "arifle_MX_SW_F", "arifle_SDAR_F", "SMG_01_F", "SMG_02_F"];
CODI_hgf_loot_weaponsMagazines = ["30Rnd_65x39_caseless_mag", "150Rnd_762x51_Box", "30Rnd_65x39_caseless_mag", "5Rnd_127x108_Mag", "30Rnd_65x39_caseless_green", "20Rnd_762x51_Mag", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "7Rnd_408_Mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "200Rnd_65x39_cased_Box", "100Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag", "30Rnd_45ACP_Mag_SMG_01", "30Rnd_9x21_Mag"];

CODI_hgf_loot_ammo = ["30Rnd_65x39_caseless_mag", "150Rnd_762x51_Box", "30Rnd_65x39_caseless_green_mag_Tracer", "5Rnd_127x108_Mag", "30Rnd_65x39_caseless_green", "20Rnd_762x51_Mag", "7Rnd_408_Mag", "30Rnd_556x45_Stanag", "200Rnd_65x39_cased_Box", "100Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_mag_Tracer", "200Rnd_65x39_cased_Box_Tracer", "150Rnd_762x51_Box_Tracer", "20Rnd_556x45_UW_mag", "30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", "30Rnd_9x21_Mag"];
CODI_hgf_loot_grenades = ["HandGrenade", "SmokeShell", "Chemlight_blue", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F"];
CODI_hgf_loot_special = ["B_Mortar_01_weapon_F","B_Mortar_01_support_F","B_UavTerminal","B_UAV_01_backpack_F", "Medikit", "U_B_Wetsuit", "V_RebreatherB", "U_B_GhillieSuit", "V_PlateCarrier2_rgr", "MineDetector", "NVGoggles", "Rangefinder", "H_HelmetB", "Binocular", "B_Kitbag_mcamo", "ToolKit"];
CODI_hgf_loot_support = ["optic_Arco", "optic_Hamr", "optic_SOS", "optic_Holosight", "muzzle_snds_B", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_L", "muzzle_snds_M", "muzzle_snds_acp", "acc_pointer_IR", "acc_flashlight", "optic_Aco", "optic_Aco_grn"];
CODI_hgf_loot_explosives = ["ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "DemoCharge_Remote_Mag", "APERSTripMine_Wire_Mag"];
CODI_hgf_loot_default = ["16Rnd_9x21_Mag","FirstAidKit","hgun_P07_F","hgun_ACPC2_F","9Rnd_45ACP_Mag"];

CODI_hgf_vehicles = ["B_UGV_01_F", "B_MRAP_01_F", "O_MRAP_02_F", "B_Quadbike_01_F", "I_MRAP_03_F", "C_Offroad_01_F"];
CODI_hgf_boats = ["B_Boat_Transport_01_F","B_Lifeboat","B_SDV_01_F"];
CODI_hgf_helis = ["B_Heli_Light_01_F", "O_Heli_Light_02_F", "I_Heli_Transport_02_F"];

/*
 *
 *
 * YOU ARE NOT ALLOWED TO CHANGE THE VALUES OF THE FOLLOWING VARIABLES!!!
 *
 *
 */
CODI_hgf_license_cly_removedead = true;//official given
CODI_hgf_license_btc_revive = true;//official given
CODI_hgf_license_outlw_magRepack = true;//official given
CODI_hgf_license_tao_foldmap_a3 = true;//official given, bsd license
CODI_hgf_license_groupManagement = true;//not responding
CODI_hgf_license_fadeToBlack = true;//official given
CODI_hgf_license_sounds = false;//I do not own the copyright
CODI_hgf_license_vas = true;//not responding
CODI_hgf_licence_jump = true;//official given
CODI_hgf_licence_reveal = true;//official given
CODI_hgf_license_windsystem = true;//official given
CODI_hgf_license_explosivesinterface = true;//official given
/*
 *
 *
 * YOU ARE NOT ALLOWED TO CHANGE THE VALUES OF THE VARIABLES ABOVE!!!
 *
 *
 */

//initial values
CODI_hgf_mines = [];
CODI_hgf_food_box = objNull;
CODI_hgf_water_box = objNull;
CODI_hgf_vas_box = objNull;
CODI_hgf_playerMarkers = [];
CODI_hgf_playerMarkersPos = [];
if (isNil "CODI_hgf_allowedAreas") then
{
	CODI_hgf_allowedAreas = [];
};
if (isNil "CODI_hgf_disallowedAreas") then
{
	CODI_hgf_disallowedAreas = [];
};
diag_log format ["%1 HGFramework: variables initialised", time];