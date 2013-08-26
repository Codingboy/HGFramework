private ["_items","_pos","_crate"];
_pos = _this select 0;
_items = ["arifle_MX_F","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"];
_items = _items + ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
_items = _items + ["U_B_Wetsuit","V_RebreatherB","NVGoggles","optic_Hamr","B_Kitbag_mcamo"];
_items = _items + ["HandGrenade","HandGrenade","SmokeShell","SmokeShell","Chemlight_blue","Chemlight_blue"];
_crate = [_pos, CODI_hgf_specialCrateDropHeight, "B_supplyCrate_F"] call CODI_pd_fnc_spawn;
[_crate, _items] call CODI_hgf_fnc_initCrate;