private ["_sz","_safezone","_null","_marker"];
if (isServer) then
{
	_sz = [];
	for "_x" from 0 to count allMapMarkers-1 do
	{
		if (getMarkerColor (allMapMarkers select _x) == CODI_hgf_safeZoneColor) then
		{
			_sz = _sz + [allMapMarkers select _x];
		};
	};
	if (count _sz == 0) exitWith {diag_log format ["%1 HGFramework: WARNING: no safezones", time];};
	_safezone = floor(random (count _sz));
	CODI_hgf_safezonename = _sz select _safezone;
	CODI_hgf_safezonepos = getMarkerPos (_sz select _safezone);
	publicVariable "CODI_hgf_safezonename";
	publicVariable "CODI_hgf_safezonepos";
	diag_log format ["%1 HGFramework: deathzone initialised", time];
	sleep (CODI_hgf_deathZoneWarningTime);
	_null = [{hint format[localize "STR_HINT_DEATHZONE_01", CODI_hgf_deathZoneDelay/60, CODI_hgf_safezonename]; CODI_hgf_bordersActive = 0;},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	diag_log format ["%1 HGFramework: safezone is %2", time, CODI_hgf_safezonename];
	/*_i = 0;
	{
		deleteMarker format["CODI_hgf_allowedAreas_%1", _i];
		_i = _i + 1;
	}
	forEach CODI_hgf_allowedAreas;
	_i = 0;
	{
		deleteMarkerLocal format["CODI_hgf_disallowedAreas_%1", _i];
		_i = _i + 1;
	}
	forEach CODI_hgf_disallowedAreas;*/
	_null = [{
		CODI_hgf_deathzoneTrigger = createTrigger["EmptyDetector", CODI_hgf_safezonepos];
		CODI_hgf_deathzoneTrigger setTriggerActivation["WEST", "PRESENT", true];
		CODI_hgf_deathzoneTrigger setTriggerType "NONE";
		CODI_hgf_deathzoneTrigger setTriggerArea [CODI_hgf_safeZoneDistance, CODI_hgf_safeZoneDistance, 0, false];
	},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	_marker = createMarker ["CODI_hgf_safezone", CODI_hgf_safezonepos];
	_marker setMarkerBrush "DiagGrid";
	_marker setMarkerColor CODI_hgf_safeZoneColor;
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize[CODI_hgf_safeZoneDistance, CODI_hgf_safeZoneDistance];
	_marker setMarkerType "Empty";
	_marker setMarkerText "";
	_marker setMarkerAlpha 0.33;
	sleep 5;
	while {CODI_hgf_deathZoneDelay > 0} do
	{
		sleep 1;
		CODI_hgf_deathZoneDelay = CODI_hgf_deathZoneDelay - 1;
		publicVariable "CODI_hgf_deathZoneDelay";
		_null = [{hintSilent format[localize "STR_HINT_DEATHZONE_02", CODI_hgf_deathZoneDelay];},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	};
	_null = [{hint (localize "STR_HINT_DEATHZONE_03"); _null = [] execVM "CODI\hgf\other\deathzone.sqf";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	diag_log format ["%1 HGFramework: deathzone activated", time];
};