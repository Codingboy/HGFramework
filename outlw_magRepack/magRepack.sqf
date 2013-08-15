
/*
	|----
		- Author: Outlawled
		- Created: 07/03/13
		- Updated: 22/06/13
		- Version: 2.1.3
		- Description:
			- Takes all bullets from each magazine in the player's inventory and repacks them into the fewest amount of magazines possible.
			- The player may choose to skip any magazine type or exit the repack altogether. 'Space' to skip, any movement key to exit.
	|----
*/

if (isDedicated) exitWith {};

finishedRepackingMagazinesBool = true;
cancelRepackingMagazinesBool = false;
skipRepackingCurrentMagazineBool = false;
initiateMagazineRepackingKeys = actionKeys "reloadMagazine";			

repackMagazinesScript =
{
	private
	[
		"_allMags", "_magDeets", "_magTypes", "_magIndiAmmoCounts", "_magAmmoCounts", "_magAmmoCaps", "_magCounts", "_magNonFullCounts", "_currentMagType", "_currentMagAmmo", "_moveOrGetOut",
		"_firstElement", "_infoString", "_repackable", "_unloadRequired", "_countMagsAble", "_transparency", "_elipsis", "_anim", "_animExit", "_currentVehicle", "_inVehicle", "_isCargo", "_vehicleFailStrings",
		"_vehicleFailWeights", "_exitCode", "_nonFullMags", "_uniray", "_uniAmmo", "_currentAmmoValue", "_fullyRepackedCounts", "_magTypesN", "_magIndiAmmoCountsN", "_magAmmoCountsN", "_magAmmoCapsN",
		"_magCountsN", "_sorted", "_before", "_switchMags", "_intervalCount", "_repackInterval", "_repackPrepareOrFinish", "_repackCode", "_beltOrMagArray", "_n", "_a", "_p", "_s"
	];

	cancelRepackingMagazinesKeys = (actionKeys "MoveForward") + (actionKeys "MoveBack") + (actionKeys "TurnLeft") + (actionKeys "TurnRight");
	disabledWhileRepackingMagazinesKeys = (actionKeys "getOver") + (actionKeys "reloadMagazine");
	
	cancelOrSkipID = (findDisplay 46) displayAddEventHandler ["KeyDown", 	"
																				_handled = false;
																				if (_this select 1 in cancelRepackingMagazinesKeys) then
																				{
																					if (vehicle player == player) then
																					{
																						cancelRepackingMagazinesBool = true;
																					};
																				};
																				if (_this select 1 == 57) then
																				{
																					skipRepackingCurrentMagazineBool = true;
																					_handled = true;
																				};
																				if (_this select 1 in disabledWhileRepackingMagazinesKeys) then
																				{
																					_handled = true;
																				};
																				_handled;
																			"];	
	finishedRepackingMagazinesBool = false;
	cancelRepackingMagazinesBool = false;
	skipRepackingCurrentMagazineBool = false;
	_allMags = magazines player;
	_magDeets = magazinesDetail player;
	_magTypes = [];
	_magIndiAmmoCounts = [];
	_magAmmoCounts = [];
	_magAmmoCaps = [];
	_magCounts = [];
	_magNonFullCounts = [];
	_currentMagType = currentMagazine player;
	_currentMagAmmo = weaponState player select 4;
	_moveOrGetOut = "Move";
	_firstElement = true;
	_infoString = "";
	_repackable = false;
	_unloadRequired = false;
	_countMagsAble = 0;
	_transparency = "60";
	_elipsis = "";
	_anim = "";
	_currentVehicle = vehicle player;
	_inVehicle = false;
	_isCargo = true;
	_vehicleFailStrings = [
								"You must be in a passenger seat to repack your mags.",
								"That was just an example. There are no magazines in space.",
								(format ["I'm sorry, %1, I'm afraid I can't do that.", name player]),
								"49 27 6d 20 61 20 72 65 61 6c 20 62 6f 79 2e",
								"01010000 01101100 01100101 01100001 01110011 01100101 00100000 01101011 01101001 01101100 01101100 00100000 01101101 01100101 00101110",
								(parseText "FLAGRANT SYSTEM ERROR<br/><br/>Computer over.<br/>Virus = Very Yes.")
							];
	_vehicleFailWeights = [0.95, 0.01, 0.01, 0.01, 0.01, 0.01];
	_exitCode = {
					finishedRepackingMagazinesBool = true;
					(findDisplay 46) displayRemoveEventHandler ["KeyDown", cancelOrSkipID];
				};
	
	if (_currentVehicle != player) then
	{
		_inVehicle = true;
		_moveOrGetOut = "Get out";
		
		if (player == driver _currentVehicle || player == gunner _currentVehicle || player == commander _currentVehicle) then
		{
			hint ([_vehicleFailStrings, _vehicleFailWeights] call BIS_fnc_selectRandomWeighted);
			_isCargo = false;
		};
	};
	
	if (!_isCargo) exitWith {call _exitCode};

	for [{_n = 0}, {_n < count _allMags}, {_n = _n + 1}] do
	{
		if (!(_allMags select _n in _magTypes) && (getNumber(configFile >> "CfgMagazines" >> (_allMags select _n) >> "count") > 1)) then
		{
			_magTypes = _magTypes + [_allMags select _n];
			_magAmmoCounts = _magAmmoCounts + [0];
		};
	};
	
	for [{_n = 0}, {_n < count _magTypes}, {_n = _n + 1}] do
	{
		_magAmmoCaps = _magAmmoCaps + [getNumber(configFile >> "CfgMagazines" >> (_magTypes select _n) >> "count")];
		_magCounts = _magCounts + [{_x == _magTypes select _n} count _allMags];
		_magIndiAmmoCountsN = [];
		_nonFullMags = 0;
		
		for [{_a = 0}, {_a < count _allMags}, {_a = _a + 1}] do
		{
			if (_magTypes select _n == _allMags select _a) then
			{
				_uniray = toArray(_magDeets select _a);
				_uniAmmo = [];

				_p = count _uniray;
				while {(_uniray select (_p - 1)) != 40} do {_p = _p - 1};
				
				while {(_uniray select _p) != 47} do
				{
					_uniAmmo set [count _uniAmmo, (_uniray select _p)];
					_p = _p + 1;
				};	
				
				_currentAmmoValue = (parseNumber(toString(_uniAmmo)));				
				_magIndiAmmoCountsN = _magIndiAmmoCountsN + [_currentAmmoValue];
				_magAmmoCounts set [_n, ((_magAmmoCounts select _n) + _currentAmmoValue)];
			};
		};
		
		_magIndiAmmoCounts set [_n, _magIndiAmmoCountsN];
		
		for [{_a = 0}, {_a < count _magIndiAmmoCountsN}, {_a = _a + 1}] do
		{
			if ((_magIndiAmmoCountsN select _a) < (_magAmmoCaps select _n)) then
			{
				_nonFullMags = _nonFullMags + 1;
			};
		};
		
		_magNonFullCounts set [_n, _nonFullMags];
		
		if (_nonFullMags > 1) then
		{
			_repackable = true;
		};
		
		if ((_magTypes select _n) == (_currentMagType)) then
		{	
			if ((_nonFullMags == 1) && _currentMagAmmo < (_magAmmoCaps select _n)) then
			{
				_unloadRequired = true;
			};
		};
		
		_countMagsAble = _countMagsAble + (_magCounts select _n);
	};
	
	if (_repackable) then
	{
		for [{_n = 0}, {(_n < count _magTypes) && !cancelRepackingMagazinesBool}, {_n = _n + 1}] do
		{	
			if ((_magNonFullCounts select _n) > 1 && !cancelRepackingMagazinesBool) then
			{
				_fullyRepackedCounts = [];
				_magTypesN = _magTypes select _n;
				_magIndiAmmoCountsN = _magIndiAmmoCounts select _n;
				_magAmmoCountsN = _magAmmoCounts select _n;
				_magAmmoCapsN = _magAmmoCaps select _n;
				_magCountsN = _magCounts select _n;
				_sorted =+ _magIndiAmmoCountsN;
				[_sorted, "descend"] call outlw_fnc_QuickSort;
				_before =+ _sorted;
				_switchMags = 0;
				_intervalCount = -2;
				_repackInterval = 1;
				_repackPrepareOrFinish = "Preparing";
					hint " ";
				_s = 0;
				
				if (skipRepackingCurrentMagazineBool) then
				{
					_intervalCount = -3;
				};
				
				_repackCode =
				{
					while {_sorted select _s == _magAmmoCapsN} do {_s = _s + 1};
					_sorted set [_s, (_sorted select _s) + 1];
					_sorted set [(count _sorted) - 1, (_sorted select ((count _sorted) - 1)) - 1];
					_sorted = _sorted - [0];
				};
				
				for [{_a = 0}, {_a < floor(_magAmmoCountsN / _magAmmoCapsN)}, {_a = _a + 1}] do
				{
					_fullyRepackedCounts set [_a, _magAmmoCapsN];
				};
				_fullyRepackedCounts set [(count _fullyRepackedCounts), _magAmmoCountsN % _magAmmoCapsN];
				_fullyRepackedCounts = _fullyRepackedCounts - [0];
				
				_beltOrMagArray = toArray (getText (configFile >> "cfgMagazines" >> _magTypesN >> "DisplayName"));
				
				if ((toString 	[_beltOrMagArray select ((count _beltOrMagArray) - 4), _beltOrMagArray select ((count _beltOrMagArray) - 3),
								_beltOrMagArray select ((count _beltOrMagArray) - 2), _beltOrMagArray select ((count _beltOrMagArray) - 1)]) == "Case") then
				{
					_repackInterval = 3;
					_repackCode =
					{
						while {(_sorted select _s == _magAmmoCapsN) && _s < (count _sorted) - 2} do {_s = _s + 1};
						_sorted set [_s, (_sorted select _s) + (_sorted select ((count _sorted) - 1))];
						
						if (_sorted select _s > _magAmmoCapsN) then
						{
							_sorted set [(count _sorted) - 1, (_sorted select _s) - _magAmmoCapsN];
							_sorted set [_s, _magAmmoCapsN];
						}
						else
						{
							_sorted set [(count _sorted) - 1, 0];
							_sorted = _sorted - [0];
						};
					};
				};
				
				skipRepackingCurrentMagazineBool = false;
				
				for [{_a = 0}, {_switchMags < 3 && ({_x == _magTypesN} count (magazines player)) == _magCountsN && !cancelRepackingMagazinesBool && !skipRepackingCurrentMagazineBool}, {_a = _a + 1}] do
				{						
					if (_inVehicle) then
					{
						if (player == driver _currentVehicle || player == gunner _currentVehicle || player == commander _currentVehicle) then
						{
							cancelRepackingMagazinesBool = true;
						};
						
						_anim = "";
					}
					else
					{
						if (currentWeapon player == primaryWeapon player) then
						{
							_anim = "ainvpknlmstpsraswrfldnon";
						}
						else
						{
							_anim = "ainvpknlmstpsraswpstdnon";
						};
					};
					
					if (vehicle player != _currentVehicle) then
					{
						cancelRepackingMagazinesBool = true;
					};
					
					if (animationState player != _anim && _anim != "") then
					{					
						player playMove _anim;
					};
					
					if (_transparency == "FF") then
					{
						_transparency = "60";
					}
					else
					{
						_transparency = "FF";
					};

					if (_elipsis == "....") then
					{
						_elipsis = "";
					};
					
					if (_intervalCount >= 0) then
					{
						_repackPrepareOrFinish = "Repacking";
					};
					
					if (_switchMags > 0) then
					{
						_repackPrepareOrFinish = "Finishing";
					};
					
					hintSilent parseText format	[
												"%1%2<br/>%3s<br/>%4<br/><t color='#%5ffffff'><img size='3' image='%6'/></t><br/>'Space' to skip.<br/>%7 to exit.",
												_repackPrepareOrFinish, _elipsis, getText (configFile >> "cfgMagazines" >> _magTypesN >> "DisplayName"), _sorted, _transparency,
												getText (configFile >> "cfgMagazines" >> _magTypesN >> "picture"), _moveOrGetOut
											];
													
					for [{_p = 0}, {(_p <= 1) && !cancelRepackingMagazinesBool && !skipRepackingCurrentMagazineBool}, {_p = _p + 0.1}] do
					{
						sleep 0.1;
					};
					
					_intervalCount = _intervalCount + 1;
					
					if (!cancelRepackingMagazinesBool && !skipRepackingCurrentMagazineBool) then
					{
						if (count _sorted > 1) then
						{
							if (_sorted select ((count _sorted) - 2) != _magAmmoCapsN) then
							{
								if (_intervalCount == _repackInterval) then
								{
									call _repackCode;
									_intervalCount = 0;
								};
							}
							else
							{
								_switchMags = _switchMags + 1;
							};
						}
						else
						{
							_switchMags = _switchMags + 1;
						};
					};

					_elipsis = _elipsis + ".";
				};
				
				if (!([_before, _sorted] call BIS_fnc_areEqual) && ({_x == _magTypesN} count (magazines player)) == _magCountsN) then
				{
					for [{_a = 0}, {_a < _magCountsN}, {_a = _a + 1}] do
					{
						player removeMagazine _magTypesN;
					};
	
					for [{_a = 0}, {_a < count _sorted}, {_a = _a + 1}] do
					{
						player addMagazine [_magTypesN, _sorted select _a];
					};
					
					if (!_firstElement) then
					{
						_infoString = _infoString + format ["\n\n%1", ""];
					}
					else
					{
						_firstElement = false;
					};
					
					_infoString = _infoString +	format 	[
															"%1s\n%2Rnds\n%3\n>>\n%4",																//   7.62mm 20Rnd Mags
															getText(configFile >> "CfgMagazines" >> _magTypesN >> "displayName"),					//        56Rnds
															_magAmmoCountsN,																		//     [10,18,13,15]
															_magIndiAmmoCountsN,																	//			>>
															_sorted																					//		[20,20,16]
														];
				};
			};
		};

		hint _infoString;
	}
	else
	{
		switch (true) do
		{
			case (_unloadRequired): {hint "Please unload the magazine in your current weapon and try again."};
			case (_countMagsAble == 0): {hint "You don't even have any spare magazines, you dick."};
			default	{hint "Unable to repack magazines."};
		};	
	};
	
	if (vehicle player == player) then
	{
		_animExit = "ainvpknlmstpsraswrfldnon_amovpknlmstpsraswrfldnon";	
	
		if (currentWeapon player != primaryWeapon player) then
		{
			_animExit = "ainvpknlmstpsraswpstdnon_amovpknlmstpsraswpstdnon";
		};
	
		if (animationState player == _anim) then
		{
			player playMove _animExit;
		};
	};
	
	call _exitCode;
};

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "
														_handled = false;
														if ((_this select 3) && (_this select 1 in initiateMagazineRepackingKeys) && (finishedRepackingMagazinesBool)) then
														{
															[] spawn repackMagazinesScript;
															_handled = true;
														};
														_handled;
													"];










