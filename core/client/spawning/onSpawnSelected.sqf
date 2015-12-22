private["_text", "_town"];

player hideobject false;

_ctrl = _this select 0;

if(isNull _ctrl) then{
	_town = towns call BIS_fnc_selectRandom;
}
else{
	_text = CtrlText _ctrl;
	{
		if(_text == (_x select 1)) exitwith {_town = _x select 0;};
	}foreach towns_free;
};

_arr_markers = _town getVariable "Markers";
_marker = _arr_markers call BIS_fnc_selectRandom;
_spawn = getMarkerPos _marker;

SpawnedTownInfo = _town;
publicVariableServer "SpawnedTownInfo";

player setpos _spawn;
player setPos [getPos player select 0, getPos player select 1, getPos player select 2];

respawnDialogActive = nil;