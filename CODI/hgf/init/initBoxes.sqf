private ["_boxes","_inits","_rnd","_rnd2","_box","_null","_crateMarkers","_countstart","_countend","_boxRnd","_allChances"];

if (isServer) then
{
	_boxes = ["Box_NATO_Wps_F", "Box_NATO_Ammo_F", "Box_NATO_Grenades_F", "Box_NATO_WpsSpecial_F", "Box_NATO_AmmoOrd_F", "Box_NATO_Support_F", "Land_WaterBarrel_F", "Land_Sacks_goods_F"];
	_inits = ["CODI\hgf\loot\static\weaponBox.sqf", "CODI\hgf\loot\static\ammoBox.sqf", "CODI\hgf\loot\static\grenadeBox.sqf", "CODI\hgf\loot\static\specialBox.sqf", "CODI\hgf\loot\static\explosivesBox.sqf", "CODI\hgf\loot\static\supportBox.sqf", "CODI\hgf\loot\static\waterBox.sqf", "CODI\hgf\loot\static\foodBox.sqf"];
	_crateMarkers = [];
	{
		if (getMarkerColor _x == CODI_hgf_crateColor) then
		{
			_crateMarkers = _crateMarkers + [_x];
		};
	}
	forEach allMapMarkers;
	_countstart = count _crateMarkers;
	for "_i" from 0 to CODI_hgf_lootGuaranteePerType-1 do
	{
		for "_n" from 0 to count _boxes-1 do
		{
			_rnd = floor(random(count _crateMarkers-1));
			_null = [getMarkerPos (_crateMarkers select _rnd)] execVM (_inits select _n);
			waitUntil {scriptDone _null};
			if (CODI_hgf_deleteCrateMarkers == 1) then
			{
				deleteMarker (_crateMarkers select _rnd);
			};
			_crateMarkers = _crateMarkers - [_crateMarkers select _rnd];
		};
	};
	for "_x" from 0 to count _crateMarkers-1 do
	{
		_rnd = floor(random 101);
		if (_rnd <= CODI_hgf_crateSpawnChance) then
		{
			_rnd2 = floor(random 101);
			_boxRnd = 0;
			_allChances = 0;
			if (_rnd2 >= _allChances && _rnd2 < _allChances+CODI_hgf_loot_ammoChance) then
			{
				_boxRnd = 1;
			};
			_allChances = _allChances + CODI_hgf_loot_ammoChance;
			if (_rnd2 >= _allChances && _rnd2 < _allChances+CODI_hgf_loot_weaponChance) then
			{
				_boxRnd = 0;
			};
			_allChances = _allChances + CODI_hgf_loot_weaponChance;
			if (_rnd2 >= _allChances && _rnd2 < _allChances+CODI_hgf_loot_grenadeChance) then
			{
				_boxRnd = 2;
			};
			_allChances = _allChances + CODI_hgf_loot_grenadeChance;
			if (_rnd2 >= _allChances && _rnd2 < _allChances+CODI_hgf_loot_explosiveChance) then
			{
				_boxRnd = 4;
			};
			_allChances = _allChances + CODI_hgf_loot_explosiveChance;
			if (_rnd2 >= _allChances && _rnd2 < _allChances+CODI_hgf_loot_supportChance) then
			{
				_boxRnd = 5;
			};
			_allChances = _allChances + CODI_hgf_loot_supportChance;
			if (_rnd2 >= _allChances && _rnd2 <= _allChances+CODI_hgf_loot_specialChance) then
			{
				_boxRnd = 3;
			};
			_allChances = _allChances + CODI_hgf_loot_specialChance;
			if (_rnd2 >= _allChances && _rnd2 <= _allChances+CODI_hgf_loot_waterChance) then
			{
				_boxRnd = 6;
			};
			_allChances = _allChances + CODI_hgf_loot_waterChance;
			if (_rnd2 >= _allChances && _rnd2 <= _allChances+CODI_hgf_loot_foodChance) then
			{
				_boxRnd = 7;
			};
			_allChances = _allChances + CODI_hgf_loot_foodChance;
			_null = [getMarkerPos (_crateMarkers select _x)] execVM (_inits select _boxRnd);
			waitUntil {scriptDone _null};
			if (CODI_hgf_deleteCrateMarkers == 1) then
			{
				deleteMarker (_crateMarkers select _x);
			};
		}
		else
		{
			deleteMarker (_crateMarkers select _x);
		};
	};
	_countend = count _crateMarkers;
	diag_log format ["%1 HGFramework: crates initialised", time, _countend, _countstart];
	diag_log format ["%1 HGFramework: %2 of %3 crates spawned", time];
};