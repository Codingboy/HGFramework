private["_vehicle","_markersPos","_veh","_para","_active","_paraPos"];

if (isServer) then
{
	_vehicle = hg_helis;
	sleep hg_heliFirstDelay;
	_active = true;
	_markersPos = [];
	{
		if (getMarkerColor _x == hg_heliColor) then
		{
			_markersPos = _markersPos + [getMarkerPos _x];
		};
	}
	forEach allMapMarkers;
	if (count _markersPos == 0) then
	{
		_active = false;
	};
	while {_active} do
	{
		_paraPos = _markersPos select (floor(random(count _markersPos)));
		_para = "B_Parachute_02_F" createVehicle [_paraPos select 0, _paraPos select 1, hg_heliDropHeight];
		_veh = (_vehicle select (floor(random(count _vehicle)))) createVehicle [(getPos _para) select 0, (getPos _para) select 1, (getPos _para) select 2];
		_veh attachTo [_para,[0,0,-1]];
		_para setPos [getPos _para select 0, getPos _para select 1, hg_heliDropHeight];
		sleep hg_heliSpawnDelay;
		[_veh, _para] execVM "HGF\initVehicle.sqf";
	};
};