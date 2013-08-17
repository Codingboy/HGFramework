private ["_items","_pos"];
if (!isServer) exitWith {};
_pos = _this select 0;
_items = ["arifle_MX_F","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"];
_items = _items + ["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"];
_items = _items + ["U_B_Wetsuit","V_RebreatherB","NVGoggles","optic_Hamr","B_Kitbag_mcamo"];
_items = _items + ["HandGrenade","HandGrenade","SmokeShell","SmokeShell","Chemlight_blue","Chemlight_blue"];
[_pos, _items] execVM "HGF\paradropBox.sqf";