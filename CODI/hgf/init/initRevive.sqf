if (!isDedicated) then
{
	if (CODI_hgf_revive == 1) then
	{
		{
			if (_x != player) then
			{
				_x addAction [localize "STR_ACT_REVIVE", {_null = [_x, player] execVM "CODI\hgf\revive\revive.sqf"}, nil, 0, false, true, "", "_target getVariable[format["dead_", name _target], 1] == 0 && _target distance _this < 3 && _this getVariable[format["dead_", name _this], 0] == 0 && (""Medikit"" in backpackItems _target || ""Medikit"" in backpackItems _this)"];
				_x addAction ["<t color='#ff0000'>"+(localize "STR_ACT_KILL")+"</t>", {_null = [_x] execVM "CODI\hgf\revive\kill.sqf"}, nil, 0, false, true, "", "_target distance _this < 3 && _target getVariable[format["dead_", name _this], 0] == 1"];
			};
		}
		forEach CODI_hgf_players;
		player addMPEventHandler ["MPHit", {_null = [_this select 0, _this select 1, _this select 2] execVM "CODI\hgf\revive\hit.sqf";}];
	};
	diag_log format ["%1 HGFramework: revive initialised", time];
};