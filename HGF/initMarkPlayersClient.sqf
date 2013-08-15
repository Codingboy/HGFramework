if (!isDedicated) then
{
	sleep 10;
	while {true} do
	{
		for "_i" from 0 to count hg_players-1 do
		{
			_player = hg_players select _i;
			if (alive _player) then
			{
				if (count hg_playerMarkersPos - 1 >= _i) then
				{
					(name _player) setMarkerPosLocal [(hg_playerMarkersPos select _i) select 0, (hg_playerMarkersPos select _i) select 1];
				};
			};
		};
		sleep 1;
	};
};