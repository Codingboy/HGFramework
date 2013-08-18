private["_player","_time","_mV","_sV","_rV","_fatigue"];

_player = _this select 0;
_fatigue = _player getVariable [format["hg_fatigue_%1", name _player], 0];
if (_fatigue > 0) then
{
	_time = (_fatigue*_fatigue)/(7.5*7.5);

	_player playMove "AinjPpneMstpSnonWnonDnon_rolltoback";
	waitUntil {animationstate _player == "AinjPpneMstpSnonWnonDnon_rolltoback"};

	if (hg_license_fadeToBlack) then
	{
		_mV = musicVolume;
		_sV = soundVolume;
		_rV = radioVolume;
		0 fadeSound 0;
		0 fadeRadio 0;
		0 fadeMusic 0;
		cutText ["", "BLACK OUT", 0];
	};

	disableUserInput true;
	while {_time > 0} do
	{
		hintSilent format ["sleeptime: %1", _time];
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
	_player setVariable[format["hg_fatigue_%1", name _player], 0, true];
	sleep 0.05;
	_player setVariable[format["hg_fatigue_%1", name _player], 0, true];

	if (hg_license_fadeToBlack) then
	{
		1.5 fadeSound _rV;
		1.5 fadeRadio _sV;
		1.5 fadeMusic _mV;
		cutRsc["hg_hud", "PLAIN"];
	};

	_player playMove "amovppnemstpsraswrfldnon";
	_player playMove "";
};