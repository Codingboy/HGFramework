
		private ['_unit'];
		_unit = _this select 0;
		
		if (! isDedicated) then 
		{
			if (isnil ("respawnEH")) then
			{
				respawnEH = _unit addEventHandler ["Respawn",{nul = [(_this select 0)] execVM "explosive_interface.sqf";}];
			};
			
			nul = [_unit] spawn 
			{
				_unit = _this select 0;
				waitUntil {!(isNil("checkloop"))};
				while {sleep 5; true} do
				{
					if (scriptDone checkloop) then
					{
						hint "loop crashed, notify admin please :)";
					};
				};
			};
		};
		
		_bombNames = ["DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo","ClaymoreDirectionalMine_Remote_Ammo","APERSMine_Range_Ammo","SLAMDirectionalMine_Wire_Ammo","ATMine_Range_Ammo","APERSBoundingMine_Range_Ammo"];
		
		movingExplosive = false;
		placeConfirm = true;
		
		//debugplacement = [_unit] execVM "explosive_interface_fncs\debug_3dPlace.sqf";
		
		
		checkloop = [_unit] spawn 
		{
			private ["_unit","_dist"];
			_unit = _this select 0;
			
			if (isNil("inView")) then
			{
				inView = [];
			};
			
			while {alive _unit} do
			{
			
				_proximity = (getposATL _unit) nearObjects 3;
					
				if ((count _proximity) > 0) then
				{
					{
						_sPos = worldtoscreen (getpos _x);
						if ((count _sPos) > 0) then
						{
							if ( (((_sPos select 0) > 0.3) && ((_sPos select 0) < 0.7)) && (((_sPos select 1) > 0.2) && ((_sPos select 1) < 0.8)) ) then
							{
								if (!(_x in inView)) then
								{
									inView set [(count inView),_x];
								};
							}
							else
							{
								inView = inView - [_x];
							};
						};
					}foreach _proximity;
				};
				
				{
					_dist = _unit distance _x;
					if (_dist > 3) then
					{
						inView = inView - [_x];
					};
				} foreach inView;
				
				if (placeConfirm) then
				{
					movingExplosive = false;
				}
				else
				{
					movingExplosive = true;
				};
				sleep 0.3;
			};
		};
		
		
		
		
		
		
		while {alive _unit} do {
			
			waitUntil {!(isnil("inView"))};
			waitUntil {!movingExplosive};
			
			{	
			
				if (((typeOf _x) in _bombNames) or (_x iskindof "Grenade")) then 
				{
					_c4 = nil;
					
					while {isnil("_c4")} do
					{
						_sel = (inView find _x);
						
						while {_sel < 0} do
						{
							_sel = (inView find _x);
						};
						_c4 = inView select _sel;     // makes sure there are no mishaps
					};
					
					_bombName = typeof _c4;
					_actionNumber = (_bombNames find _bombName);

					_actionName =
					switch (_actionNumber) do
					{
						case 0 : {"Move C4"};
						case 1 : {"Move Satchel"};
						case 2 : {"Move Claymore"};
						case 3 : {"Move APERS Mine"};
						case 4 : {"Move M6 SLAM"};
						case 5 : {"Move AT Mine"};
						case 6 : {"Move APERS Bouncing Mine"};
						default	{format ["Move %1",_bombName];};
					};
					
					_idact = -1;
					if (!movingExplosive) then
					{
						_idact = _unit addaction [_actionName,"explosive_interface_fncs\Move_explosive.sqf",[_unit,_c4],10,false,true];
					};
						
					waituntil {!(_c4 in inView)};
					_unit removeaction _idact;
					
				};

			} foreach inView;

		sleep 0.5;
		
		//hint "cycling";

		};

	

