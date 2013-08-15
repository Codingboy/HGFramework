hg_fnc_initFoodBox =
{
	(_this select 0) addAction["<t color='#00ff00'>eat</t>", "HGF\eat.sqf", [], 0, false, true, "", "_this distance _target < 3"];
};

private ["_crate","_null"];
_pos = _this select 0;

_crate = createVehicle["Land_Sacks_goods_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
_null = [[_crate],"hg_fnc_initFoodBox",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};