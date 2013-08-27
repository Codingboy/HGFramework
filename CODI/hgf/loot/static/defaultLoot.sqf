private["_crate"];
_crate = _this select 0;
{
	[_crate, _x] call CODI_add_fnc_add;
}
forEach CODI_hgf_loot_default;