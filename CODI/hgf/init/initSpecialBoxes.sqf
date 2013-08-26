private ["_inits","_boxesPos","_rnd1","_rnd2","_active"];
if (isServer) then
{
	_inits = ["CODI\hgf\loot\paradrop\marksmanSpecialBox.sqf","CODI\hgf\loot\paradrop\diveSpecialBox.sqf","CODI\hgf\loot\paradrop\explosivesSpecialBox.sqf","CODI\hgf\loot\paradrop\medicSpecialBox.sqf","CODI\hgf\loot\paradrop\uavSpecialBox.sqf","CODI\hgf\loot\paradrop\grenadierSpecialBox.sqf","CODI\hgf\loot\paradrop\mgSpecialBox.sqf"];
	if (CODI_hgf_license_vas && CODI_hgf_vasOnParadrop == 1) then
	{
		_inits = _inits + ["CODI\hgf\loot\vas.sqf"];
	};
	_boxesPos = [];
	for "_x" from 0 to count allMapMarkers-1 do
	{
		if (getMarkerColor (allMapMarkers select _x) == CODI_hgf_specialCrateColor) then
		{
			_boxesPos = _boxesPos + [getMarkerPos (allMapMarkers select _x)];
		};
	};
	_active = true;
	if (count _boxesPos == 0) then
	{
		_active = false;
	};
	diag_log format ["%1 HGFramework: specialboxes initialised", time];
	sleep CODI_hgf_specialCrateFirstDelay;
	while {_active} do
	{
		_rnd1 = floor(random (count _inits));
		_rnd2 = floor(random (count _boxesPos));
		[_boxesPos select _rnd2] execVM (_inits select _rnd1);
		sleep CODI_hgf_specialCrateDelay;
	};
};