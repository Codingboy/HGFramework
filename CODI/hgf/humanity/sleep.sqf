private["_player","_time","_mV","_sV","_rV","_fatigue"];

_player = _this select 0;
_fatigue = _player getVariable [format["CODI_hgf_fatigue_%1", name _player], 0];
if (_fatigue > 0) then
{
	_time = (_fatigue*_fatigue)/(7.5*7.5);

	_player playMove "AinjPpneMstpSnonWnonDnon_rolltoback";
	waitUntil {animationstate _player == "AinjPpneMstpSnonWnonDnon_rolltoback"};

	_mV = 0;
	_sV = 0;
	_rV = 0;
	if (CODI_hgf_license_fadeToBlack) then
	{
		_mV = musicVolume;
		_sV = soundVolume;
		_rV = radioVolume;
		1 fadeSound 0;
		1 fadeRadio 0;
		1 fadeMusic 0;
		titleText ["", "BLACK OUT", 1];
	};

	disableUserInput true;
	while {_time > 0} do
	{
		hintSilent format [(localize "STR_HINT_SLEEPTIME"), _time];
		if (_time < 0.1) then
		{
			sleep _time;
			_time = 0;
		}
		else
		{
			sleep 0.1;
			_time = _time - 0.1;
		};
	};
	disableUserInput false;
	_player setVariable[format["CODI_hgf_fatigue_%1", name _player], 0, true];
	sleep 0.05;
	_player setVariable[format["CODI_hgf_fatigue_%1", name _player], 0, true];

	if (CODI_hgf_license_fadeToBlack) then
	{
		1 fadeSound _sV;
		1 fadeRadio _rV;
		1 fadeMusic _mV;
		titleText ["", "BLACK IN", 1];
	};

	_player playMove "amovppnemstpsraswrfldnon";
	_player playMove "";
};