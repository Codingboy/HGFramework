private ["_crate","_time","_despawn","_magazines","_rnd","_null"];
if (!isServer) exitWith {};
_pos = _this select 0;

_magazines = hg_loot_explosives;
_crate = createVehicle["Box_NATO_AmmoOrd_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
for "_x" from 0 to hg_loot_explosivesCount-1 do
{
	_rnd = floor(random (count _magazines));
	_null = [_crate, _magazines select _rnd] execVM "HGF\loot\addToCrate.sqf";
	waitUntil {scriptDone _null};
};
_null = [_crate] execVM "HGF\loot\static\defaultLoot.sqf";
waitUntil {scriptDone _null};
