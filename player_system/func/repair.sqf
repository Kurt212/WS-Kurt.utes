Using = true;

_vehicle = nearestObjects[player, ["Helicopter", "LandVehicle", "Air", "Motorcycle"], 5] select 0;

_veh_type = getText (ConfigFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

if(vehicle player != player) exitWith {titleText["You can't repair the vehicle while in it","PLAIN"]};

if(isNil {_vehicle}) exitwith {titleText["No vehicle within range","PLAIN"];};

player playmove "AinvPknlMstpSnonWnonDnon_1";
titleText [format["Repairing %1", _veh_type], "PLAIN"];


sleep 1.5;



_vehicle setdamage 0.1;


titleText["","PLAIN"];

WSVAR_REPAIRKIT = WSVAR_REPAIRKIT - 1;


Using = nil;