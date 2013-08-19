private ["_crate","_null"];
_pos = _this select 0;

_crate = createVehicle["Land_Sacks_goods_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
hg_food_box = _crate;
publicVariable "hg_food_box";
_null = [{waitUntil{!isNull hg_food_box}; hg_food_box addAction["<t color='#00ff00'>"+(localize "STR_ACT_EAT")+"</t>", "HGF\humanity\eat.sqf", [_target], 0, false, true, "", "_this distance _target < 3"]; hg_food_box = objNull;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
waitUntil {scriptDone _null};
sleep 1;