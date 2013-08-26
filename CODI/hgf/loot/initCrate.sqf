_crate = _this select 0;
_items = _this select 1;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate allowDamage false;

{
	[_crate, _x] call CODI_add_fnc_add;
}
forEach _items;