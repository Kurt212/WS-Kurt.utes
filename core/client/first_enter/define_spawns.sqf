Spawn_Markers = [];

for "_i" from 0 to 100 do{
	Spawn_Markers pushback format["Spawn_%1", _i];
};

waituntil{!isNil"towns"};


{
	private["_trigger"];
	_p = getMarkerPos _x;
	_distance = 10000;
	{
		if((_p distance _x) < _distance) then {_distance = _p distance _x; _trigger = _x;};
	}foreach towns;
	_markers = _trigger getVariable "Markers";
	if(isNil"_markers")  then {_markers = []; _trigger setVariable ["Markers", _markers];};
	_markers pushback _x;
	_trigger setVariable ["Markers", _markers];
}foreach Spawn_Markers;
