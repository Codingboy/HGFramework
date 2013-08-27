private ["_crate","_null"];
_pos = _this select 0;

_crate = createVehicle["Land_WaterBarrel_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
CODI_hgf_water_box = _crate;

publicVariable "CODI_hgf_water_box";
_null = [{waitUntil{!isNull CODI_hgf_water_box}; CODI_hgf_water_box addAction["<t color='#00ff00'>"+(localize "STR_ACT_DRINK")+"</t>", "CODI\hgf\humanity\drink.sqf", [_target], 0, true, true, "", "_this distance _target < 3"]; CODI_hgf_water_box = objNull;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};
sleep 1;