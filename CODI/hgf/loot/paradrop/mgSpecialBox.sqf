private ["_items","_pos","_crate"];
_pos = _this select 0;
_items = ["LMG_Zafir_F","150Rnd_762x51_Box","150Rnd_762x51_Box","150Rnd_762x51_Box"];
_items = _items + ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
_items = _items + ["V_PlateCarrier2_rgr","NVGoggles","optic_Hamr","B_Kitbag_mcamo","H_HelmetB"];
_items = _items + ["HandGrenade","HandGrenade","SmokeShell","SmokeShell","Chemlight_blue","Chemlight_blue"];
_crate = [_pos, CODI_hgf_specialCrateDropHeight, "B_supplyCrate_F"] call CODI_pd_fnc_spawn;
[_crate, _items] call CODI_hgf_fnc_initCrate;