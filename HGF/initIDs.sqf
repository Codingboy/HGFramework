
private ["_coding","_ids"];
_coding = "76561197996296785";
_ids = [_coding];
{
	if (getPlayerUID player == _x) then
	{
		//player addAction["AH-99", {"B_Heli_Attack_01_F" createVehicle (getPos player);}];
	};
}
forEach _ids;