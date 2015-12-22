#include "mission_type.sqf"

#define Mission_Number 18 // поменять, если менять кол-во маркеров

//uisleep (random 5 * 60); // Подождем некоторое время с начала миссии

createNewMission = compile preprocessfile "core\server\missions\createNewMission.sqf";

Misson_Markers = [];

for "_i" from 0 to Mission_Number do{ 
	Misson_Markers pushback format["Mission_%1", _i];
};

missions_active = [objNull, objNull, objNull];
publicVariable 'missions_active';

// mission monitor
[] spawn{ 
	while{true} do{
		{
			
			if(typename _x != "SCALAR") then{
				[_forEachIndex] call createNewMission;
			};
			uisleep (round random 5) * 60;
		}foreach missions_active;
	};
};

