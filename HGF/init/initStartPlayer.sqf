private ["_markers","_pos","_angle","_units","_unitsRnd","_y","_z","_rnd","_coordX"];

if (isServer) then
{
	waituntil {!isnil "hg_fnc_setDir"};
	_markers = [];
	for "_x" from 0 to count allMapMarkers-1 do
	{
		if (getMarkerColor (allMapMarkers select _x) == hg_startColor) then
		{
			_markers = _markers + [allMapMarkers select _x];
		}
	};
	if (count _markers == 0) exitWith{};
	_pos = getMarkerPos (_markers select hg_startMarkerNumber);
	_angle = 0;
	_units = [];
	{
		_units = _units + [_x];
	}
	forEach hg_players;
	_unitsRnd = [];
	for "_i" from 0 to count hg_players-1 do
	{
		_rnd = floor(random ((count hg_players)-_i-1));
		_unitsRnd = _unitsRnd + [_units select _rnd];
		_units = _units - [_units select _rnd]
	};
	_coordX = _pos select 0;
	_y = _pos select 1;
	_z = _pos select 2;
	for "_i" from 0 to count hg_players-1 do
	{
		(_unitsRnd select _i) disableAI "MOVE";
		(_unitsRnd select _i) setPos [_coordX - hg_startRadius * (sin _angle) * 1, _y - hg_startRadius * (cos _angle) * 1, _z];
		(_unitsRnd select _i) setDir _angle;
		[[_unitsRnd select _i,_angle], "hg_fnc_setDir",true,true] spawn BIS_fnc_MP;
		
		_angle = _angle + 360.0/count hg_players;
	};
	diag_log format ["%1 HGFramework: all players teleported", time];
	diag_log format ["%1 HGFramework: startplayer initialised", time];
};