private["_null"];
if (isServer) then
{
	diag_log format ["%1 HGFramework: mines initialised", time];
	while {CODI_hgf_mineTimer > 0} do
	{
		sleep 1;
		CODI_hgf_mineTimer = CODI_hgf_mineTimer - 1;
		publicVariable "CODI_hgf_mineTimer";
		if (CODI_hgf_mineTimer <= 10 && CODI_hgf_mineTimer > 0) then
		{
			_null = [{hintSilent format["%1", CODI_hgf_mineTimer]; if (CODI_hgf_license_sounds) then {playSound "CODI_hgf_sound_countdown";};},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
		}
		else
		{
			_null = [{hintSilent format["%1", CODI_hgf_mineTimer];},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
		};
	};
	{
		deleteVehicle _x;
	}
	forEach CODI_hgf_mines;
	diag_log format ["%1 HGFramework: mines deactivated", time];
	_null = [{hintSilent format["%1", CODI_hgf_mineTimer]; if (CODI_hgf_license_sounds) then {playSound "CODI_hgf_sound_start";};},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	{
		_x enableAI "MOVE";
	}
	forEach CODI_hgf_players;
};