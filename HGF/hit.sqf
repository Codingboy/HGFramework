
private ["_mV","_sV","_rV","_damage","_damaged","_damager"];
_damaged = _this select 0;
_damager = _this select 1;
_damage = _this select 2;
if (!isDedicated) then
{
	if (_damage + damage _damaged >= 1) then
	{
		_damage = 0;
		_damaged setVariable ["dead", true, true];

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
		
		if (hg_license_btc_revive) then
		{
			_damaged switchMove "AinjPpneMstpSnonWrflDnon";
			waitUntil {animationstate _damaged == "ainjppnemstpsnonwrfldnon"};
		};
		
		disableUserInput true;
	};
	_damage;
};