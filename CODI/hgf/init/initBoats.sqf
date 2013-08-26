private["_vehicle","_markersPos","_veh","_para","_active","_paraPos"];

if (isServer) then
{
	_vehicle = CODI_hgf_boats;
	_active = true;
	_markersPos = [];
	{
		if (getMarkerColor _x == CODI_hgf_boatColor) then
		{
			_markersPos = _markersPos + [getMarkerPos _x];
		};
	}
	forEach allMapMarkers;
	if (count _markersPos == 0) then
	{
		_active = false;
	};
	diag_log format ["%1 HGFramework: boats initialised", time];
	sleep CODI_hgf_boatFirstDelay;
	while {_active} do
	{
		_paraPos = _markersPos select (floor(random(count _markersPos)));
		_para = "B_Parachute_02_F" createVehicle [_paraPos select 0, _paraPos select 1, CODI_hgf_boatDropHeight];
		_veh = (_vehicle select (floor(random(count _vehicle)))) createVehicle [(getPos _para) select 0, (getPos _para) select 1, (getPos _para) select 2];
		_veh attachTo [_para,[0,0,-1]];
		_para setPos [getPos _para select 0, getPos _para select 1, CODI_hgf_boatDropHeight];
		[_veh, _para] execVM "CODI\hgf\loot\vehicle\initBoat.sqf";
		diag_log format ["%1 HGFramework: %2 spawned", time, _vehicle];
		sleep CODI_hgf_boatSpawnDelay;
	};
};