private ["_vehicle","_markersPos","_veh","_para","_active","_paraPos","_null"];

if (isServer) then
{
	_vehicle = hg_vehicles;
	sleep hg_vehicleFirstDelay;
	_active = true;
	_markersPos = [];
	{
		if (getMarkerColor _x == hg_vehicleColor) then
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
		_para = "B_Parachute_02_F" createVehicle [_paraPos select 0, _paraPos select 1, hg_vehicleDropHeight];
		_veh = (_vehicle select (floor(random(count _vehicle)))) createVehicle [(getPos _para) select 0, (getPos _para) select 1, (getPos _para) select 2];
		_veh attachTo [_para,[0,0,0]];
		_para setPos [getPos _para select 0, getPos _para select 1, hg_vehicleDropHeight];
		_null = [_veh, _para] execVM "HGF\loot\vehicle\initVehicle.sqf";
		sleep hg_vehicleSpawnDelay;
	};
};