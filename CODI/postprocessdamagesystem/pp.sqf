if (!isDedicated) then
{
	//only one works: tunnelview or blurred
	[0.33, 0.50, 0.010, 0.005, 1.5, 5, 1, 3, 0.5, 1.5] execVM "CODI\postprocessdamagesystem\tunnelview.sqf";
	//[0.33, 0.25, 3, 0.25, 1, 3, 1, 3, 0.5, 1.5] execVM "CODI\postprocessdamagesystem\blurred.sqf";
	
	[0.66, 0.15, 0.15, 0.05, 0.75, 1.5, 0.5, 1.0, 0.5, 1.0] execVM "CODI\postprocessdamagesystem\illusions.sqf";
	[0.85, 0.25, 0.15, 0.05, 1, 3, 1, 3, 0.5, 1.5] execVM "CODI\postprocessdamagesystem\neardeath.sqf";
	[0.15, 0.33, 3.5, 0.5, 5, 10, 10, 20] execVM "CODI\postprocessdamagesystem\shake.sqf";
	[0.75, 1, 10, 10, 60] execVM "CODI\postprocessdamagesystem\blackout.sqf";
};