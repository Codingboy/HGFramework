private["_active","_isIn","_time","_marker", "_i"];
if (!isDedicated && (CODI_hgf_bordersActive == 1)) then
{
	sleep 10;//make sure markers are not deleted by deletemarkersscript
	CODI_hgf_disallowedAreasMarkers = [];
	CODI_hgf_allowedAreasMarkers = [];
	_i = 0;
	{
		_x setTriggerActivation["WEST", "PRESENT", true];
		_x setTriggerType "NONE";
		_marker = createMarkerLocal [format["CODI_hgf_allowedAreas_%1", _i], getPos _x];
		_i = _i + 1;
		_marker setMarkerBrushLocal "DiagGrid";
		_marker setMarkerColorLocal CODI_hgf_allowedAreasColor;
		if ((triggerArea _x) select 3) then
		{
			_marker setMarkerShapeLocal "RECTANGLE";
		}
		else
		{
			_marker setMarkerShapeLocal "ELLIPSE";
		};
		_marker setMarkerDirLocal ((triggerArea _x) select 2);
		_marker setMarkerSizeLocal[(triggerArea _x) select 0, (triggerArea _x) select 1];
		_marker setMarkerTypeLocal "Empty";
		_marker setMarkerTextLocal "";
		_marker setMarkerAlphaLocal 0.33;
		CODI_hgf_allowedAreasMarkers = CODI_hgf_allowedAreasMarkers + [_marker];
	}
	forEach CODI_hgf_allowedAreas;
	_i = 0;
	{
		_x setTriggerActivation["WEST", "PRESENT", true];
		_x setTriggerType "NONE";
		_marker = createMarkerLocal [format["CODI_hgf_disallowedAreas_%1", _i], getPos _x];
		_i = _i + 1;
		_marker setMarkerBrushLocal "DiagGrid";
		_marker setMarkerColorLocal CODI_hgf_disallowedAreasColor;
		if ((triggerArea _x) select 3) then
		{
			_marker setMarkerShapeLocal "RECTANGLE";
		}
		else
		{
			_marker setMarkerShapeLocal "ELLIPSE";
		};
		_marker setMarkerDirLocal ((triggerArea _x) select 2);
		_marker setMarkerSizeLocal[(triggerArea _x) select 0, (triggerArea _x) select 1];
		_marker setMarkerTypeLocal "Empty";
		_marker setMarkerTextLocal "";
		_marker setMarkerAlphaLocal 1;
		CODI_hgf_disallowedAreasMarkers = CODI_hgf_disallowedAreasMarkers + [_marker];
	}
	forEach CODI_hgf_disallowedAreas;
	sleep 5;
	_active = true;
	if (count CODI_hgf_allowedAreas == 0) then
	{
		_active = false;
	};
	diag_log format ["%1 HGFramework: borders initialised", time];
	while {_active && (CODI_hgf_bordersActive == 1)} do
	{
		_isIn = false;
		{
			if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
			{
				_isIn = true;
			};
		}
		forEach CODI_hgf_allowedAreas;
		{
			if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
			{
				_isIn = false;
			};
		}
		forEach CODI_hgf_disallowedAreas;
		_time = 0;
		while {!_isIn} do
		{
			hint format[localize "STR_HINT_BORDER", (CODI_hgf_bordersReturnTime - _time)];
			{
				if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
				{
					_isIn = true;
				};
			}
			forEach CODI_hgf_allowedAreas;
			{
				if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
				{
					_isIn = false;
				};
			}
			forEach CODI_hgf_disallowedAreas;
			_time = _time + 0.1;
			sleep 0.1;
			if (_time >= CODI_hgf_bordersReturnTime) then
			{
				while {_active} do
				{
					player setDamage 1;
					sleep 1;
				};
			};
		};
		sleep 1;
	};
	{
		deleteMarkerLocal _x;
	}
	forEach CODI_hgf_allowedAreasMarkers;
	{
		deleteMarkerLocal _x;
	}
	forEach CODI_hgf_disallowedAreasMarkers;
	diag_log format ["%1 HGFramework: borders deactivated", time];
};