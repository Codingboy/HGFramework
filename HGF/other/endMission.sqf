if (alive player) then
{
	sleep 5;
	if (hg_license_sounds) then
	{
		playSound "mockingjay_call";
	};
	sleep 5;
	["end1", true, true] call BIS_fnc_endMission;
}
else
{
	["killed", false, true] call BIS_fnc_endMission;
};