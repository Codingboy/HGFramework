private ["_items","_pos","_crate"];
_pos = _this select 0;
_items = ["srifle_EBR_F","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"];
_items = _items + ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
_items = _items + ["U_B_GhillieSuit","V_PlateCarrier2_rgr","NVGoggles","Rangefinder","optic_SOS","muzzle_snds_B"];
_items = _items + ["HandGrenade","HandGrenade","SmokeShell","SmokeShell","Chemlight_blue","Chemlight_blue"];
_crate = [_pos, CODI_hgf_specialCrateDropHeight, "B_supplyCrate_F"] call CODI_pd_fnc_spawn;
[_crate, _items] call CODI_hgf_fnc_initCrate;