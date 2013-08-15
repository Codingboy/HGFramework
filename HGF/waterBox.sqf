private ["_crate","_null"];
_pos = _this select 0;

_crate = createVehicle["Land_WaterBarrel_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
hg_water_box = _crate;

publicVariable "hg_water_box";
_null = [{waitUntil{!isNull hg_water_box}; hg_water_box addAction["<t color='#00ff00'>drink</t>", "HGF\drink.sqf", [_target], 0, false, true, "", "_this distance _target < 3"]; hg_water_box = objNull;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};
sleep 1;