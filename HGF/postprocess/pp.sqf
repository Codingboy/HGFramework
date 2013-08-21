if (!isDedicated) then
{
	[0.33, 0.25, 0.02, 0.005, 1.5, 5, 1, 3, 0.5, 1.5] execVM "HGF\postprocess\tunnelview.sqf";
	[0.66, 0.15, 0.5, 0.1, 1, 3, 1, 3, 0.5, 1.5] execVM "HGF\postprocess\illusions.sqf";
	[0.80, 0.50, 0.20, 0.05, 1, 3, 1, 3, 0.5, 1.5] execVM "HGF\postprocess\neardeath.sqf";
	[0.15, 0.33, 2.5, 0.5, 5, 10, 10, 20] execVM "HGF\postprocess\shake.sqf";
	[0.50, 1, 10, 10, 60] execVM "HGF\postprocess\blackout.sqf";
};