// input data [unit]

params ["_unit"];

_unit addEventHandler ["killed", {

	params["_unit", "_killer"]; 
	_killer addRating 1000; 
	_killer addScore 1;
	{
		if (_x knowsAbout _killer in [3,4]) then{
			_x doTarget _killer;
			_x doFire _killer;
		};
	}foreach units group _unit;
	}];