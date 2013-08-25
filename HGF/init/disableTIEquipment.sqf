if (isServer && hg_disableTIEquipment == 0) then
{
	diag_log format ["%1 HGFramework: TIEquipment initialised", time];
	while {true} do
	{
		{
			_x disableTIEquipment true;
		}
		forEach (allUnitsUav + vehicles);
		sleep 5;
	};
};