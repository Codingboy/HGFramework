private["_crate","_time","_despawn","_special","_rnd"];
_pos = _this select 0;

_crate = createVehicle["Box_NATO_Support_F", _pos, [], 0, "NONE"];
_crate setDir random(360);
_crate allowDamage false;
_crate lock false;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
for "_x" from 0 to CODI_hgf_loot_supportCount-1 do
{
	_rnd = floor(random (count CODI_hgf_loot_support));
	[_crate, CODI_hgf_loot_support select _rnd] call CODI_add_fnc_add;
};
[_crate] spawn CODI_hgf_fnc_handleStartBox;