if (alive player) then
{
	sleep 5;
	if (CODI_hgf_license_sounds) then
	{
		playSound "CODI_hgf_sound_mockingjay_call";
	};
	sleep 5;
	["end1", true, true] call BIS_fnc_endMission;
}
else
{
	["killed", false, true] call BIS_fnc_endMission;
};