private["_fps","_acceleration","_year","_month","_day","_hour","_minute","_second","_sync","_syncF","_diff","_lastExecution","_sleepTime"];
_fps = _this select 0;
_acceleration = _this select 1;
_syncF = 1;//frames until sync
_sync = 0;
_year = date select 0;
_month = date select 1;
_day = date select 2;
_hour = date select 3;
_minute = date select 4;
_second = 0;
_lastExecution = serverTime;
_sleepTime = 0;
while {true} do
{
	if (isServer) then
	{
		_second = _second + (_acceleration/_fps);
		while {_second > 59} do
		{
			_minute = _minute + 1;
			_second = _second - 60;
		};
		while {_minute > 59} do
		{
			_hour = _hour + 1;
			_minute = _minute - 60;
		};
		if (_hour > 23) then
		{
			_hour = _hour - 24;
		};
		_sync = _sync + 1;
		hg_actualTime = [_year, _month, _day, _hour, _minute, _second];
		if (_sync == _syncF) then
		{
			publicVariable "hg_actualTime";
			_sync = 0;
		};
	};
	waitUntil {!isNil "hg_actualTime"};
	setDate[hg_actualTime select 0, hg_actualTime select 1, hg_actualTime select 2, hg_actualTime select 3, hg_actualTime select 4];
	_diff = serverTime - _lastExecution;
	if (_diff < (1/_fps)) then
	{
		sleep ((1/_fps) - _diff);
	};
	_lastExecution = serverTime;
};