if (isServer) then
{
	if (CODI_hgf_deleteSpecialMarkers == 1) then
	{
		sleep 5;
		{
			if (getMarkerColor _x == CODI_hgf_startColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == CODI_hgf_specialCrateColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == CODI_hgf_vehicleColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == CODI_hgf_heliColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == CODI_hgf_boatColor) then
			{
				deleteMarker _x;
			};
			if (getMarkerColor _x == CODI_hgf_safeZoneColor) then
			{
				deleteMarker _x;
			};
		}
		forEach allMapMarkers;
		diag_log format ["%1 HGFramework: special markers deleted", time];
	};
};