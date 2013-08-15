private ["_crate","_time","_despawn","_weapons","_magazines","_rnd","_null"];
if (!isServer) exitWith {};
_pos = _this select 0;

_weapons = hg_loot_weapons;
_magazines = hg_loot_weaponsMagazines;
_crate = createVehicle["B_supplyCrate_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
for "_x" from 0 to hg_loot_weaponCount-1 do
{
	_rnd = floor(random (count _weapons));
	_crate addWeaponCargoGlobal[_weapons select _rnd, 1];
	_crate addMagazineCargoGlobal[_magazines select _rnd, 1];
};
_null = [_crate] execVM "HGF\handleBoxStart.sqf";
