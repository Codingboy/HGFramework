// XEH_preClientInit
// (C) 2012 Ryan Schultz. See LICENSE.

ADDON = false;

/////////////////////////////////////////////////////////////////////////////////

// Define values for positioning the foldmap.
#define tao_foldmap_leftX  0.02
#define tao_foldmap_rightX  0.66

tao_foldmap_mapPosXOffset = tao_foldmap_leftX;
tao_foldmap_mapPosYOffset = 0.265;
tao_foldmap_mapBackPosXOffset = tao_foldmap_mapPosXOffset - 0.006;
tao_foldmap_mapBackPosYOffset = tao_foldmap_mapPosYOffset - 0.0075;

#define tao_foldmap_mapPosX (safezoneX + tao_foldmap_mapPosXOffset * safezoneW)
#define tao_foldmap_mapPosY (safezoneY + tao_foldmap_mapPosYOffset * safezoneW)
#define tao_foldmap_mapBackPosX  (safezoneX + tao_foldmap_mapBackPosXOffset * safezoneW)
#define tao_foldmap_mapBackPosY  (safezoneY + tao_foldmap_mapBackPosYOffset * safezoneW)

// Draw event handler for foldmap.
tao_foldmap_drawUpdate = {
	// Draw location of player if in Vet/Expert and has a GPS
	if (("ItemGPS" in assignedItems player) && !cadetMode) then {
		_pos = getPos player;
		((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) drawIcon [getText(configFile >> "CfgMarkers" >> "mil_arrow2" >> "icon"), [0.01, 0.01, 0.91, 0.7], _pos, 15, 21, direction vehicle player, "", false];
	};
	
	// Off-map check: if the player has gotten off the map for whatever reason (teleport, off-map area), re-center the map
	if (ctrlCommitted ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) && (tao_foldmap_scrollFinished || tao_foldmap_oldPos2 distance getPos player > 100)) then {
		_wts = ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapWorldToScreen getPos player;
		_upperLeftCorner = [tao_foldmap_mapPosX, tao_foldmap_mapPosY];
		_lowerRightCorner = [tao_foldmap_mapPosX + (safezoneW * 0.38), tao_foldmap_mapPosY + (safezoneH * 0.75)];
		
		if (_wts select 0 < (_upperLeftCorner select 0) - 0.2 || _wts select 1 < (_upperLeftCorner select 1) - 0.2 || _wts select 0 > (_lowerRightCorner select 0) + 0.2 || _wts select 1 > (_lowerRightCorner select 1) + 0.2) then {
			tao_foldmap_centerpos = getpos player;
			tao_foldmap_oldPos2 = getPos player;
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapAnimAdd [0, tao_foldmap_mapScale, [tao_foldmap_centerpos select 0, tao_foldmap_centerpos select 1, 0]];
			ctrlMapAnimCommit ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25);
			//player sidechat 'offmap recenter';
		};
	};
	
	// Don't try to page until paging values are defined (map must have slid into place).
	if (!isNil "tao_foldmap_xPagingD" && tao_foldmap_scrollFinished) then {
		// Flip to next 'page' as we pass off the map.
		_deltaX = (tao_foldmap_centerpos select 0) - (getpos player select 0);
		if (abs(_deltaX) > tao_foldmap_xPagingD + 10) then {
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapAnimAdd [0, tao_foldmap_mapScale, [(getpos player select 0) - _deltaX, tao_foldmap_centerpos select 1, 0]];
			tao_foldmap_centerpos set [0, abs((getpos player select 0) - _deltaX)];
			ctrlMapAnimCommit ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25);
			//player sidechat 'foldmap deltax';
		};
		_deltaY = (tao_foldmap_centerpos select 1) - (getpos player select 1);
		if (abs(_deltaY) > tao_foldmap_yPagingD + 10) then {
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapAnimAdd [0, tao_foldmap_mapScale, [tao_foldmap_centerpos select 0, (getpos player select 1) -_deltaY, 0]];
			tao_foldmap_centerpos set [1, abs((getpos player select 1) -_deltaY)];
			ctrlMapAnimCommit ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25);
			//player sidechat 'foldmap deltay';
		};
	};
	
	// Update pos for recenter checking
	tao_foldmap_oldPos = getpos player;
	
	// Darkening code. Based on ShackTac Map Brightness by zx64 & Dslyecxi
	if (!isNil "tao_foldmap_xPagingD") then {
		_alpha = 0.7 min abs(sunOrMoon - 1);
		_rectPos = ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapScreenToWorld [tao_foldmap_mapPosX, tao_foldmap_mapPosY];
		
		// Draw a dark rectangle covering the map.
		((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) drawRectangle [_rectPos, tao_foldmap_xPagingD * 2,tao_foldmap_yPagingD * 2, 0, [0, 0, 0, _alpha], "#(rgb,1,1,1)color(0,0,0,1)"];
	};
};

// Dialog init function for foldmap.
tao_foldmap_initDialog = {
	// Scroll isn't finished yet.
	tao_foldmap_scrollFinished = false;
	
	// On first run, get the center pos. This is used for all paging thereafter.
	if (isNil "tao_foldmap_centerPos") then {
		tao_foldmap_centerPos = getpos player;
	};
	
	// Off-map check: if the player passed off the map while it was closed, recenter it (can't fold neatly)
	if (!isNil "tao_foldmap_xPagingD") then {
		_dX = abs ((tao_foldmap_centerPos select 0) - (getpos player select 0));
		_dY = abs ((tao_foldmap_centerPos select 0) - (getpos player select 0));
		
		// Little fudge factor here to avoid opening on the edge of the map, which isn't very helpful.
		if (_dX + 80 > tao_foldmap_xPagingD || _dY + 80 > tao_foldmap_yPagingD) then {
			tao_foldmap_centerpos = getpos player;
			//player sidechat 'passed off while map closed';
		};
	};
	
	// Center map on centering pos
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapAnimAdd [0, tao_foldmap_mapScale, tao_foldmap_centerPos];
	ctrlMapAnimCommit ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25);
	
	// Get player position for auto-recenter (teleport fix)
	tao_foldmap_oldPos = getPos player;
	tao_foldmap_oldPos2 = getPos player;
	
	// Place everything in position to be scrolled.
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlSetPosition [tao_foldmap_mapBackPosX, safezoneY + 1 * safezoneW];
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlCommit 0;
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlSetPosition [tao_foldmap_mapPosX, safezoneY + 1 * safezoneW];
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlCommit 0;
	
	// Add draw handler to page the map and update the player marker.
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlAddEventHandler ["Draw", "[] call tao_foldmap_drawUpdate"];
	
};

// Loop which runs while foldmap is open. Separate from draw EH.
tao_foldMap_drawMapLoop = {
	// Scroll the map up from the bottom of the screen.
	9232 cutRsc ["tao_foldmap","PLAIN",0];
	
	// Darken the background sheet before it pops up.
	_darkFactor = (0.6 min (abs(sunOrMoon - 1)));
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlSetBackgroundColor [1 - _darkFactor, 1 - _darkFactor, 0.87 - _darkFactor / 1.08, 0.95];
	
	// Pop up map and background.
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlSetPosition [tao_foldmap_mapBackPosX, tao_foldmap_mapBackPosY];
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlCommit 0.35;
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlSetPosition [tao_foldmap_mapPosX, tao_foldmap_mapPosY];
	((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlCommit 0.35;
	
	// Wait til map pops up
	waituntil {ctrlCommitted ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) };
	sleep 0.1;
	tao_foldmap_scrollFinished = true;
	
	// Are we using ACE?
	_ACEenabled = (isClass (configFile >> "CfgPatches" >> "ACE_Main"));
	
	// Get the delta number for map paging updates for this particular world's scale (why are some worlds different, I mean seriously why...?)
	if (isNil "tao_foldmap_xPagingD") then {
		// Upper left corner
		_upperLeftCornerPos = ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapScreenToWorld [tao_foldmap_mapPosX, tao_foldmap_mapPosY];
		tao_foldmap_xPagingD = abs((_upperLeftCornerPos select 0) - (tao_foldmap_centerPos select 0));
		tao_foldmap_yPagingD = abs((_upperLeftCornerPos select 1) - (tao_foldmap_centerPos select 1));
	};
	
	tao_foldmap_drawingLoop = true;
	while {tao_foldmap_open && !visibleMap} do {
		sleep 0.2;
		
		// Don't show map outside of usual cameras, when dead, when in debug, or when in TaoDamage agony state
		_check = (cameraView in ["INTERNAL","EXTERNAL","GUNNER"]) && alive player && isNil "BIS_DEBUG_CAM";
	
		// Close map if any of the check fails.
		if !(_check) then {
			tao_foldmap_open = false;
		};
		
		// Auto-recenter needed check -- if player has moved more than 100m since last redaw, recenter the map
		if ((tao_foldmap_oldPos2 distance getPos player) > 100) then {
			tao_foldmap_centerpos = getpos player;
			tao_foldmap_oldPos2 = getPos player;
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapAnimAdd [0, tao_foldmap_mapScale, [tao_foldmap_centerpos select 0, tao_foldmap_centerpos select 1, 0]];
			ctrlMapAnimCommit ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25);
		};
	};
	tao_foldmap_drawingLoop = false;
	
	// Starting a new scroll.
	tao_foldmap_scrollFinished = false;
	
	// Scroll the map off the screen.
	[] spawn {
		((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlSetPosition [tao_foldmap_mapBackPosX, safezoneY + 1 * safezoneW];
		((uiNamespace getVariable "Tao_FoldMap") displayCtrl 23) ctrlCommit 0.35;
		((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlSetPosition [tao_foldmap_mapPosX, safezoneY + 1 * safezoneW];
		((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlCommit 0.35;
		sleep 0.5;
		if (!tao_foldmap_open) then {
			9232 cutText ["", "PLAIN"];
		};
	};
};

// Key handler for opening, closing, and moving tap.
tao_foldMap_keyHandler = {
	private["_handled", "_display", "_ctrl", "_dikCode", "_shift", "_alt"];
	_display = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	  
	_handled = false;
	
	// Toggle foldmap on Shift-M
	if (_shift && _dikCode in (actionKeys "ShowMap") && !visibleMap && ("ItemMap" in assignedItems player)) then {
		// Initialize variable if never set.
		if (isNil "tao_foldmap_open") then {tao_foldmap_open = false};
	
		// Are we using ACE?
		_ACEenabled = (isClass (configFile >> "CfgPatches" >> "ACE_Main"));
	
		// Don't show map outside of usual cameras, when dead, when in debug, or when in TaoDamage agony state
		_check = (cameraView in ["INTERNAL","EXTERNAL","GUNNER"]) && alive player && isNil "BIS_DEBUG_CAM";
		
		// If using ACE, also don't show when knocked out or unconscious
		if (_ACEenabled) then {
			_check = (cameraView in ["INTERNAL","EXTERNAL","GUNNER"]) && alive player && isNil "BIS_DEBUG_CAM" && !(player getVariable ['ace_fx_knockedOut', false]) && !([player] call ace_sys_wounds_fnc_isUncon);
		};
	
		if (_check && !tao_foldmap_open) then {
			tao_foldmap_open = true;
			[] spawn tao_foldmap_drawMapLoop;
		} else {
			tao_foldmap_open = false;
		};
		_handled = true;
	};
	
	// If opening gear, close foldmap
	if (_dikCode in (actionKeys "Gear")) then {
		tao_foldmap_open = false;
		_handled = false;
	};

	// Change map position on shift-ctrl-left arrow and shift-ctrl-right arrow when foldmap is open
	if (_shift && _dikCode == 203) then {
		[] spawn {
			tao_foldmap_open = false;
			waituntil {!tao_foldmap_drawingLoop};
			// Close map
			9232 cutText ["", "PLAIN"];
			// Set new position
			tao_foldmap_mapPosXOffset = tao_foldmap_leftX;
			tao_foldmap_mapBackPosXOffset = tao_foldmap_mapPosXOffset - 0.006;
			// Reopen it
			tao_foldmap_open = true;
			[] spawn tao_foldmap_drawMapLoop;
		};
		_handled = true;
	};
	if (_shift && _dikCode == 205 && tao_foldmap_open) then {
		[] spawn {
			tao_foldmap_open = false;
			waituntil {!tao_foldmap_drawingLoop};
			// Close map
			9232 cutText ["", "PLAIN"];
			// Set new position
			tao_foldmap_mapPosXOffset = tao_foldmap_rightX;
			tao_foldmap_mapBackPosXOffset = tao_foldmap_mapPosXOffset - 0.006;
			// Reopen it
			tao_foldmap_open = true;
			[] spawn tao_foldmap_drawMapLoop;
		};
		_handled = true;
	};
	
	// Shift-Up Arrow 'refolds' the map to recenter it. Poor man's GPS I guess but whatever, I don't really care
	// about people who are playing ArmA for landnav training.
	if (_shift && _dikCode == 200 && tao_foldmap_open) then {
		[] spawn {
			tao_foldmap_centerpos = getpos player;
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25) ctrlMapAnimAdd [0, tao_foldmap_mapScale, [tao_foldmap_centerpos select 0, tao_foldmap_centerpos select 1, 0]];
			ctrlMapAnimCommit ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 25);
		};
		_handled = true;
	};
	
	_handled;
};

// Fired EH to close the foldmap.
tao_foldmap_firedEH = {
	if ((_this select 0) == player) then {
		tao_foldmap_open = false;
	};
};


/////////////////////////////////////////////////////////////////////////////////

// Add key handler. (Spawn and wait required for A3 CBA. Seems to run this before the display is up otherwise. This wasn't true for A2. But I used CBA_fnc_addDisplayHandler then, so I'm not sure.)
[] spawn {
	waituntil {!isNull (findDisplay 46) && !isDedicated};
	sleep 10;
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call tao_foldMap_keyHandler"];
};

/////////////////////////////////////////////////////////////////////////////////

ADDON = true; // Init done.