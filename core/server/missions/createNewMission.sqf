#include "mission_type.sqf"

params ["_index"];

_Missions = [
			"missionSpecialTruck",
			"missionArmoredVehicle"
			];

_position = getMarkerPos (Misson_Markers call BIS_fnc_selectRandom);

[_position, _index] execVM format["core\server\missions\%1.sqf", _Missions call BIS_fnc_selectRandom];

