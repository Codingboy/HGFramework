hg_fnc_revive =
{
	_dead = _this select 0;
	_reviver = _this select 1;
	if (!isDedicated) then
	{
		if (Player != _dead) then
		{
			sleep hg_reviveTime;
			_time = 0;
			while {_time < 100} do
			{
				if (_dead getVariable ["dead", false]) then
				{
					_time = 100;
					disableUserInput false;
					if (hg_license_fadeToBlack) then
					{
						1.5 fadeSound _rV;
						1.5 fadeRadio _sV;
						1.5 fadeMusic _mV;
						cutRsc["hg_hud", "PLAIN"];
					};

					if (hg_license_btc_revive) then
					{
						_player playMove "amovppnemstpsraswrfldnon";
						_player playMove "";
					};
				}
				else
				{
					sleep 0.1;
					_time = _time +1;
				};
			};
		};
		if (player == _reviver) then
		{
			//play animation
			sleep hg_reviveTime;
			_dead setVariable ["dead", false, true];
		};
	};
};

if (!isDedicated) then
{
	_dead = _this select 0;
	_reviver = _this select 1;
	_time = 0;
	while {_time < hg_reviveTime && player getVariable [format["dead_", name player], 0] == 0 && _dead getVariable [format["dead_", name _dead], 0] == 1} do
	{
		sleep 0.1;
		_time = _time + 0.1;
	};
	if (player getVariable [format["dead_", name player], 0] == 0 && _dead getVariable [format["dead_", name _dead], 0] == 1) then
	{
		_dead setVariable [format["dead_", name _dead], 0, true];
	};
};