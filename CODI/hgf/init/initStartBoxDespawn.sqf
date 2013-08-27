if (isServer) then
{
	while {CODI_hgf_startCrateDespawnTime > 0} do
	{
		CODI_hgf_startCrateDespawnTime = CODI_hgf_startCrateDespawnTime - 1;
		sleep 1;
	};
};