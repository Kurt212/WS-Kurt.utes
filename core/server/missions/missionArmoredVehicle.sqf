#include "mission_type.sqf"

#define myType ArmoredVehicle
#define myName ('Capture Armored Vehicle')

//input Data : positon


_vehicleType = WSCFG_VEHICLES_SPECIAL call BIS_fnc_selectRandom;

params ["_position", "_index"];

missions_active set[_index, myType];

_multiplier = if(round random 1 == 0) then {-1} else {1};

_position = [(_position select 0) + (random 25)*_multiplier, (_position select 1) + (random 25)*_multiplier];

_vehicle = createvehicle [_vehicleType, _position, [], 0, "NONE"];

clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
_vehicle setdir (random 360);
_vehicle setfuel 0;
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];

[_vehicle] spawn ws_fnc_putWeaponInVehicle;

_wp_pos1 = [(_position select 0) + _multiplier*(random 10)+5, _position select 1];
_wp_pos2 = [_position select 0, (_position select 1) + _multiplier*(random 10)+5];
_wp_pos3 = [(_position select 0) + _multiplier*(random 10)+5, (_position select 1) + _multiplier*(random 10)+5];
_wp_pos4 = [(_position select 0) - _multiplier*(random 10)+5, (_position select 1) - _multiplier*(random 10)+5];

_grp = createGroup civilian;
"rhs_g_Soldier_AR_F" createunit [_position, _grp, "", 0.7, "corporal"];
"rhs_g_Soldier_SL_F" createunit [_position, _grp];
"rhs_g_Soldier_TL_F" createunit [_position, _grp];
"rhs_g_Soldier_TL_F" createunit [_position, _grp];
"rhs_g_Soldier_F"  createunit [_position, _grp];
 
{
	[_x] execVM "core\server\missions\botMonitor.sqf";
}foreach units _grp; 
 
_grp addWaypoint [_wp_pos1, 0];
_grp addWaypoint [_wp_pos2, 0];
_grp addWaypoint [_wp_pos3, 0];
_grp addWaypoint [_wp_pos4, 0];
_wp = _grp addWaypoint [_wp_pos4, 0];
_wp setWaypointType "CYCLE";

_grp setSpeedMode "LIMITED";
_grp setBehaviour "AWARE";

_marker = createMarker [format["Mission%1", random 1000], _position];  
_marker setMarkerType "mil_destroy";  
_marker setMarkerColor "ColorRed";  
_marker setMarkerText myName;    
_marker setMarkerSize [1,1];

_hint_info = parsetext format["<t size = '2' underline = 'true' color = '#FF0000'>Mission</t><br/><t align = 'left'>New Mission %1 has been spotted.</t>", myName];
_hint_info remoteExec ["hint"]; 

waituntil{sleep 5; {alive _x} count units _grp == 0 and (fuel _vehicle > 0)};

_hint_info = parsetext format["<t size = '2' underline = 'true' color = '#FF0000'>Mission Done!</t><br/><t align = 'left'>Someone has done the mission %1</t>", myName];
_hint_info remoteExec ["hint"]; 

deleteMarker _marker;

missions_active set[_index, objNull];

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];
