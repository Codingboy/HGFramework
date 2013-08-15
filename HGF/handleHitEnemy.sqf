private["_unit", "_hitter", "_damage"];

_unit = _this select 0;
_hitter = _this select 1;
_damage = _this select 2;

if (_hitter != _unit) then
{
	_hitter addScore (_damage*300);
};