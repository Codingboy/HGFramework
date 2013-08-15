private["_veh","_para"];
if (!isServer) exitWith {};
_veh = _this select 0;
_para = _this select 1;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
while {(getPosATL _veh) select 2 < 10} do
{
	sleep 0.1;
};
while {(getPosATL _veh) select 2 > 1} do
{
	sleep 0.1;
};
detach _veh;
deleteVehicle _para;