waitUntil {!(isNull (findDisplay 46))};
_array = _this select 3;
_unit = _array select 0;
_charge = _array select 1;
_complexBombs = ["SatchelCharge_Remote_Ammo","APERSMine_Range_Ammo","ATMine_Range_Ammo","APERSBoundingMine_Range_Ammo"];

if (movingExplosive) exitwith {hintsilent "Already moving one"};

_bombName = typeof _charge;
_unitItems = items _unit;
_bHasTools = "ToolKit" in _unitItems;

if ((_bombName in _complexBombs) && (!_bHasTools)) exitwith
{
	hint "You need Tools to move this explosive";
};

if (isnil("fnc_intersect_pos3D")) then 
{
	fnc_intersect_pos3D = compile loadfile "explosive_interface_fncs\fnc_intersect_pos3D.sqf";
};

if (isnil ("fnc_drop_object")) then
{
	fnc_drop_object = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_drop_object.sqf"
};

detach _charge;

placeConfirm = false;

placePos = [0,0,0];

movingExplosive = true;

_keyNames = actionKeysNamesArray "ActionContext";
actKeys = actionKeys "ActionContext";
_actionKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown","(if (((_this select 1) in actKeys) && (!placeConfirm))) then {placeConfirm = true;};"];

while {sleep 0.01;!placeConfirm} do 
{
	_unitPos = getPosATL _unit;
	_intArray = [_unit,2,_charge] call fnc_intersect_pos3D;
	_intPos = _intArray select 0;
	//hint (str(_intPos));
	_intObject = _intArray select 1;
	_dirVector = _intArray select 2;
	_upVector = _intArray select 3;
	if (!isnil ("_intPos")) then 
	{		
		_charge setPosASL _intPos;
		_charge setPos (getPos _charge);
		
		if ((_dirVector distance [0,0,0]) >= 0.2) then
		{
			_charge setVectorDirandUp [_dirVector,_upVector];
		}
		else
		{
			_charge setVectorUP (surfaceNormal _intPos);
			_charge setDir (getDir _unit);
		};
		
		placePos = _intPos;
		placeSurface = _intObject;
	
	}
	else
	{
		hint "error placing explosive";
		placePos = [0,0,0];
		placeSurface = "terrain";
	};
};

nul = [_unit,_charge] execVM "explosive_interface_fncs\Place_explosive.sqf";

(findDisplay 46) displayRemoveEventHandler ["KeyDown",_actionKeyDown];

movingExplosive = false;