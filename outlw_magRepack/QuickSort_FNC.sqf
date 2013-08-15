
/*
	|----
		- Author: Andrew Barron (rewritten by Outlawled)
	
		- This is a rewritten version of Andrew Barron's "Sort Numbers" function which uses the Quick Sort algorithm.	
		- This version of the function gives the user the ability to sort the given array descendingly or ascendingly.
		- The passed array is modified by reference.
	
		- Parameters:																														
			- _this select 0: Array of numbers to be sorted.																					
			- _this select 1: String to dictate ascending or descending sort. (Optional, default is ascending. "Descend" for descending.)
	
		- Ascending call examples:
			- [[5,2,6,7,2]] call outlw_fnc_QuickSort;
				- Returns: [2,2,5,6,7]
	
		- Descending call example:
			- [[5,2,6,7,2], "descend"] call outlw_fnc_QuickSort;
				- Returns: [7,6,5,2,2]
	|----
*/

private ["_disArray", "_sortDirection", "_sort"];

_disArray = _this select 0;

_sortDirection =
{
	while {(_sorted select _up) < _pivot} do {_up = _up + 1};
	while {(_sorted select _down) > _pivot} do {_down = _down - 1};
};

if (_this select 1 == "descend") then
{
	_sortDirection =
	{
		while {(_sorted select _up) > _pivot} do {_up = _up + 1};
		while {(_sorted select _down) < _pivot} do {_down = _down - 1};
	};
};

_sort =
{	
	private ["_sorted", "_low", "_high", "_swap", "_up", "_down", "_pivot"];
	
	_sorted = _this select 0;
	_low = _this select 1;
	_high = _this select 2;
	_swap = nil;
	_up = _low;
	_down = _high;
	_pivot = _sorted select ((_low + _high) / 2);

	while {isnil "_swap" || _up <= _down} do
	{
		call _sortDirection;

		if (_up <= _down) then
		{
			_swap = _sorted select _up;
			_sorted set [_up, _sorted select _down];
			_sorted set [_down, _swap];

			_up = _up + 1; _down = _down - 1;
		};
	};

	if (_low < _down) then {[_sorted, _low, _down] call _sort};
	if (_up < _high) then {[_sorted, _up, _high] call _sort};
	_sorted;
};

[_disArray, 0, (count _disArray) - 1] call _sort;

