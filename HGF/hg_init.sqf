private ["_null","_initStartBox","_initBoxes"];
_null = [] execVM "HGF\hg_variables.sqf";
waitUntil {scriptDone _null};
_null = [] execVM "HGF\hg_functions.sqf";
waitUntil {scriptDone _null};

enableSaving[false, false];
if (!isDedicated) then
{
	player createDiarySubject["info", "Info"];
	player createDiaryRecord["Info", ["Mission", "Survive the other tributes."]];
	player createDiaryRecord["Info", ["Recommended Serversettings", "3rd person view:	Disabled"]];
	player createDiaryRecord["Info", ["Recommended Serversettings", "Weapon Crosshair:	Disabled"]];
	player createDiaryRecord["Info", ["Recommended Serversettings", "Show detected mines:	Enabled"]];
	player createDiaryRecord["Info", ["Recommended Serversettings", "Enemy TAG:	Disabled"]];
	player createDiaryRecord["Info", ["Recommended Serversettings", "Friendly TAG:	Disabled"]];
	player createDiaryRecord["Info", ["Recommended Serversettings", "Extended armor:	Enabled"]];
	player createDiaryRecord["Info", ["Features", "go prone and select ""sleep"" from actionmenu to sleep"]];
	player createDiaryRecord["Info", ["Features", "press ""space"" while running to jump"]];
	player createDiaryRecord["Info", ["Features", "go close to a dead player and select ""revive"" from actionmenu to revive him"]];
	player createDiaryRecord["Info", ["Features", "press ctrl+R to repack magazines"]];
	player createDiaryRecord["Info", ["Features", "press shift+M to show a little map"]];

	[] execVM "HGF\init\initIDs.sqf";
	if (hg_license_sounds) then
	{
		player addMPEventHandler ["mpkilled", {disableUserInput false; playSound "cannon"; (uiNamespace getVariable "hg_hud") closeDisplay 0;}];
	};
	player addAction[localize "STR_ACT_SLEEP", {[player] execVM "HGF\humanity\sleep.sqf";}, nil, 0, false, true, "", "stance player == ""PRONE"" && vehicle player == player"];
	if (hg_licence_reveal) then
	{
		[] execVM "reveal\reveal.sqf";
	};
	if (hg_license_explosivesinterface) then
	{
		nul = [player] execVM "explosive_interface_fncs\explosive_interface.sqf";
	};
};
if (hg_license_tao_foldmap_a3) then
{
	[] execVM "tao_foldmap_a3\XEH_preClientInit.sqf";
};
if (hg_license_btc_revive && hg_revive==1) then
{
	call compile preprocessFile "=BTC=_revive\=BTC=_revive_init.sqf";
};
if (hg_license_groupManagement) then
{
	[player] execVM "scripts\groupsMenu\initGroups.sqf";
};
if (hg_license_outlw_magRepack) then
{
	[] execVM "outlw_magRepack\init_magRepack.sqf";
};
if (hg_license_cly_removedead) then
{
	[hg_removePlayersTime, hg_removeVehiclesTime] execVM "cly_removedead\cly_removedead.sqf";
};
if (hg_license_damagesystem) then
{
	[hg_damagesystemValue] execVM "damagesystem\AUSMD_damagesystem.sqf";
};
if (hg_license_windsystem && hg_windsystem==1) then
{
	if (isServer) then {execVM "windsystem\serverSync.sqf";};
	if (!isDedicated) then
	{
		execVM "windsystem\bulletWindClient.sqf";
		player addAction [localize "STR_ACT_WINDINFORMATION", "HGF\other\windinformation.sqf", nil, 0, false, true, "", ""];
	};
};
_initBoxes = [] execVM "HGF\init\initBoxes.sqf";
cutRsc["hg_hud", "PLAIN", 0, false];

if (hg_startHour == -1) then
{
	hg_startHour = floor(random 24);
};
if (hg_startHour == -2) then//day
{
	hg_startHour = floor(random 15)+4;
};
if (hg_startHour == -3) then//night
{
	hg_startHour = floor(random 9)+19;
	if (hg_startHour >= 24) then
	{
		hg_startHour = hg_startHour - 24;
	}
};
if (hg_startHour == -4) then//morning
{
	hg_startHour = floor(random 3)+3;
};
if (hg_startHour == -5) then//evening
{
	hg_startHour = floor(random 3)+19;
};
if (hg_startMinute == -1) then
{
	hg_startMinute = floor(random 60);
};
setDate[date select 0, date select 1, date select 2, hg_startHour, hg_startMinute];
if (hg_civilianPresent == 0) then
{
	{
		if (side _x == civilian) then
		{
			deleteVehicle _x;
		};
	}
	forEach allUnits;
};

sleep 1;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (isServer) then
{
	hg_players = [];
	if (isMultiplayer) then
	{
		{
			if (alive _x && side _x == west) then
			{
				hg_players = hg_players + [_x];
			};
		}
		forEach playableUnits;
		publicVariable "hg_players";
	}
	else
	{
		{
			if (alive _x && side _x == west) then
			{
				hg_players = hg_players + [_x];
			};
		}
		forEach allUnits;
		publicVariable "hg_players";
	};
};

if (isServer) then
{
	waitUntil {!isNil "hg_players"};
	{
		_null = [_x] execVM "HGF\init\initPlayer.sqf";
	}
	forEach hg_players;
}
else
{
	if (side player == west) then
	{
		_null = [player] execVM "HGF\init\initPlayer.sqf";
	};
};

if (isServer) then
{
	_null = [{hint (localize "STR_HINT_TEAMUP");},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	_initStartBox = [] execVM "HGF\init\initStartBox.sqf";
	sleep hg_groupUpTime;
	waitUntil {scriptDone _initBoxes};
	waitUntil {scriptDone _initStartBox};
	_null = [{hint ((localize "STR_HINT_ARENAREADY")+"\n"+format[(localize "STR_HINT_TELEPORT"), "5"]+"\n"+(localize "STR_HINT_DONTMOVE"));},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	sleep 1;
	_null = [{hint ((localize "STR_HINT_ARENAREADY")+"\n"+format[(localize "STR_HINT_TELEPORT"), "4"]+"\n"+(localize "STR_HINT_DONTMOVE"));},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	sleep 1;
	_null = [{hint ((localize "STR_HINT_ARENAREADY")+"\n"+format[(localize "STR_HINT_TELEPORT"), "3"]+"\n"+(localize "STR_HINT_DONTMOVE"));},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	sleep 1;
	_null = [{hint ((localize "STR_HINT_ARENAREADY")+"\n"+format[(localize "STR_HINT_TELEPORT"), "2"]+"\n"+(localize "STR_HINT_DONTMOVE"));},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	sleep 1;
	_null = [{hint ((localize "STR_HINT_ARENAREADY")+"\n"+format[(localize "STR_HINT_TELEPORT"), "1"]+"\n"+(localize "STR_HINT_DONTMOVE"));},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	sleep 1;
	_null = [{hint ((localize "STR_HINT_ARENAREADY")+"\n"+format[(localize "STR_HINT_TELEPORT"), "0"]+"\n"+(localize "STR_HINT_DONTMOVE"));},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	initStartPlayer = [] execVM "HGF\init\initStartPlayer.sqf";
	waitUntil {scriptDone initStartPlayer};
	west setFriend[west, 0];
	_null = [] execVM "HGF\other\deleteSpecialMarkers.sqf";
	_null = [] execVM "HGF\init\initSpecialBoxes.sqf";
	_null = [] execVM "HGF\init\initVehicles.sqf";
	_null = [] execVM "HGF\init\initBoats.sqf";
	_null = [] execVM "HGF\init\initHelis.sqf";
	_null = [] execVM "HGF\init\initMines.sqf";
	_null = [] execVM "HGF\init\initMissionEnd.sqf";
	_null = [] execVM "HGF\init\initStartBoxDespawn.sqf";
	_null = [] execVM "HGF\init\disableTIEquipment.sqf";
	estimatedTimeLeft (hg_deathZoneWarningTime+hg_deathZoneDelay);
	if (hg_markPlayers == 1) then
	{
		_null = [] execVM "HGF\init\initMarkPlayers.sqf";
	};
	_null = [{_null = [] execVM "HGF\init\initDeathzone.sqf"; _null = [] execVM "HGF\init\initHumanity.sqf"; _null = [1, hg_acceleration] execVM "HGF\init\initTimeAcceleration.sqf"; _null = [] execVM "HGF\init\initBorders.sqf"; if (hg_license_sounds) then {playSound (localize "STR_SOUND_HAPPYHUNGERGAMES");}; if (hg_markPlayers == 1) then {_null = [] execVM "HGF\init\initMarkPlayersClient.sqf";};},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
};

hg_init = true;
publicVariable "hg_init";
publicVariable "hg_mineTimer";