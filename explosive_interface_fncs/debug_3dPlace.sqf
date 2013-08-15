_unit = _this select 0;
waituntil {!(isNil("movingExplosive"))};
waituntil {!(isNil("placeConfirm"))};
while {alive _unit} do
{

hint format ["moving == %1 \n placed == %2",movingExplosive,placeConfirm];
sleep 1;
};