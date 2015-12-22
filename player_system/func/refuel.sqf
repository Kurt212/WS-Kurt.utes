Using = true;

_vehicle = nearestObjects[player, ["Helicopter", "LandVehicle", "Air", "Motorcycle"], 5] select 0;

if(isNil {_vehicle}) exitwith {titleText["No vehicle within range","PLAIN"];};

_veh_type = getText (ConfigFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");


if(vehicle player != player) exitWith {titleText["You can't refuel the vehicle while in it","PLAIN"]};

WSVAR_FuelCan = WSVAR_FuelCan - 1;

titleText [format["Refueling %1", _veh_type], "PLAIN"];
player playmove "AinvPknlMstpSnonWnonDr_medic5";

sleep 1.5;

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

Using = nil;

WSVAR_EmptyFuelCan = WSVAR_EmptyFuelCan + 1;