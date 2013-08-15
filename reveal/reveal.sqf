if (!isDedicated) then
{
	while {true} do
	{
		_nearObjects = nearestObjects [vehicle player,[],10];
		{
			player reveal _x;
		}
		forEach _nearObjects;
		sleep 2;
	};
};