if (isServer && hg_disableTIEquipment == 0) then
{
	while {true} do
	{
		{
			_x disableTIEquipment true;
		}
		forEach allUnitsUav;
		sleep 5;
	};
};