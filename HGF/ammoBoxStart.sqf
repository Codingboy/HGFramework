private ["_crate","_rnd","_null"];
if (!isServer) exitWith {};
_pos = _this select 0;

_crate = createVehicle["Box_NATO_Ammo_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
_crate lock false;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
for "_x" from 0 to hg_loot_magazineCount-1 do
{
	_rnd = floor(random (count hg_loot_ammo));
	_null = [_crate, hg_loot_ammo select _rnd] execVM "HGF\addToCrate.sqf";
	waitUntil{scriptDone _null};
};
_null = [_crate] execVM "HGF\handleBoxStart.sqf";