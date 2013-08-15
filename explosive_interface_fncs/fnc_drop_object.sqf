//nul = [_charge,_unit] spawn

		private ["_pos","_unit","_charge","_object","_inc","_floorPosArray","_floorPos"];
		_charge = _this select 0;
		_pos = getPosASL _charge;
		_unit = _this select 1;
		_buryableBombs = ["APERSMine_Range_Ammo","ATMine_Range_Ammo","APERSBoundingMine_Range_Ammo"] ;
		
		if (isnil ("fnc_finc_floor")) then
		{
			fnc_find_floor = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_find_floor.sqf"
		};

		_floorPosArray = [_charge,_unit] call fnc_find_floor;
		_floorPos = _floorPosArray select 0;
		_object = _floorPosArray select 1;

		_distToFloor = (_pos select 2) - (_floorPos select 2);
		_bounceDist = _distToFloor / 5;
		_initBounceDist = _bounceDist;
		
		_inc = 0.01;
			
		while {_distToFloor > 0.01} do
		{
			_pos set [2,((_pos select 2) - _inc)];
			_distToFloor = _distToFloor - _inc;
			
			_charge setPosASL _pos;
			_charge setPos (getPos _charge);
			
			_inc = _inc * 1.3;
			if (_inc > 3.5) then
			{
				_inc = 3.5;
			};
			sleep 0.01;
		};
		
		if (_distToFloor < 0) then
		{
			_overShoot = abs _distToFloor;
			_pos set [2,(_pos select 2) + _overShoot];
			
			_charge setPosASL _pos;
			_charge setPos (getPos _charge);
			
			_distToFloor = 0.01;
		};

		if (!isNull _object) then
		{
			if ((_object iskindof "LandVehicle") or (_object iskindof "Helicopter") or (_object iskindof "Ship") or (_object iskindof "Plane")) then
			{
				_wtmPos =  _object worldToModel (ASLtoATL _pos); // needs AGL.... use below intersect and position calculate to get offset.
				_charge attachTo [_object,_wtmPos];
		
				_cdV = VectorDir _charge;
				_cuV = Vectorup _charge;
		
				_sdV = VectorDir _object;
				_suV = Vectorup _object;
		
				_ndV = [0,0,0];
				_nuV = [0,0,0];
		
				for "_i" from 0 to 2 do
				{
					_ndV set [_i,((_cdV select _i) - (_sdV select _i))];

					_nuV set [_i,((_cuV select _i) - (_suV select _i))];
				};
		
				_charge setVectorDirandUP [_ndV,_nuV];
			}
			else
			{
				placeConfirm = true;
				movingExplosive = false;
				_charge setVectorUp (surfaceNormal _pos);
				
			};
		}
		else
		{
			
			_bombName = typeof _charge;
			if (_bombName in _buryableBombs) then
			{
				_boundingBox = boundingBoxReal _charge;
				_min = _boundingBox select 0;
				_max = _boundingBox select 1;
				_objHeight = (_max select 2) - (_min select 2);
				_pos set [2,(_pos select 2) - ((_objHeight / 6) * 5)];
				_charge setPosASL _pos;
				_charge setPos (getPos _charge);
			};
		};
		
		