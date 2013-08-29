private ["_null","_initStartBox","_initBoxes"];
_null = [] execVM "CODI\hgf\variables.sqf";
waitUntil {scriptDone _null};
_null = [] execVM "patchVariables.sqf";
waitUntil {scriptDone _null};
_null = [] execVM "CODI\hgf\functions.sqf";
waitUntil {scriptDone _null};

enableSaving[false, false];
if (isServer) then
{
	[] execVM "CODI\addtocrate\init.sqf";
	[] execVM "CODI\paradrop\init.sqf";
	CODI_hgf_fnc_initCrate = compile preprocessFile "CODI\hgf\loot\initCrate.sqf";
	CODI_hgf_fnc_addDefaultLoot = compile preprocessFile "CODI\hgf\loot\static\defaultLoot.sqf";
	CODI_hgf_fnc_handleStartBox = compile preprocessFile "CODI\hgf\loot\start\handleBoxStart.sqf";
};
if (!isDedicated) then
{
	player createDiarySubject["info", "Info"];
	player createDiaryRecord["Info", ["Mission", "Survive the other tributes."]];
	player createDiaryRecord["Info", ["Features", "go prone and select ""sleep"" from actionmenu to sleep"]];
	player createDiaryRecord["Info", ["Features", "press ""space"" while running to jump"]];
	player createDiaryRecord["Info", ["Features", "go close to a dead player and select ""revive"" from actionmenu to revive him"]];
	player createDiaryRecord["Info", ["Features", "press CTRL+R to repack magazines"]];
	player createDiaryRecord["Info", ["Features", "press SHIFT+M to show a little map"]];

	[] execVM "CODI\hgf\init\initIDs.sqf";
	if (CODI_hgf_license_sounds) then
	{
		player addMPEventHandler ["mpkilled", {disableUserInput false; playSound "CODI_hgf_sound_cannon"; if (CODI_hgf_dayz == 0) then {(uiNamespace getVariable "CODI_hgf_hud") closeDisplay 0;}else{(uiNamespace getVariable "CODI_hgf_hudDayZ") closeDisplay 0;};}];
	};
	player addAction[localize "STR_ACT_SLEEP", {[player] execVM "CODI\hgf\humanity\sleep.sqf";}, nil, 0, false, true, "", "stance player == ""PRONE"" && vehicle player == player"];
	if (CODI_hgf_licence_reveal) then
	{
		[] execVM "reveal\reveal.sqf";
		diag_log format ["%1 HGFramework: revealscript initialised", time];
	};
	if (CODI_hgf_ppEffects == 1) then
	{
		[] execVM "CODI\postprocessdamagesystem\pp.sqf";
	};
};
if (CODI_hgf_license_explosivesinterface) then
{
	nul = [] execVM "explosive_interface_fncs\all_use_interface.sqf";
	diag_log format ["%1 HGFramework: explosiveinterface initialised", time];
};
if (CODI_hgf_license_tao_foldmap_a3) then
{
	[] execVM "tao_foldmap_a3\XEH_preClientInit.sqf";
	diag_log format ["%1 HGFramework: foldingmap initialised", time];
};
if (CODI_hgf_license_btc_revive && CODI_hgf_revive==1) then
{
	call compile preprocessFile "=BTC=_revive\=BTC=_revive_init.sqf";
};
if (CODI_hgf_license_groupManagement) then
{
	[player] execVM "scripts\groupsMenu\initGroups.sqf";
	diag_log format ["%1 HGFramework: groupmanagement initialised", time];
};
if (CODI_hgf_license_outlw_magRepack) then
{
	[] execVM "outlw_magRepack\init_magRepack.sqf";
	diag_log format ["%1 HGFramework: mag repack initialised", time];
};
if (CODI_hgf_license_cly_removedead) then
{
	[CODI_hgf_removePlayersTime, CODI_hgf_removeVehiclesTime] execVM "cly_removedead\cly_removedead.sqf";
	diag_log format ["%1 HGFramework: remove dead initialised", time];
};
if (CODI_hgf_license_windsystem && CODI_hgf_windsystem==1) then
{
	if (isServer) then {execVM "windsystem\serverSync.sqf";};
	if (!isDedicated) then
	{
		execVM "windsystem\bulletWindClient.sqf";
		player addAction [localize "STR_ACT_WINDINFORMATION", "CODI\hgf\other\windinformation.sqf", nil, 0, false, true, "", ""];
	};
	diag_log format ["%1 HGFramework: windsystem initialised", time];
};
_initBoxes = [] execVM "CODI\hgf\init\initBoxes.sqf";
if (CODI_hgf_dayz == 0) then
{
	cutRsc["CODI_hgf_hud", "PLAIN", 0, false];
}
else
{
	cutRsc["CODI_hgf_hudDayZ", "PLAIN", 0, false];
};
diag_log format ["%1 HGFramework: hud initialised", time];

if (CODI_hgf_startHour == -1) then
{
	CODI_hgf_startHour = floor(random 24);
};
if (CODI_hgf_startHour == -2) then//day
{
	CODI_hgf_startHour = floor(random 15)+4;
};
if (CODI_hgf_startHour == -3) then//night
{
	CODI_hgf_startHour = floor(random 9)+19;
	if (CODI_hgf_startHour >= 24) then
	{
		CODI_hgf_startHour = CODI_hgf_startHour - 24;
	}
};
if (CODI_hgf_startHour == -4) then//morning
{
	CODI_hgf_startHour = floor(random 3)+3;
};
if (CODI_hgf_startHour == -5) then//evening
{
	CODI_hgf_startHour = floor(random 3)+19;
};
if (CODI_hgf_startMinute == -1) then
{
	CODI_hgf_startMinute = floor(random 60);
};
setDate[date select 0, date select 1, date select 2, CODI_hgf_startHour, CODI_hgf_startMinute];
diag_log format ["%1 HGFramework: time set to %2:%3", time, CODI_hgf_startHour, CODI_hgf_startMinute];
if (CODI_hgf_civilianPresent == 0) then
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
	CODI_hgf_players = [];
	if (isMultiplayer) then
	{
		{
			if (alive _x && side _x == west) then
			{
				CODI_hgf_players = CODI_hgf_players + [_x];
			};
		}
		forEach playableUnits;
		publicVariable "CODI_hgf_players";
	}
	else
	{
		{
			if (alive _x && side _x == west) then
			{
				CODI_hgf_players = CODI_hgf_players + [_x];
			};
		}
		forEach allUnits;
		publicVariable "CODI_hgf_players";
	};
};

if (isServer) then
{
	waitUntil {!isNil "CODI_hgf_players"};
	{
		_null = [_x] execVM "CODI\hgf\init\initPlayer.sqf";
	}
	forEach CODI_hgf_players;
}
else
{
	if (side player == west) then
	{
		_null = [player] execVM "CODI\hgf\init\initPlayer.sqf";
	};
};

if (isServer) then
{
	_null = [{hint (localize "STR_HINT_TEAMUP");},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
	_initStartBox = [] execVM "CODI\hgf\init\initStartBox.sqf";
	sleep CODI_hgf_groupUpTime;
	waitUntil {scriptDone _initBoxes};
	waitUntil {scriptDone _initStartBox};
	diag_log format ["%1 HGFramework: arena initialised", time];
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
	initStartPlayer = [] execVM "CODI\hgf\init\initStartPlayer.sqf";
	waitUntil {scriptDone initStartPlayer};
	west setFriend[west, 0];
	diag_log format ["%1 HGFramework: players became enemies", time];
	_null = [] execVM "CODI\hgf\other\deleteSpecialMarkers.sqf";
	_null = [] execVM "CODI\hgf\init\initSpecialBoxes.sqf";
	_null = [] execVM "CODI\hgf\init\initVehicles.sqf";
	_null = [] execVM "CODI\hgf\init\initBoats.sqf";
	_null = [] execVM "CODI\hgf\init\initHelis.sqf";
	_null = [] execVM "CODI\hgf\init\initMines.sqf";
	_null = [] execVM "CODI\hgf\init\initMissionEnd.sqf";
	_null = [] execVM "CODI\hgf\init\initStartBoxDespawn.sqf";
	_null = [] execVM "CODI\hgf\init\disableTIEquipment.sqf";
	estimatedTimeLeft (CODI_hgf_deathZoneWarningTime+CODI_hgf_deathZoneDelay);
	if (CODI_hgf_markPlayers == 1) then
	{
		_null = [] execVM "CODI\hgf\init\initMarkPlayers.sqf";
	};
	_null = [{_null = [] execVM "CODI\hgf\init\initDeathzone.sqf"; _null = [] execVM "CODI\hgf\init\initHumanity.sqf"; _null = [1, CODI_hgf_acceleration] execVM "CODI\hgf\init\initTimeAcceleration.sqf"; _null = [] execVM "CODI\hgf\init\initBorders.sqf"; if (CODI_hgf_license_sounds) then {playSound (localize "STR_SOUND_HAPPYHUNGERGAMES");}; if (CODI_hgf_markPlayers == 1) then {_null = [] execVM "CODI\hgf\init\initMarkPlayersClient.sqf";};},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
};

CODI_hgf_init = true;
publicVariable "CODI_hgf_init";
publicVariable "CODI_hgf_mineTimer";