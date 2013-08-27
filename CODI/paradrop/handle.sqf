//[_crate, _para] spawn CODI_pd_fnc_handle;
private ["_crate","_para"];
_crate = _this select 0;
_para = _this select 1;

while {getPos _crate select 2 < 0} do
{
	sleep 0.1;
};
while {getPos _crate select 2 > 1} do
{
	sleep 0.1;
};
detach _crate;
deleteVehicle _para;