private ["_inits","_boxesPos","_rnd1","_rnd2","_active"];
if (isServer) then
{
	_inits = ["HGF\marksmanSpecialBox.sqf","HGF\diveSpecialBox.sqf","HGF\explosivesSpecialBox.sqf","HGF\medicSpecialBox.sqf","HGF\uavSpecialBox.sqf","HGF\grenadierSpecialBox.sqf","HGF\mgSpecialBox.sqf"];
	if (hg_license_vas && hg_vasOnParadrop == 1) then
	{
		_inits = _inits + ["HGF\vas.sqf"];
	};
	_boxesPos = [];
	for "_x" from 0 to count allMapMarkers-1 do
	{
		if (getMarkerColor (allMapMarkers select _x) == hg_specialCrateColor) then
		{
			_boxesPos = _boxesPos + [getMarkerPos (allMapMarkers select _x)];
		};
	};
	_active = true;
	if (count _boxesPos == 0) then
	{
		_active = false;
	};
	sleep hg_specialCrateFirstDelay;
	while {_active} do
	{
		_rnd1 = floor(random (count _inits));
		_rnd2 = floor(random (count _boxesPos));
		[_boxesPos select _rnd2] execVM (_inits select _rnd1);
		sleep hg_specialCrateDelay;
	};
};