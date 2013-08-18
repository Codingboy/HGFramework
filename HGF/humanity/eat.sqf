_crate = _this select 0;
_hunger = player getVariable [format["hg_hunger_%1", name player], 0];
while {_hunger > 0 && player distance _crate < 3} do
{
	sleep 1;
	_hunger = player getVariable [format["hg_hunger_%1", name player], 0];
	if (_hunger > 0) then
	{
		_hunger = _hunger - hg_eatValue;
	};
	if (_hunger < 0) then
	{
		_hunger = 0;
	};
	player setVariable[format["hg_hunger_%1", name player], _hunger];
};