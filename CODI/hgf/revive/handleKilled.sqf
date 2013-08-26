if (!isDedicated) then
{
	if (CODI_hgf_license_fadeToBlack) then
	{
		_mV = musicVolume;
		_sV = soundVolume;
		_rV = radioVolume;
		0 fadeSound 0;
		0 fadeRadio 0;
		0 fadeMusic 0;
		cutText ["", "BLACK OUT", 0];
	};

	if (CODI_hgf_license_btc_revive) then
	{
		player switchMove "AinjPpneMstpSnonWrflDnon";
		waitUntil {animationstate player == "ainjppnemstpsnonwrfldnon"};
	};

	disableUserInput true;
	
	_time = 0;
	while {player getVariable [format["dead_", name player], 1] == 1 && _time < CODI_hgf_reviveableTime} do
	{
		player setDamage 0.75;
		sleep 0.1;
		_time = _time + 0.1;
	};

	disableUserInput false;
	
	if (player getVariable [format["dead_", name player], 2] != 0) then
	{
		player setDamage 1;
	}
	else
	{
		player setDamage 0.75;
		player setVariable [format["dead_dmg_", name player], 0, true];
	};

	if (CODI_hgf_license_fadeToBlack) then
	{
		1.5 fadeSound _rV;
		1.5 fadeRadio _sV;
		1.5 fadeMusic _mV;
		if (CODI_hgf_dayz == 0) then
		{
			cutRsc["CODI_hgf_hud", "PLAIN", 0, false];
		}
		else
		{
			cutRsc["CODI_hgf_hudDayZ", "PLAIN", 0, false];
		};
	};

	if (CODI_hgf_license_btc_revive) then
	{
		_player playMove "amovppnemstpsraswrfldnon";
		_player playMove "";
	};
};