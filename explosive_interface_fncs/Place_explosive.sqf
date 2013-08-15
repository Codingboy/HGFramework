private ["_pos","_unit","_charge","_dir"];
//_array = _this select 3; // for use if used in add action;
_unit = _this select 0;
_charge = _this select 1;
_attachableBombs = ["DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo"];

if (isnil ("fnc_finc_floor")) then
{
	fnc_find_floor = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_find_floor.sqf"
};

if (isnil ("fnc_drop_object")) then
{
	fnc_drop_object = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_drop_object.sqf"
};

if (!((typeOf _charge) in _attachableBombs)) exitwith 
{
	nul = [_charge,_unit] spawn fnc_drop_object;
};

if ((typename placeSurface) == "OBJECT") then
{
	if ((placeSurface iskindof "LandVehicle") or (placeSurface iskindof "Helicopter") or (placeSurface iskindof "Ship") or (placeSurface iskindof "Plane")) then
	{
		_pos =  placeSurface worldToModel (ASLtoATL placePos); // needs AGL.... use below intersect and position calculate to get offset.
		_dir = direction placeSurface;
		
		_cdV = VectorDir _charge;
		_cuV = Vectorup _charge;
		
		_sdV = VectorDir placeSurface;
		_suV = Vectorup placeSurface;
		
		_ndV = [0.001,0.001,0.001];
		_nuV = [0.001,0.001,0.001];
		
			
		for "_i" from 0 to 2 do
		{
			_ndV set [_i,((_cdV select _i) + (_sdV select _i))];

			_nuV set [_i,((_cuV select _i) + (_suV select _i))];
		};
		
		_charge attachTo [placeSurface,_pos];
		_charge setVectorDirandUP [_cdV,_cuV];	
	}
	else
	{
		placeConfirm = true;
		movingExplosive = false;
	};
}
else
{
	nul = [_charge,_unit] spawn fnc_drop_object;
};
	
placeConfirm = true;
movingExplosive = false;

//_unit removeaction (_this select 2); // for use if used in add action;