private["_finish","_null","_playersAlive"];
if (isServer) then
{
	_finish = false;
	while {!_finish} do
	{
		_playersAlive = 0;
		{
			if (alive _x && side _x == west) then
			{
				_playersAlive = _playersAlive + 1;
			};
		}
		forEach hg_players;
		if (_playersAlive <= 1) then
		{
			_null = [{_null = [] execVM "HGF\endMission.sqf";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
			_finish = true;
		};
		sleep 1;
	};
};