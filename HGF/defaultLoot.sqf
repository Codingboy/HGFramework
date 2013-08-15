private["_crate"];
if (!isServer) exitWith {};
_crate = _this select 0;
{
	_null = [_crate, _x] execVM "HGF\addToCrate.sqf"
}
forEach hg_loot_default;