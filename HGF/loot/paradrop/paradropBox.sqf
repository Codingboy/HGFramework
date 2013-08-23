private ["_crate","_para","_playerNear","_pos","_items"];
if (!isServer) exitWith {};
_pos = _this select 0;
_items = _this select 1;

_crate = createVehicle["B_supplyCrate_F", [_pos select 0, _pos select 1, hg_specialCrateDropHeight], [], 0, "FLY"];
_para = "B_Parachute_02_F" createVehicle [getPos _crate select 0, getPos _crate select 1, getPos _crate select 2];
_crate attachTo [_para,[0,0,-1]];
_para setPos [getPos _crate select 0, getPos _crate select 1, hg_specialCrateDropHeight];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate allowDamage false;

{
	[_crate, _x] execVM "HGF\loot\addToCrate.sqf";
}
forEach _items;

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