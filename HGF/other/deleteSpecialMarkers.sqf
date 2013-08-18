if (isServer) then
{
	if (hg_deleteSpecialMarkers == 1) then
	{
		sleep 5;
		{
			if (getMarkerColor _x == hg_startColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == hg_specialCrateColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == hg_vehicleColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == hg_heliColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == hg_boatColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == hg_safeZoneColor) then
			{
				deleteMarker _x;
			};
		}
		forEach allMapMarkers;
	};
};