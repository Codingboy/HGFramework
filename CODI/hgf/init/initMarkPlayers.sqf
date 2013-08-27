private ["_marker","_posX","_posY","_angle","_distance","_player","_null"];
sleep 10;
if (isServer) then
{
	{
		_posX = (getPos _x) select 0;
		_posY = (getPos _x) select 1;
		_angle = random 360;
		_distance = random CODI_hgf_markPlayersPrecision;
		_posX = _posX - _distance*sin _angle;
		_posY = _posY - _distance*cos _angle;
		_marker = createMarkerLocal[name _x, [_posX, _posY]];
		if (CODI_hgf_markPlayersName == 1) then
		{
			_marker setMarkerText (name _x);
		};
		_marker setMarkerBrush "Solid";
		_marker setMarkerColor CODI_hgf_markPlayerColor;
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_dot";
		CODI_hgf_playerMarkersPos = CODI_hgf_playerMarkersPos + [getMarkerPos _marker];
	}
	forEach CODI_hgf_players;
	_null = [{sleep 5; (name player) setMarkerColorLocal CODI_hgf_markPlayerSelfColor;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	diag_log format ["%1 HGFramework: markplayers initialised", time];
	while {true} do
	{
		for "_i" from 0 to count CODI_hgf_players-1 do
		{
			_player = CODI_hgf_players select _i;
			if (alive _player) then
			{
				if ([(getPos _player) select 0, (getPos _player) select 1, 0] distance [(CODI_hgf_playerMarkersPos select _i) select 0,(CODI_hgf_playerMarkersPos select _i) select 1, 0] > CODI_hgf_markPlayersPrecision) then
				{
					_posX = (getPos _player) select 0;
					_posY = (getPos _player) select 1;
					_angle = random 360;
					_distance = random CODI_hgf_markPlayersPrecision;
					_posX = _posX - _distance*sin _angle;
					_posY = _posY - _distance*cos _angle;
					CODI_hgf_playerMarkersPos set [_i, [_posX, _posY]];
				};
			}
			else
			{
				deleteMarker (name _player);
			};
		};
		publicVariable "CODI_hgf_playerMarkersPos";
		sleep 1;
	};
};