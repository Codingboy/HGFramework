private ["_markersPos","_pos","_angle","_y","_z","_box","_ang","_null","_rnd","_posX","_posY","_mine","_mineAngle","_fireplace","_playerPos","_coordX"];

if (isServer) then
{
	{
		if (side _x == civilian && alive _x) then
		{
			_null = [_x] execVM "HGF\init\initCivilian.sqf";
			waitUntil {scriptDone _null};
		};
	}
	forEach allUnits;
	
	_markersPos = [];
	for "_x" from 0 to count allMapMarkers-1 do
	{
		if (getMarkerColor (allMapMarkers select _x) == hg_startColor) then
		{
			_markersPos = _markersPos + [getMarkerPos (allMapMarkers select _x)];
		}
	};
	if (count _markersPos == 0) exitWith{};
	hg_startMarkerNumber = floor(random(count _markersPos));
	_pos = _markersPos select (hg_startMarkerNumber);
	_angle = 0;
	_coordX = _pos select 0;
	_y = _pos select 1;
	_z = _pos select 2;
	if (hg_license_vas && hg_vasOnStart == 1) then
	{
		_null = [_pos] execVM "HGF\loot\vasStart.sqf";
		waitUntil {scriptDone _null};
	}
	else
	{
		_null = [_pos] execVM "HGF\loot\start\weaponBoxStart.sqf";
		waitUntil {scriptDone _null};
		_null = [_pos] execVM "HGF\loot\start\weaponBoxStart.sqf";
		waitUntil {scriptDone _null};
		_null = [_pos] execVM "HGF\loot\start\weaponBoxStart.sqf";
		waitUntil {scriptDone _null};
	};
	for "_i" from 0 to count hg_players-1 do
	{
		_rnd = (random 0.25)+0.5-0.125;
		_ang = _angle + (random (360.0/count hg_players)) - (360.0/count hg_players/2);
		_null = [[_coordX - hg_startRadius * (sin _ang) * _rnd, _y - hg_startRadius * (cos _ang) * _rnd, _z]] execVM "HGF\loot\start\ammoBoxStart.sqf";
		waitUntil {scriptDone _null};
		
		_rnd = (random 0.25)+0.75-0.125;
		_ang = _angle + (random (360.0/count hg_players)) - (360.0/count hg_players/2);
		_null = [[_coordX - hg_startRadius * (sin _ang) * _rnd, _y - hg_startRadius * (cos _ang) * _rnd, _z]] execVM "HGF\loot\start\supportBoxStart.sqf";
		waitUntil {scriptDone _null};
		
		_rnd = (random 0.25)+1.25-0.125;
		_ang = _angle + (random (360.0/count hg_players)) - (360.0/count hg_players/2);
		_null = [[_coordX - hg_startRadius * (sin _ang) * _rnd, _y - hg_startRadius * (cos _ang) * _rnd, _z]] execVM "HGF\loot\start\specialBoxStart.sqf";
		waitUntil {scriptDone _null};
		
		_mineAngle = 0;
		_playerPos = [_coordX - hg_startRadius * (sin _angle) * 1, _y - hg_startRadius * (cos _angle) * 1, _z];
		while {_mineAngle < 360} do
		{
			_posX = (_playerPos select 0) - 1.5 * sin _mineAngle;
			_posY = (_playerPos select 1) - 1.5 * cos _mineAngle;
			_mine = createMine["APERSMine", [_posX, _posY, _playerPos select 2], [], 0];
			west revealMine _mine;
			civilian revealMine _mine;
			hg_mines = hg_mines + [_mine];
			_mineAngle = _mineAngle + 360/16;
		};
		
		_fireplace = "Land_FirePlace_F";
		if (date select 3 >= 19 || date select 3 <= 4) then
		{
			_fireplace = "FirePlace_burning_F";
		};
		//_rnd = (random 2);
		//_ang = _angle + (random (360.0/count hg_players));
		//_box = createVehicle[_fireplace, [_coordX - hg_startRadius * (sin _ang) * _rnd, _y - hg_startRadius * (cos _ang) * _rnd, _z], [], 0, "NONE"];
		_rnd = (random 2);
		_ang = _angle + (random (360.0/count hg_players));
		_box = createVehicle[_fireplace, [_coordX - hg_startRadius * (sin _ang) * _rnd, _y - hg_startRadius * (cos _ang) * _rnd, _z], [], 0, "NONE"];
		
		_angle = _angle + 360.0/count hg_players;
	};
	diag_log format ["%1 HGFramework: startbox initialised", time];
};