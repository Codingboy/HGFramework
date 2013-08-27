private ["_crate","_time","_despawn","_para","_active","_playerNear","_null"];
_pos = _this select 0;

_crate = [_pos, CODI_hgf_specialCrateDropHeight, "B_supplyCrate_F"] call CODI_pd_fnc_spawn;
[_crate, []] call CODI_hgf_fnc_initCrate;
CODI_hgf_vas_box = _crate;
publicVariable "CODI_hgf_vas_box";
_null = [{waitUntil{!isNull CODI_hgf_vas_box}; CODI_hgf_vas_box addAction["<t color='#0000ff'>Virtual Ammobox</t>", "VAS\open.sqf", [], 0, false, true, "", "_this distance _target < 3"]; CODI_hgf_vas_box = objNull;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};
sleep 1;