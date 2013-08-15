private ["_crate"];
if (!isServer) exitWith {};
_crate = _this select 0;

while {hg_startCrateDespawnTime > 0} do
{
	sleep 1;
};
deleteVehicle _crate;