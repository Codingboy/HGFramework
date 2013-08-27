_crate = _this select 0;
_thirst = player getVariable [format["CODI_hgf_thirst_%1", name player], 0];
while {_thirst > 0 && player distance _crate < 3} do
{
	sleep 1;
	_thirst = player getVariable [format["CODI_hgf_thirst_%1", name player], 0];
	if (_thirst > 0) then
	{
		_thirst = _thirst - CODI_hgf_drinkValue;
	};
	if (_thirst < 0) then
	{
		_thirst = 0;
	};
	player setVariable[format["CODI_hgf_thirst_%1", name player], _thirst];
};