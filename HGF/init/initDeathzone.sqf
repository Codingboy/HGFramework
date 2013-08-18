private ["_sz","_safezone","_null","_marker"];
if (isServer) then
{
	_sz = [];
	for "_x" from 0 to count allMapMarkers-1 do
	{
		if (getMarkerColor (allMapMarkers select _x) == hg_safeZoneColor) then
		{
			_sz = _sz + [allMapMarkers select _x];
		};
	};
	if (count _sz == 0) exitWith {};
	_safezone = floor(random (count _sz));
	hg_safezonename = _sz select _safezone;
	hg_safezonepos = getMarkerPos (_sz select _safezone);
	publicVariable "hg_safezonename";
	publicVariable "hg_safezonepos";
	sleep (hg_deathZoneWarningTime);
	_null = [{hint format[((localize "STR_HINT_DEATHZONE_01")+"%1"+(localize "STR_HINT_DEATHZONE_02")+"%2"+(localize "STR_HINT_DEATHZONE_03")), hg_deathZoneDelay/60, hg_safezonename]; hg_bordersActive = 0;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	/*_i = 0;
	{
		deleteMarker format["hg_allowedAreas_%1", _i];
		_i = _i + 1;
	}
	forEach hg_allowedAreas;
	_i = 0;
	{
		deleteMarkerLocal format["hg_disallowedAreas_%1", _i];
		_i = _i + 1;
	}
	forEach hg_disallowedAreas;*/
	_null = [{
		hg_deathzoneTrigger = createTrigger["EmptyDetector", hg_safezonepos];
		hg_deathzoneTrigger setTriggerActivation["WEST", "PRESENT", true];
		hg_deathzoneTrigger setTriggerType "NONE";
		hg_deathzoneTrigger setTriggerArea [hg_safeZoneDistance, hg_safeZoneDistance, 0, false];
	},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	_marker = createMarker ["hg_safezone", hg_safezonepos];
	_marker setMarkerBrush "DiagGrid";
	_marker setMarkerColor hg_safeZoneColor;
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize[hg_safeZoneDistance, hg_safeZoneDistance];
	_marker setMarkerType "Empty";
	_marker setMarkerText "";
	_marker setMarkerAlpha 0.33;
	while {hg_deathZoneDelay > 0} do
	{
		sleep 1;
		hg_deathZoneDelay = hg_deathZoneDelay - 1;
		publicVariable "hg_deathZoneDelay";
		_null = [{hintSilent format["Deathzone is active in %1 seconds.", hg_deathZoneDelay];},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	};
	_null = [{hint "Deathzone is active."; _null = [] execVM "HGF\other\deathzone.sqf";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
};