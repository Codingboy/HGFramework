hg_fnc_initWaterBox =
{
	(_this select 0) addAction["<t color='#00ff00'>drink</t>", "HGF\drink.sqf", [], 0, false, true, "", "_this distance _target < 3"];
};

private ["_crate","_null"];
_pos = _this select 0;

_crate = createVehicle["Land_WaterBarrel_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
_null = [[_crate],"hg_fnc_initWaterBox",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};