private["_dmg"];
_dmg = _this select 0;
if (!isDedicated) then
{
	while {true} do
	{
		if (damage player < _dmg || !alive player) then
		{
			"RadialBlur" ppEffectEnable false;
			"ChromAberration" ppEffectEnable false;
		};
		waitUntil {damage player >= _dmg && alive player};
		sleep random 2;
		"RadialBlur" ppEffectEnable true;
		"RadialBlur" ppEffectAdjust[0.005, 0, 0, 0];
		"RadialBlur" ppEffectCommit random 3;
		sleep random 1;
		"RadialBlur" ppEffectEnable true;
		"RadialBlur" ppEffectAdjust[0, 0, 0, 0];
		"RadialBlur" ppEffectCommit 1.8;
		addCamShake [1 + random 2,5,0.5];
		sleep random 2;
		titletext ["", "BLACK OUT"];
		sleep 1;
		player setdir (getDir player - (random 30 - random 30));
		sleep 1 + random 3;
		titletext ["", "BLACK IN"];
		addCamShake [1 + random 2,5,0.5];
		"RadialBlur" ppEffectEnable true;
		"RadialBlur" ppEffectAdjust[0.01, 0, 0, 0];
		"RadialBlur" ppEffectCommit 0.7;
		"ChromAberration" ppEffectEnable true;
		"ChromAberration" ppEffectAdjust[0, 0, true];
		"ChromAberration" ppEffectCommit random 2;
		sleep random 3 + 1;
	};
};