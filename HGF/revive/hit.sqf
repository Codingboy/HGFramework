
private ["_mV","_sV","_rV","_damage","_damaged","_damager"];
_damaged = _this select 0;
_damage = _this select 2;
if (!isDedicated) then
{
	if (_damaged getVariable [format["dead_", name _damaged], 0] == 1) then
	{
	};
	if (_damage + damage _damaged >= 1 && _damaged getVariable [format["dead_", name _damaged], 0] == 0) then
	{
		_damage = 0;
		_damaged setVariable [format["dead_", name _damaged], 1, true];
		[] execVM "HGF\revive\handleKilled.sqf";
	};
	_damage;
};