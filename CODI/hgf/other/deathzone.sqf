private["_isIn","_time"];
if (!isDedicated) then
{
	while {true} do
	{
		_isIn = false;
		if (player in (list CODI_hgf_deathzoneTrigger) || (vehicle player) in (list CODI_hgf_deathzoneTrigger) || !alive player) then
		{
			_isIn = true;
		};
		_time = 0;
		while {!_isIn} do
		{
			hint format[localize "STR_HINT_BORDER", (CODI_hgf_bordersReturnTime - _time)];
			if (player in (list CODI_hgf_deathzoneTrigger) || (vehicle player) in (list CODI_hgf_deathzoneTrigger) || !alive player) then
			{
				_isIn = true;
			};
			_time = _time + 0.1;
			sleep 0.1;
			if (_time >= CODI_hgf_bordersReturnTime) then
			{
				while {true} do
				{
					player setDamage 1;
					diag_log format ["%1 HGFramework: killed by border", time];
					sleep 1;
				};
			};
		};
		sleep 1;
	};
};