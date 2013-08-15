private["_unit", "_killer"];

_unit = _this select 0;
_killer = _this select 1;

if (_killer != _unit) then
{
	_killer addScore -599;//overall = 600
};