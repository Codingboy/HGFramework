
private ["_rate","_temperature","_fire","_temperatureRateHunger","_temperatureRateThirst","_thirstSpeedLimitation","_hungerSpeedLimitation","_fatigueSpeedLimitation","_speedLimited","_playerWeight","_weight","_nearObjects","_thirst","_hunger","_fatigue","_damage"];
if (!isDedicated) then
{
	private["_player"];
	_player = player;
	_player addEventHandler ["HandleHeal",
	{
		_healed = _this select 0;
		_healer = _this select 1;
		if ("Medikit" in backpackItems _healer) then
		{
			_healed setVariable[format["CODI_hgf_infected_%1", name _player], false, true];
		};
		false;
	}];
	_player setVariable[format["CODI_hgf_thirst_%1", name _player], 0];
	_player setVariable[format["CODI_hgf_hunger_%1", name _player], 0];
	_player setVariable[format["CODI_hgf_fatigue_%1", name _player], 0];
	_player setVariable[format["CODI_hgf_damage_%1", name _player], 0];
	_player setVariable[format["CODI_hgf_temperature_%1", name _player], CODI_hgf_temperatureAvg];
	_player setVariable[format["CODI_hgf_infected_%1", name _player], false];
	_thirstSpeedLimitation = false;
	_hungerSpeedLimitation = false;
	_fatigueSpeedLimitation = false;
	_prevDamage = 0;
	_prevInfected = false;
	diag_log format ["%1 HGFramework: humanity initialised", time];
	while {alive _player} do
	{
		_infected = _player getVariable [format["CODI_hgf_infected_%1", name _player], false];
		_playerWeight = 68;
		_weight = _playerWeight + (loadAbs _player)/10;
		_rate = 1 + (_weight/_playerWeight)*((speed _player)/10)*((speed _player)/10);
		if (vehicle _player != _player) then//player is in a vehicle
		{
			_rate = 1;
		};
		_temperature = _player getVariable (format["CODI_hgf_temperature_%1", name _player]);
		if (speed _player > 5) then
		{
			if (_temperature > CODI_hgf_temperatureAvg && _temperature < CODI_hgf_temperatureMax) then
			{
				_temperature = _temperature + CODI_hgf_temperatureBadFactor*2*CODI_hgf_temperatureChangeValue*((speed _player)/7);
			};
			if (_temperature <= CODI_hgf_temperatureAvg) then
			{
				_temperature = _temperature + 2*CODI_hgf_temperatureChangeValue*((speed _player)/7);
			};
		};
		if (speed _player <= 5) then
		{
			if (_temperature > CODI_hgf_temperatureAvg) then
			{
				_temperature = _temperature - (5-(speed _player))*CODI_hgf_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature - CODI_hgf_temperatureBadFactor*(5-(speed _player))*CODI_hgf_temperatureChangeValue;
			};
		};
		if (sunOrMoon == 1) then//day
		{
			if (_temperature < CODI_hgf_temperatureAvg) then
			{
				_temperature = _temperature + 1*CODI_hgf_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature + CODI_hgf_temperatureBadFactor*1*CODI_hgf_temperatureChangeValue;
			};
		}
		else//night
		{
			if (_temperature > CODI_hgf_temperatureAvg) then
			{
				_temperature = _temperature - 2*CODI_hgf_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature - CODI_hgf_temperatureBadFactor*2*CODI_hgf_temperatureChangeValue;
			};
		};
		if (_infected) then
		{
			_temperature = _temperature + 5*CODI_hgf_temperatureChangeValue;
		};
		if (surfaceIsWater[(getPos _player) select 0, (getPos _player) select 1]) then
		{
			if (uniform _player == "U_B_Wetsuit") then
			{
				_temperature = _temperature - 1*CODI_hgf_temperatureChangeValue;
			}
			else
			{
				_temperature = _temperature - 5*CODI_hgf_temperatureChangeValue;
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
			_temperature = _temperature + 2*(10-(_fire distance _player))*CODI_hgf_temperatureChangeValue;
		};
		_temperatureRateHunger = 1;
		_temperatureRateThirst = 1;
		if (CODI_hgf_temperaturInfluencesThirstHunger == 1) then
		{
			if (_temperature < CODI_hgf_temperatureAvg) then
			{
				_temperatureRateHunger = 2-1*((_temperature-CODI_hgf_temperatureMin)/(CODI_hgf_temperatureAvg-CODI_hgf_temperatureMin));
			}
			else
			{
				_temperatureRateHunger = 1-0.5*((_temperature-CODI_hgf_temperatureAvg)/(CODI_hgf_temperatureMax-CODI_hgf_temperatureAvg));
			};
			if (_temperature < CODI_hgf_temperatureAvg) then
			{
				_temperatureRateThirst = ((_temperature-CODI_hgf_temperatureMin)/(CODI_hgf_temperatureAvg-CODI_hgf_temperatureMin))*0.5+0.5;
			}
			else
			{
				_temperatureRateThirst = ((_temperature-CODI_hgf_temperatureAvg)/(CODI_hgf_temperatureMax-CODI_hgf_temperatureAvg))*1+1;
			};
		};
		_thirst = _player getVariable (format["CODI_hgf_thirst_%1", name _player]);
		_thirst = _thirst + CODI_hgf_thirstRate * _rate * _temperatureRateThirst;
		_hunger = _player getVariable (format["CODI_hgf_hunger_%1", name _player]);
		_hunger = _hunger + CODI_hgf_hungerRate * _rate * _temperatureRateHunger;
		_fatigue = _player getVariable (format["CODI_hgf_fatigue_%1", name _player]);
		_fatigue = _fatigue + CODI_hgf_fatigueRate * _rate;

		if (_temperature < CODI_hgf_temperatureMin || _temperature > CODI_hgf_temperatureMax) then
		{
			_player setDamage ((damage _player) + CODI_hgf_temperatureDamage);
		};
		if (_thirst >= 100) then
		{
			_player setDamage ((damage _player) + CODI_hgf_thirstDamage);
		};
		if (_hunger >= 100) then
		{
			_player setDamage ((damage _player) + CODI_hgf_hungerDamage);
		};
		if (_fatigue >= 100) then
		{
			[_player] execVM "HGF\loot\sleep.sqf";
		};
		if (damage _player > CODI_hgf_bleedingDamageLimit) then
		{
			_player setDamage ((damage _player) + CODI_hgf_bleedingDamage);
		};
		if (CODI_hgf_speedLimitation == 1) then
		{
			if (_thirst > CODI_hgf_thirstSpeedLimitation) then
			{
				_thirstSpeedLimitation = true;
			}
			else
			{
				_thirstSpeedLimitation = false;
			};
			if (_hunger > CODI_hgf_hungerSpeedLimitation) then
			{
				_hungerSpeedLimitation = true;
			}
			else
			{
				_hungerSpeedLimitation = false;
			};
			if (_fatigue > CODI_hgf_fatigueSpeedLimitation) then
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
		if (!_infected && ((random 1) < _damage*100*CODI_hgf_infectionChance)) then
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
			_damage = _damage + CODI_hgf_infectionDamage;
		};
		_player setDamage _damage;
		_prevDamage = _damage;
		_infectedChanged = false;
		if ((_infected && !_prevInfected) || (!_infected && _prevInfected)) then
		{
			_infectedChanged = true;
			if (_infected) then
			{
				hint (localize "STR_HINT_INFECTED");
			}
			else
			{
				hint (localize "STR_HINT_INFECTIONHEALED");
			};
		};
		_player setVariable[format["CODI_hgf_infected_%1", name _player], _infected, _infectedChanged];
		_player setVariable[format["CODI_hgf_thirst_%1", name _player], _thirst];
		_player setVariable[format["CODI_hgf_hunger_%1", name _player], _hunger];
		_player setVariable[format["CODI_hgf_fatigue_%1", name _player], _fatigue];
		_player setVariable[format["CODI_hgf_damage_%1", name _player], _damage];
		_player setVariable[format["CODI_hgf_temperature_%1", name _player], _temperature];
		_prevInfected = _infected;
		if (CODI_hgf_dayz == 0) then
		{
			if (CODI_hgf_showThirst == 1) then
			{
				((uiNamespace getVariable "CODI_hgf_hud") displayCtrl 55511) ctrlSetText (format["%1", round(_thirst)]+"%");
			};
			if (CODI_hgf_showHunger == 1) then
			{
				((uiNamespace getVariable "CODI_hgf_hud") displayCtrl 55512) ctrlSetText (format["%1", round(_hunger)]+"%");
			};
			if (CODI_hgf_showFatigue == 1) then
			{
				((uiNamespace getVariable "CODI_hgf_hud") displayCtrl 55513) ctrlSetText (format["%1", round(_fatigue)]+"%");
			};
			if (CODI_hgf_showDamage == 1) then
			{
				((uiNamespace getVariable "CODI_hgf_hud") displayCtrl 55514) ctrlSetText (format["%1", round((_damage)*100)]+"%");
			};
			if (CODI_hgf_showTemperature == 1) then
			{
				((uiNamespace getVariable "CODI_hgf_hud") displayCtrl 55515) ctrlSetText (format["%1", (round(_temperature*10))/10]+"°C");
			};
		}
		else
		{
			if (CODI_hgf_showThirst == 1) then
			{
				_r = 0;
				_g = 0;
				_b = 0;
				if (_thirst >= 0 && _thirst <= 33) then
				{
					_g = 255;
					_r = (_thirst/33)*255;
				};
				if (_thirst > 33 && _thirst <= 66) then
				{
					_r = 255;
					_g = 255 - ((_thirst-33)/33)*127;
				};
				if (_thirst > 66 && _thirst <= 100) then
				{
					_r =255;
					_g = 127 - ((_thirst-66)/34)*127;
				};
				_n = 4;
				if (_thirst >= 0 && _thirst < 20) then
				{
					_n = 4;
				};
				if (_thirst >= 20 && _thirst < 40) then
				{
					_n = 3;
				};
				if (_thirst >= 40 && _thirst < 60) then
				{
					_n = 2;
				};
				if (_thirst >= 60 && _thirst < 80) then
				{
					_n = 1;
				};
				if (_thirst >= 80 && _thirst <= 100) then
				{
					_n = 0;
				};
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55517) ctrlSetText format ["CODI\hgf\media\hud\status_thirst_inside_%1_ca.paa", _n];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55517) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55518) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
			};
			if (CODI_hgf_showHunger == 1) then
			{
				_r = 0;
				_g = 0;
				_b = 0;
				if (_hunger >= 0 && _hunger <= 33) then
				{
					_g = 255;
					_r = (_hunger/33)*255;
				};
				if (_hunger > 33 && _hunger <= 66) then
				{
					_r = 255;
					_g = 255 - ((_hunger-33)/33)*127;
				};
				if (_hunger > 66 && _hunger <= 100) then
				{
					_r =255;
					_g = 127 - ((_hunger-66)/34)*127;
				};
				_n = 4;
				if (_hunger >= 0 && _hunger < 20) then
				{
					_n = 4;
				};
				if (_hunger >= 20 && _hunger < 40) then
				{
					_n = 3;
				};
				if (_hunger >= 40 && _hunger < 60) then
				{
					_n = 2;
				};
				if (_hunger >= 60 && _hunger < 80) then
				{
					_n = 1;
				};
				if (_hunger >= 80 && _hunger <= 100) then
				{
					_n = 0;
				};
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55519) ctrlSetText format ["CODI\hgf\media\hud\status_food_inside_%1_ca.paa", _n];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55519) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55520) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
			};
			if (CODI_hgf_showFatigue == 1) then
			{
				_r = 0;
				_g = 0;
				_b = 0;
				if (_fatigue >= 0 && _fatigue <= 33) then
				{
					_g = 255;
					_r = (_fatigue/33)*255;
				};
				if (_fatigue > 33 && _fatigue <= 66) then
				{
					_r = 255;
					_g = 255 - ((_fatigue-33)/33)*127;
				};
				if (_fatigue > 66 && _fatigue <= 100) then
				{
					_r =255;
					_g = 127 - ((_fatigue-66)/34)*127;
				};
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55525) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
			};
			if (CODI_hgf_showDamage == 1) then
			{
				_r = 0;
				_g = 0;
				_b = 0;
				if (_damage >= 0 && _damage <= 0.33) then
				{
					_g = 255;
					_r = (_damage*100/33)*255;
				};
				if (_damage > 0.33 && _damage <= 0.66) then
				{
					_r = 255;
					_g = 255 - ((_damage*100-33)/33)*127;
				};
				if (_damage > 0.66 && _damage <= 1) then
				{
					_r =255;
					_g = 127 - ((_damage*100-66)/34)*127;
				};
				_n = 1;
				if (damage player >= 0/6 && damage player < 1/6) then
				{
					_n = 6;
				};
				if (damage player >= 1/6 && damage player < 2/6) then
				{
					_n = 5;
				};
				if (damage player >= 2/6 && damage player < 3/6) then
				{
					_n = 4;
				};
				if (damage player >= 3/6 && damage player < 4/6) then
				{
					_n = 3;
				};
				if (damage player >= 4/6 && damage player < 5/6) then
				{
					_n = 2;
				};
				if (damage player >= 5/6 && damage player <= 6/6) then
				{
					_n = 1;
				};
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55523) ctrlSetText format ["CODI\hgf\media\hud\status_blood_inside_%1_ca.paa", _n];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55523) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55524) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
				if ((damage _player > CODI_hgf_bleedingDamageLimit && CODI_hgf_bleedingDamage > 0) || (_infected && CODI_hgf_infectionDamage > 0) || ((_temperature < CODI_hgf_temperatureMin || _temperature > CODI_hgf_temperatureMax) && CODI_hgf_temperatureDamage > 0) || (_thirst >= 100 && CODI_hgf_thirstDamage > 0) || (_hunger >= 100 && CODI_hgf_hungerDamage > 0)) then
				{
					((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55526) ctrlSetTextColor [1, 1, 1, 1];
				}
				else
				{
					((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55526) ctrlSetTextColor [1, 1, 1, 0];
				};
			};
			if (CODI_hgf_showTemperature == 1) then
			{
				_r = 0;
				_g = 0;
				_b = 0;
				if (_temperature < CODI_hgf_temperatureMin) then
				{
					_r = 0;
					_g = 0;
					_b = 255;
				};
				if (_temperature >= CODI_hgf_temperatureMin && _temperature <= CODI_hgf_temperatureAvg) then
				{
					_r = 0;
					_g = (_temperature-CODI_hgf_temperatureMin)/(CODI_hgf_temperatureAvg-CODI_hgf_temperatureMin)*255;
					_b = 255 - (_temperature-CODI_hgf_temperatureMin)/(CODI_hgf_temperatureAvg-CODI_hgf_temperatureMin)*255;
				};
				if (_temperature > CODI_hgf_temperatureAvg && _temperature <= CODI_hgf_temperatureMax) then
				{
					_r = (_temperature-CODI_hgf_temperatureAvg)/(CODI_hgf_temperatureMax-CODI_hgf_temperatureAvg)*255;
					_g = 255 - (_temperature-CODI_hgf_temperatureAvg)/(CODI_hgf_temperatureMax-CODI_hgf_temperatureAvg)*255;
					_b = 0;
				};
				if (_temperature > CODI_hgf_temperatureMax) then
				{
					_r = 255;
					_g = 0;
					_b = 0;
				};
				_n = 2;
				if (_temperature < CODI_hgf_temperatureMin+1.5) then
				{
					_n = 0;
				};
				if (_temperature >= CODI_hgf_temperatureMin+1.5 && _temperature < CODI_hgf_temperatureAvg-1.5) then
				{
					_n = 1;
				};
				if (_temperature >= CODI_hgf_temperatureAvg-1.5 && _temperature < CODI_hgf_temperatureAvg+1.5) then
				{
					_n = 2;
				};
				if (_temperature >= CODI_hgf_temperatureAvg+1.5 && _temperature < CODI_hgf_temperatureMax-1.5) then
				{
					_n = 3;
				};
				if (_temperature >= CODI_hgf_temperatureMax-1.5) then
				{
					_n = 4;
				};
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55521) ctrlSetText format ["CODI\hgf\media\hud\status_temp_%1_ca.paa", _n];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55521) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
				((uiNamespace getVariable "CODI_hgf_hudDayZ") displayCtrl 55522) ctrlSetTextColor [_r/255, _g/255, _b/255, 1];
			};
		};
		sleep 1;
	};
};