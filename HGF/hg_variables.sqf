for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
};
hg_thirstRate = hg_thirstRate / 1000;
hg_hungerRate = hg_hungerRate / 1000;
hg_fatigueRate = hg_fatigueRate / 1000;
hg_hungerDamage = hg_hungerDamage / 1000;
hg_thirstDamage = hg_thirstDamage / 1000;
hg_bleedingDamageLimit = hg_bleedingDamageLimit / 100;
hg_bleedingDamage = hg_bleedingDamage / 1000;
hg_temperatureChangeValue = hg_temperatureChangeValue / 1000;
hg_temperatureDamage = hg_temperatureDamage / 10000;
hg_temperatureMin = hg_temperatureMin / 10;
hg_temperatureAvg = hg_temperatureAvg / 10;
hg_temperatureMax = hg_temperatureMax / 10;
hg_temperatureBadFactor = hg_temperatureBadFactor / 10;
hg_damagesystemValue = hg_damagesystemValue / 100;
hg_infectionDamage = hg_infectionDamage / 1000;
hg_infectionChance = hg_infectionChance / 10;

hg_startColor = "ColorBlack";
hg_crateColor = "ColorOrange";
hg_specialCrateColor = "ColorRed";
hg_safeZoneColor = "ColorGreen";
hg_vehicleColor = "ColorBlue";
hg_heliColor = "ColorYellow";
hg_boatColor = "ColorWhite";

hg_allowedAreasColor = "ColorGreen";
hg_disallowedAreasColor = "ColorRed";
hg_markPlayerColor = "ColorBlack";
hg_markPlayerSelfColor = "ColorBlue";

hg_loot_weapons = ["arifle_MX_F", "LMG_Zafir_F", "arifle_MX_GL_F", "srifle_GM6_F", "arifle_Katiba_C_F", "srifle_EBR_F", "arifle_Katiba_F", "arifle_Katiba_GL_F", "arifle_MXM_F", "arifle_MXC_F", "srifle_LRR_F", "arifle_Mk20_plain_F", "arifle_Mk20C_plain_F", "arifle_Mk20_GL_plain_F", "arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F", "LMG_Mk200_F", "arifle_MX_SW_F", "arifle_SDAR_F", "SMG_01_F", "SMG_02_F"];
hg_loot_weaponsMagazines = ["30Rnd_65x39_caseless_mag", "150Rnd_762x51_Box", "30Rnd_65x39_caseless_mag", "5Rnd_127x108_Mag", "30Rnd_65x39_caseless_green", "20Rnd_762x51_Mag", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "7Rnd_408_Mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "200Rnd_65x39_cased_Box", "100Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag", "30Rnd_45ACP_Mag_SMG_01", "30Rnd_9x21_Mag"];

hg_loot_ammo = ["30Rnd_65x39_caseless_mag", "150Rnd_762x51_Box", "30Rnd_65x39_caseless_green_mag_Tracer", "5Rnd_127x108_Mag", "30Rnd_65x39_caseless_green", "20Rnd_762x51_Mag", "7Rnd_408_Mag", "30Rnd_556x45_Stanag", "200Rnd_65x39_cased_Box", "100Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_mag_Tracer", "200Rnd_65x39_cased_Box_Tracer", "150Rnd_762x51_Box_Tracer", "20Rnd_556x45_UW_mag", "30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", "30Rnd_9x21_Mag"];
hg_loot_grenades = ["HandGrenade", "SmokeShell", "Chemlight_blue", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F"];
hg_loot_special = ["B_UavTerminal","B_UAV_01_backpack_F", "Medikit", "U_B_Wetsuit", "V_RebreatherB", "U_B_GhillieSuit", "V_PlateCarrier2_rgr", "MineDetector", "NVGoggles", "Rangefinder", "H_HelmetB", "Binocular", "B_Kitbag_mcamo", "ToolKit"];
hg_loot_support = ["optic_Arco", "optic_Hamr", "optic_SOS", "optic_Holosight", "muzzle_snds_B", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_L", "muzzle_snds_M", "muzzle_snds_acp", "acc_pointer_IR", "acc_flashlight", "optic_Aco", "optic_Aco_grn"];
hg_loot_explosives = ["ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "DemoCharge_Remote_Mag", "APERSTripMine_Wire_Mag"];
hg_loot_default = ["16Rnd_9x21_Mag","FirstAidKit","hgun_P07_F","hgun_ACPC2_F","9Rnd_45ACP_Mag"];

hg_vehicles = ["B_UGV_01_F", "B_MRAP_01_F", "O_MRAP_02_F", "B_Quadbike_01_F", "I_MRAP_03_F", "C_Offroad_01_F"];
hg_boats = ["B_Boat_Transport_01_F","B_Lifeboat","B_SDV_01_F"];
hg_helis = ["B_Heli_Light_01_F", "O_Heli_Light_02_F", "I_Heli_Transport_02_F"];

/*
 *
 *
 * YOU ARE NOT ALLOWED TO CHANGE THE VALUES OF THE FOLLOWING VARIABLES!!!
 *
 *
 */
hg_license_cly_removedead = true;//official given
hg_license_btc_revive = true;//official given
hg_license_outlw_magRepack = true;//official given
hg_license_tao_foldmap_a3 = true;//official given, bsd license
hg_license_groupManagement = true;//not responding
hg_license_fadeToBlack = true;//official given
hg_license_sounds = false;//I do not own the copyright
hg_license_vas = true;//not responding
hg_licence_jump = true;//official given
hg_licence_reveal = true;//official given
hg_license_damagesystem = true;//not responding
hg_license_windsystem = true;//official given
hg_license_explosivesinterface = true;//official given
/*
 *
 *
 * YOU ARE NOT ALLOWED TO CHANGE THE VALUES OF THE VARIABLES ABOVE!!!
 *
 *
 */

//initial values
hg_mines = [];
hg_food_box = objNull;
hg_water_box = objNull;
hg_vas_box = objNull;
hg_playerMarkers = [];
hg_playerMarkersPos = [];
if (isNil "hg_allowedAreas") then
{
	hg_allowedAreas = [];
};
if (isNil "hg_disallowedAreas") then
{
	hg_disallowedAreas = [];
};