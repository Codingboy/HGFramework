private ["_items","_pos"];
if (!isServer) exitWith {};
_pos = _this select 0;
_items = ["arifle_MX_F","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"];
_items = _items + ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
_items = _items + ["V_PlateCarrier2_rgr","NVGoggles","optic_Hamr","B_Kitbag_mcamo","Medikit","H_HelmetB"];
_items = _items + ["HandGrenade","HandGrenade","SmokeShell","SmokeShell","Chemlight_blue","Chemlight_blue"];
[_pos, _items] execVM "HGF\paradropBox.sqf";