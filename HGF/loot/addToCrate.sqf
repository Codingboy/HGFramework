_crate = _this select 0;
_obj = _this select 1;
if (isServer) then
{
	_cfg = "";
	switch (true) do
	{
		case (isClass (configFile >> "CfgVehicles" >> _obj)) : {_cfg = "CfgVehicles";};
		case (isClass (configFile >> "CfgMagazines" >> _obj)) : {_cfg = "CfgMagazines";};
		case (isClass (configFile >> "CfgWeapons" >> _obj)) : {_cfg = "CfgWeapons";};
		case (isClass (configFile >> "CfgGlasses" >> _obj)) : {_cfg = "CfgGlasses";};
	};
	_base = _obj;
	_active = (_cfg != "");
	while {_active} do
	{
		if (_base == "ItemCore" || _base == "DetectorCore" || _base == "NVGoggles") then
		{
			_crate addItemCargoGlobal[_obj, 1];
			_active = false;
		};
		if (_base == "RifleCore" || _base == "LauncherCore" || _base == "PistolCore" || _base == "Binocular") then
		{
			_crate addWeaponCargoGlobal[_obj, 1];
			_active = false;
		};
		if (_base == "Bag_Base") then
		{
			_crate addBackpackCargoGlobal[_obj, 1];
			_active = false;
		};
		if (_base == "CA_Magazine") then
		{
			_crate addMagazineCargoGlobal[_obj, 1];
			_active = false;
		};
		_baseLast = inheritsFrom (configFile >> _cfg >> _base);
		_baseLast = toArray str(_baseLast);
		_lastIndex = 0;
		for "_i" from 0 to count _baseLast-1 do
		{
			if (_baseLast select _i == 47) then
			{
				_lastIndex = _i+1;
			};
		};
		_newBase = [];
		for "_i" from 0 to count _baseLast-1-_lastIndex do
		{
			_newBase = _newBase + [_baseLast select (_i+_lastIndex)];
		};
		_baseLast = toString(_newBase);
		if (_baseLast == "Default" || _baseLast == "All" || _baseLast == "") then
		{
			_active = false;
		};
		_base = _baseLast;
	};
};