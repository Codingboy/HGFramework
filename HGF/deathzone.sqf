private["_isIn","_time"];
if (!isDedicated) then
{
	while {true} do
	{
		_isIn = false;
		if (player in (list hg_deathzoneTrigger) || (vehicle player) in (list hg_deathzoneTrigger) || !alive player) then
		{
			_isIn = true;
		};
		_time = 0;
		while {!_isIn} do
		{
			hint format["%1%2%3", localize "STR_HINT_BORDER_01", (hg_bordersReturnTime - _time), localize "STR_HINT_BORDER_02"];
			if (player in (list hg_deathzoneTrigger) || (vehicle player) in (list hg_deathzoneTrigger) || !alive player) then
			{
				_isIn = true;
			};
			_time = _time + 0.1;
			sleep 0.1;
			if (_time >= hg_bordersReturnTime) then
			{
				while {true} do
				{
					player setDamage 1;
					sleep 1;
				}
			};
		};
		sleep 1;
	};
};