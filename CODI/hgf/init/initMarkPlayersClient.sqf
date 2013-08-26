if (!isDedicated) then
{
	sleep 10;
	diag_log format ["%1 HGFramework: markplayers client initialised", time];
	while {true} do
	{
		for "_i" from 0 to count CODI_hgf_players-1 do
		{
			_player = CODI_hgf_players select _i;
			if (alive _player) then
			{
				if (count CODI_hgf_playerMarkersPos - 1 >= _i) then
				{
					(name _player) setMarkerPosLocal [(CODI_hgf_playerMarkersPos select _i) select 0, (CODI_hgf_playerMarkersPos select _i) select 1];
				};
			};
		};
		sleep 1;
	};
};