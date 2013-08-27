
private ["_mV","_sV","_rV","_damage","_damaged","_damager"];
_damaged = _this select 0;
_damage = _this select 2;
if (!isDedicated) then
{
	if (_damaged getVariable [format["dead_", name _damaged], 0] == 1) then
	{
		_damaged setVariable [format["dead_dmg_", name _damaged], (_damaged getVariable [format["dead_dmg_", name _damaged], 0]) + _damage, true];
	};
	if (_damage + damage _damaged >= 1 && _damaged getVariable [format["dead_", name _damaged], 0] == 0) then
	{
		_damage = _damage - (1-damage _damaged);
		_damaged setVariable [format["dead_dmg_", name _damaged], _damage, true];
		_damage = 0;
		_damaged setVariable [format["dead_", name _damaged], 1, true];
		[] execVM "HGF\revive\handleKilled.sqf";
	};
	if (_damaged getVariable [format["dead_dmg_", name _damaged], 0] >= CODI_hgf_finalDeathDmg) then
	{
		_damaged setVariable [format["dead_", name _damaged], 2, true];
	};
	_damage;
};