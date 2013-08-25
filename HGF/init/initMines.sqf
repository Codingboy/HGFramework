private["_null"];
if (isServer) then
{
	diag_log format ["%1 HGFramework: mines initialised", time];
	while {hg_mineTimer > 0} do
	{
		sleep 1;
		hg_mineTimer = hg_mineTimer - 1;
		publicVariable "hg_mineTimer";
		if (hg_mineTimer <= 10 && hg_mineTimer > 0) then
		{
			_null = [{hintSilent format["%1", hg_mineTimer]; playSound "countdown";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
		}
		else
		{
			_null = [{hintSilent format["%1", hg_mineTimer];},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
		};
	};
	{
		deleteVehicle _x;
	}
	forEach hg_mines;
	diag_log format ["%1 HGFramework: mines deactivated", time];
	_null = [{hintSilent format["%1", hg_mineTimer]; playSound "start";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	{
		_x enableAI "MOVE";
	}
	forEach hg_players;
};