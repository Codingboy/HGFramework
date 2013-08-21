_dmg = _this select 0;
_effectLengthMin = _this select 1;
_effectLengthMax = _this select 2;
_noEffectLengthMin = _this select 3;
_noEffectLengthMax = _this select 4;

while {true} do
{
	if (damage player >= _dmg) then
	{
		_effect = ((damage player-_dmg)/(1-_dmg));
		_sleep = _effect*random(_effectLengthMax-_effectLengthMin) + _effectLengthMin;
		titleText ["", "BLACK OUT"];
		sleep _sleep;
		
		titleText ["", "BLACK IN"];
		_sleep = random(_noEffectLengthMax-_noEffectLengthMin) + _noEffectLengthMin;
		sleep _sleep;
	}
	else
	{
		sleep 1;
	};
};