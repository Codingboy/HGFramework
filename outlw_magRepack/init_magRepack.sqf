
[] spawn
{
	if (isNil "init_alreadyRun") then
	{
		[] execVM "outlw_magRepack\magRepack.sqf";
		init_alreadyRun = 1;
	};
};












