private ["_player"];
_player = _this select 0;
if (CODI_hgf_licence_jump) then
{
	[] execVM "Jump\jump.sqf";
};

_player addEventHandler["fired",
{
	if (_this select 1 == "Put") then
	{
		civilian revealMine (_this select 6);
	};
}];

removeallweapons _player;
removeGoggles _player;
removeHeadgear _player;
removeVest _player;
removeUniform _player;
removeBackpack _player;
removeAllAssignedItems _player;

_player addUniform "U_B_CombatUniform_mcam";
_player addVest "V_Rangemaster_belt";
_player addWeapon "ItemCompass";
_player addWeapon "ItemGps";
_player addWeapon "ItemMap";
_player addWeapon "ItemWatch";
_player addWeapon "ItemRadio";
diag_log format ["%1 HGFramework: player initialised", time];