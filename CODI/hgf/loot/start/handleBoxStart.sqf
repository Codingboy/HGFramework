private ["_crate"];
_crate = _this select 0;

while {CODI_hgf_startCrateDespawnTime > 0} do
{
	sleep 0.1;
};
deleteVehicle _crate;