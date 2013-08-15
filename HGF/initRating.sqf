if (isServer) then
{
	{
		if (side _x != civilian) then
		{
			_x addMPEventHandler["MPKilled", {[_this select 0, _this select 1] execVM "HGF\handleKillEnemy.sqf";}];
			_x addMPEventHandler["MPHit", {[_this select 0, _this select 1, _this select 2] execVM "HGF\handleHitEnemy.sqf";}];
		};
		if (side _x == civilian) then
		{
			_x addMPEventHandler["MPKilled", {[_this select 0, _this select 1] execVM "HGF\handleKillFriendly.sqf";}];
			_x addMPEventHandler["MPHit", {[_this select 0, _this select 1, _this select 2] execVM "HGF\handleHitFriendly.sqf";}];
		};
	}
	forEach hg_players;
	while {true} do
	{
		{
			if (alive _x) then
			{
				_x addScore 1;
			}
		}
		forEach hg_players;
		sleep 1;
	};
};