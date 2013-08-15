private ["_pos","_crate","_null"];
_pos = _this select 0;

if (isServer) then
{
	_crate = createVehicle["B_supplyCrate_F", _pos, [], 0, "NONE"];
	_crate setDir random(360);
	_crate allowDamage false;
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	hg_tmp_box = _crate;
	publicVariable "hg_tmp_box";
	_null = [{waitUntil{!isNull hg_vas_box}; hg_vas_box addAction["<t color='#0000ff'>Virtual Ammobox</t>", "VAS\open.sqf", [], 0, false, true, "", "_this distance _target < 3"]; hg_vas_box = objNull;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	waitUntil {scriptDone _null};
	_null = [_crate] execVM "HGF\handleBoxStart.sqf";
};