Using = true;

#define DELAY 0.5

_vehicle = nearestObjects[player, ["Helicopter", "LandVehicle", "Air", "Motorcycle"], 5] select 0;

_veh_type = getText (ConfigFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

if(vehicle player != player) exitWith {titleText["You can't repair the vehicle while in it","PLAIN"]};

if(isNil {_vehicle}) exitwith {titleText["No vehicle within range","PLAIN"];};

player playmove "AinvPknlMstpSnonWnonDr_medic5";
titleText [format["Repairing %1", _veh_type], "PLAIN"];
WSVAR_REPAIRKIT = WSVAR_REPAIRKIT - 1;

_count = 0;
while{_count <= 14} do
{
	if((player distance _vehicle > 4) || (vehicle player != player)) exitWith{};
	sleep DELAY;
	_count = _count + DELAY;
};

Using = false;

if(_count <= 14) exitWith {
	titleText["Cancelled","PLAIN", 1.5];
};

_vehicle setdamage 0;
titleText["","PLAIN"];

[] execVM "player_system\item_list.sqf";
