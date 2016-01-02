Using = true;

#define DELAY 0.5

_vehicle = nearestObjects[player, ["Helicopter", "LandVehicle", "Air", "Motorcycle"], 4] select 0;

if(isNil {_vehicle}) exitwith {titleText["No vehicle within range","PLAIN"];};
if(vehicle player != player) exitWith {titleText["You can't refuel the vehicle while in it","PLAIN"]};


_veh_type = getText (ConfigFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");



WSVAR_FuelCan = WSVAR_FuelCan - 1;

titleText [format["Refueling %1", _veh_type], "PLAIN"];
player playmove "AinvPknlMstpSnonWnonDr_medic5";

_count = 0;
while{_count <= 14} do
{
	if((player distance _vehicle > 4) || (vehicle player != player)) exitWith{};
	sleep DELAY;
	_count = _count + DELAY;
};

Using = false;

if(_count <= 14) exitWith {
	titleText["Cancelled","PLAIN"];
};

titleText["","PLAIN"];

call {
	if(_vehicle isKindOf "Car") exitWith {
		_vehicle setFuel ((Fuel _vehicle) + 0.30);
	};
	if(_vehicle isKindOf "TANK") exitWith{
		_vehicle setFuel ((Fuel _vehicle) + 0.15);
	};
	if(_vehicle isKindOf "AIR") exitWith{
		_vehicle setFuel ((Fuel _vehicle) + 0.1);
	};
};

WSVAR_EmptyFuelCan = WSVAR_EmptyFuelCan + 1;

[] execVM "player_system\item_list.sqf";