//[getPos player, 100, "B_supplyCrate_F"] call CODI_pd_fnc_spawn;
private ["_crate","_para","_pos","_height","_type"];
_pos = _this select 0;
_height = _this select 1;
_type = _this select 2;

_crate = createVehicle[_type, [0, 0, 10000], [], 0, "NONE"];
_para = "B_Parachute_02_F" createVehicle [0, 0, 10000];
_crate attachTo [_para,[0,0,-1]];
_para setPos [_pos select 0, _pos select 1, _height];
[_crate, _para] spawn CODI_pd_fnc_handle;
_crate;