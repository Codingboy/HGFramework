private ["_items","_pos","_crate"];
_pos = _this select 0;
_items = ["arifle_MX_GL_F","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"];
_items = _items + ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
_items = _items + ["V_PlateCarrier2_rgr","NVGoggles","optic_Hamr","B_Kitbag_mcamo","H_HelmetB"];
_items = _items + ["HandGrenade","HandGrenade","SmokeShell","SmokeShell","Chemlight_blue","Chemlight_blue"];
_items = _items + ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareWhite_F","UGL_FlareWhite_F","UGL_FlareWhite_F","UGL_FlareWhite_F"];
_crate = [_pos, CODI_hgf_specialCrateDropHeight, "B_supplyCrate_F"] call CODI_pd_fnc_spawn;
[_crate, _items] call CODI_hgf_fnc_initCrate;