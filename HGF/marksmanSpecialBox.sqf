private ["_crate","_time","_despawn","_para","_playerNear"];
if (!isServer) exitWith {};
_pos = _this select 0;

_crate = createVehicle["B_supplyCrate_F", [_pos select 0, _pos select 1, hg_specialCrateDropHeight], [], 0, "NONE"];
_para = "B_Parachute_02_F" createVehicle [getPos _crate select 0, getPos _crate select 1, getPos _crate select 2];
_crate attachTo [_para,[0,0,-1]];
_para setPos [getPos _crate select 0, getPos _crate select 1, hg_specialCrateDropHeight];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate allowDamage false;

_crate addWeaponCargoGlobal["srifle_EBR_F", 1];
_crate addMagazineCargoGlobal["20Rnd_762x51_Mag", 5];
_crate addItemCargoGlobal["FirstAidKit", 5];
_crate addItemCargoGlobal["U_B_GhillieSuit", 1];
_crate addItemCargoGlobal["V_PlateCarrier2_rgr", 1];
_crate addItemCargoGlobal["MineDetector", 0];
_crate addItemCargoGlobal["NVGoggles", 1];
_crate addItemCargoGlobal["Rangefinder", 1];
_crate addItemCargoGlobal["H_HelmetB", 0];
_crate addMagazineCargoGlobal["HandGrenade", 2];
_crate addMagazineCargoGlobal["SmokeShell", 2];
_crate addMagazineCargoGlobal["Chemlight_blue", 2];
_crate addItemCargoGlobal["optic_Hamr", 0];
_crate addItemCargoGlobal["optic_SOS", 1];
_crate addItemCargoGlobal["muzzle_snds_B", 1];

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

sleep hg_specialCrateDespawnTime;

_playerNear = false;
{
	if (alive _x && _x distance _crate < 3) then
	{
		_playerNear = true;
	}
}
forEach hg_players;
while {_playerNear} do
{
	sleep 1;
	_playerNear = false;
	{
		if (alive _x && _x distance _crate < 3) then
		{
			_playerNear = true;
		}
	}
	forEach hg_players;
};
deleteVehicle _crate;