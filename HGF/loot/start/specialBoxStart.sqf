private["_crate","_time","_despawn","_special","_rnd"];
if (!isServer) exitWith {};
_pos = _this select 0;

_crate = createVehicle["Box_NATO_WpsSpecial_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
_crate lock false;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
for "_x" from 0 to hg_loot_specialCount-1 do
{
	_rnd = floor(random (count hg_loot_special));
	_null = [_crate, hg_loot_special select _rnd] execVM "HGF\loot\addToCrate.sqf";
	waitUntil{scriptDone _null};
};
_null = [_crate] execVM "HGF\loot\start\handleBoxStart.sqf";