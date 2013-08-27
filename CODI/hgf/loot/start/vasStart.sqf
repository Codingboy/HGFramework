private ["_pos","_crate","_null"];
_pos = _this select 0;

_crate = createVehicle["B_supplyCrate_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
CODI_hgf_vas_box = _crate;
publicVariable "CODI_hgf_tmp_box";
_null = [{waitUntil{!isNull CODI_hgf_vas_box}; CODI_hgf_vas_box addAction["<t color='#0000ff'>Virtual Ammobox</t>", "VAS\open.sqf", [], 0, false, true, "", "_this distance _target < 3"]; CODI_hgf_vas_box = objNull;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};
sleep 1;
[_crate] spawn CODI_hgf_fnc_handleStartBox;