private["_active","_isIn","_time","_marker", "_i"];
if (!isDedicated && (hg_bordersActive == 1)) then
{
	sleep 10;//make sure markers are not deleted by deletemarkersscript
	hg_disallowedAreasMarkers = [];
	hg_allowedAreasMarkers = [];
	_i = 0;
	{
		_x setTriggerActivation["WEST", "PRESENT", true];
		_x setTriggerType "NONE";
		_marker = createMarkerLocal [format["hg_allowedAreas_%1", _i], getPos _x];
		_i = _i + 1;
		_marker setMarkerBrushLocal "DiagGrid";
		_marker setMarkerColorLocal hg_allowedAreasColor;
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
		hg_allowedAreasMarkers = hg_allowedAreasMarkers + [_marker];
	}
	forEach hg_allowedAreas;
	_i = 0;
	{
		_x setTriggerActivation["WEST", "PRESENT", true];
		_x setTriggerType "NONE";
		_marker = createMarkerLocal [format["hg_disallowedAreas_%1", _i], getPos _x];
		_i = _i + 1;
		_marker setMarkerBrushLocal "DiagGrid";
		_marker setMarkerColorLocal hg_disallowedAreasColor;
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
		hg_disallowedAreasMarkers = hg_disallowedAreasMarkers + [_marker];
	}
	forEach hg_disallowedAreas;
	sleep 5;
	_active = true;
	if (count hg_allowedAreas == 0) then
	{
		_active = false;
	};
	while {_active && (hg_bordersActive == 1)} do
	{
		_isIn = false;
		{
			if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
			{
				_isIn = true;
			};
		}
		forEach hg_allowedAreas;
		{
			if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
			{
				_isIn = false;
			};
		}
		forEach hg_disallowedAreas;
		_time = 0;
		while {!_isIn} do
		{
			hint format[localize "STR_HINT_BORDER", (hg_bordersReturnTime - _time)];
			{
				if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
				{
					_isIn = true;
				};
			}
			forEach hg_allowedAreas;
			{
				if (player in (list _x) || (vehicle player) in (list _x) || !alive player) then
				{
					_isIn = false;
				};
			}
			forEach hg_disallowedAreas;
			_time = _time + 0.1;
			sleep 0.1;
			if (_time >= hg_bordersReturnTime) then
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
	forEach hg_allowedAreasMarkers;
	{
		deleteMarkerLocal _x;
	}
	forEach hg_disallowedAreasMarkers;
};