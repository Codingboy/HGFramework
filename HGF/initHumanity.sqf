
private ["_rate","_temperature","_fire","_temperatureRateHunger","_temperatureRateThirst","_thirstSpeedLimitation","_hungerSpeedLimitation","_fatigueSpeedLimitation","_speedLimited","_playerWeight","_weight","_nearObjects","_thirst","_hunger","_fatigue","_damage"];
if (!isDedicated) then
{
	private["_player"];
	_player = player;
	_player setVariable[format["hg_thirst_%1", name _player], 0, true];
	_player setVariable[format["hg_hunger_%1", name _player], 0, true];
	_player setVariable[format["hg_fatigue_%1", name _player], 0, true];
	_player setVariable[format["hg_damage_%1", name _player], 0, true];
	_player setVariable[format["hg_temperature_%1", name _player], hg_temperatureAvg, true];
	_thirstSpeedLimitation = false;
	_hungerSpeedLimitation = false;
	_fatigueSpeedLimitation = false;
	_prevDamage = 0;
	_infected = false;
	while {alive _player} do
	{
		_playerWeight = 68;
		_weight = _playerWeight + (loadAbs _player)/10;
		_rate = 1 + (_weight/_playerWeight)*((speed _player)/10)*((speed _player)/10);
		if (vehicle _player != _player) then//player is in a vehicle
		{
			_rate = 1;
		};
		_temperature = _player getVariable (format["hg_temperature_%1", name _player]);
		if (speed _player > 5) then
		{
			if (_temperature > hg_temperatureAvg && _temperature < hg_temperatureMax) then
			{
				_temperature = _temperature + hg_temperatureBadFactor*2*hg_temperatureChangeValue*((speed _player)/7);
			};
			if (_temperature <= hg_temperatureAvg) then
			{
				_temperature = _temperature + 2*hg_temperatureChangeValue*((speed _player)/7);
			};
		};
		if (speed _player <= 5) then
		{
			if (_temperature > hg_temperatureAvg) then
			{
				_temperature = _temperature - (5-(speed _player))*hg_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature - hg_temperatureBadFactor*(5-(speed _player))*hg_temperatureChangeValue;
			};
		};
		if (sunOrMoon == 1) then//day
		{
			if (_temperature < hg_temperatureAvg) then
			{
				_temperature = _temperature + 1*hg_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature + hg_temperatureBadFactor*1*hg_temperatureChangeValue;
			};
		}
		else//night
		{
			if (_temperature > hg_temperatureAvg) then
			{
				_temperature = _temperature - 2*hg_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature - hg_temperatureBadFactor*2*hg_temperatureChangeValue;
			};
		};
		if (surfaceIsWater[(getPos _player) select 0, (getPos _player) select 1]) then
		{
			if (uniform _player == "U_B_Wetsuit") then
			{
				_temperature = _temperature - 1*hg_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature - 5*hg_temperatureChangeValue;
			};
		};
		_fire = objNull;
		_nearObjects = nearestObjects [vehicle _player,[],10];
		{
			if (typeOf _x == "FirePlace_burning_F" || typeOf _x == "Land_FirePlace_F") then
			{
				if (inflamed _x) then
				{
					if (isNull _fire || (_x distance _player) < (_fire distance _player)) then
					{
						_fire = _x;
					};
				};
			};
		}
		forEach _nearObjects;
		if (!isNull _fire) then
		{
			_temperature = _temperature + 2*(10-(_fire distance _player))*hg_temperatureChangeValue;
		};
		_temperatureRateHunger = 1;
		_temperatureRateThirst = 1;
		if (hg_temperaturInfluencesThirstHunger == 1) then
		{
			if (_temperature < hg_temperatureAvg) then
			{
				_temperatureRateHunger = 2-1*((_temperature-hg_temperatureMin)/(hg_temperatureAvg-hg_temperatureMin));
			}
			else
			{
				_temperatureRateHunger = 1-0.5*((_temperature-hg_temperatureAvg)/(hg_temperatureMax-hg_temperatureAvg));
			};
			if (_temperature < hg_temperatureAvg) then
			{
				_temperatureRateThirst = ((_temperature-hg_temperatureMin)/(hg_temperatureAvg-hg_temperatureMin))*0.5+0.5;
			}
			else
			{
				_temperatureRateThirst = ((_temperature-hg_temperatureAvg)/(hg_temperatureMax-hg_temperatureAvg))*1+1;
			};
		};
		_thirst = _player getVariable (format["hg_thirst_%1", name _player]);
		_thirst = _thirst + hg_thirstRate * _rate * _temperatureRateThirst;
		_hunger = _player getVariable (format["hg_hunger_%1", name _player]);
		_hunger = _hunger + hg_hungerRate * _rate * _temperatureRateHunger;
		_fatigue = _player getVariable (format["hg_fatigue_%1", name _player]);
		_fatigue = _fatigue + hg_fatigueRate * _rate;

		if (_temperature < hg_temperatureMin || _temperature > hg_temperatureMax) then
		{
			_player setDamage ((damage _player) + hg_temperatureDamage);
		};
		if (_thirst >= 100) then
		{
			_player setDamage ((damage _player) + hg_thirstDamage);
		};
		if (_hunger >= 100) then
		{
			_player setDamage ((damage _player) + hg_hungerDamage);
		};
		if (_fatigue >= 100) then
		{
			[_player] execVM "HGF\sleep.sqf";
		};
		if (damage _player > hg_bleedingDamageLimit) then
		{
			_player setDamage ((damage _player) + hg_bleedingDamage);
		};
		if (hg_speedLimitation == 1) then
		{
			if (_thirst > hg_thirstSpeedLimitation) then
			{
				_thirstSpeedLimitation = true;
			}
			else
			{
				_thirstSpeedLimitation = false;
			};
			if (_hunger > hg_hungerSpeedLimitation) then
			{
				_hungerSpeedLimitation = true;
			}
			else
			{
				_hungerSpeedLimitation = false;
			};
			if (_fatigue > hg_fatigueSpeedLimitation) then
			{
				_fatigueSpeedLimitation = true;
			}
			else
			{
				_fatigueSpeedLimitation = false;
			};
			_speedLimited = false;
			if (_thirstSpeedLimitation) then
			{
				_speedLimited = true;
			};
			if (_hungerSpeedLimitation) then
			{
				_speedLimited = true;
			};
			if (_fatigueSpeedLimitation) then
			{
				_speedLimited = true;
			};
			_player forceWalk _speedLimited;
		};
		_damage = damage _player;
		if ((random 1)*10 < _damage) then
		{
			_infected = true;
		};
		if (_damage < _prevDamage) then
		{
			if ("Medikit" in backpackItems _player) then
			{
				_infected = false;
			};
		};
		if (_infected) then
		{
			_damage = _damage + hg_infectionDamage;
		};
		_player setDamage _damage;
		_prevDamage = _damage;
		_player setVariable[format["hg_thirst_%1", name _player], _thirst];
		_player setVariable[format["hg_hunger_%1", name _player], _hunger];
		_player setVariable[format["hg_fatigue_%1", name _player], _fatigue];
		_player setVariable[format["hg_damage_%1", name _player], _damage];
		_player setVariable[format["hg_temperature_%1", name _player], _temperature];
		if (hg_showThirst == 1) then
		{
			((uiNamespace getVariable "hg_hud") displayCtrl 55511) ctrlSetText (format["%1", round(_thirst)]+"%");
		};
		if (hg_showHunger == 1) then
		{
			((uiNamespace getVariable "hg_hud") displayCtrl 55512) ctrlSetText (format["%1", round(_hunger)]+"%");
		};
		if (hg_showFatigue == 1) then
		{
			((uiNamespace getVariable "hg_hud") displayCtrl 55513) ctrlSetText (format["%1", round(_fatigue)]+"%");
		};
		if (hg_showDamage == 1) then
		{
			((uiNamespace getVariable "hg_hud") displayCtrl 55514) ctrlSetText (format["%1", round((_damage)*100)]+"%");
		};
		if (hg_showTemperature == 1) then
		{
			((uiNamespace getVariable "hg_hud") displayCtrl 55515) ctrlSetText (format["%1", (round(_temperature*10))/10]+"°C");
		};
		sleep 1;
	};
};