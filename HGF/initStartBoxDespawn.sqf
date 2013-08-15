if (isServer) then
{
	while {hg_startCrateDespawnTime > 0} do
	{
		hg_startCrateDespawnTime = hg_startCrateDespawnTime - 1;
		sleep 1;
	};
};