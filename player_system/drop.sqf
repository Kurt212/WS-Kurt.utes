
// Powered by TAW_Tonic. Я бы сделал по-другому, но не буду
#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
disableSerialization;

private["_switch","_data","_vehicle_type","_pos","_bomb","_beacon","_temp"];
_switch = _this select 0;
_data = GET_SELECTED_DATA(item_list);

if(_data == "") exitWith {hint "You didn't select anything to drop";};
if(dropActive) exitwith {hint "You're already dropping something";};
if(vehicle player != player) exitwith {hint "You can't use this action while in a vehicle."};
player playmove "AinvPknlMstpSnonWnonDnon_1";
dropActive = true;
sleep 1.5;
_pos = getPosATL player;
//Drops the item and sets values & variables
switch(_data) do 
{
	case "canfood": {if(WSVAR_CannedFood <= 0) exitWith {hint "You don't have that many of the selected item."}; _temp = createVehicle [WS_FOOD, position player,[], 0, "CAN_COLLIDE"]; _temp setPos [(_pos select 0)+1, _pos select 1, _pos select 2]; WSVAR_CannedFood = WSVAR_CannedFood - 1; _temp allowDamage false;};
	case "fuelFull": {if(WSVAR_FuelCan <= 0) exitWith {hint "You don't have that many of the selected item."}; _temp= createVehicle [WS_FUELCAN, position player, [], 0, "CAN_COLLIDE"]; _temp setVariable["fuelcan", 1, true]; _temp setPos _pos; WSVAR_FuelCan = WSVAR_FuelCan - 1; _temp allowDamage false;};
	case "fuelEmpty": {if(WSVAR_EmptyFuelCan <= 0) exitWith {hint "You don't have that many of the selected item."}; _temp= createVehicle [WS_FUELCAN, position player, [], 0, "CAN_COLLIDE"]; _temp setVariable["fuelcan", 0, true]; _temp setPos _pos; WSVAR_EmptyFuelCan = WSVAR_EmptyFuelCan - 1; _temp allowDamage false;};
	case "repairkits": {if(WSVAR_RepairKit <= 0) exitWith {hint "You don't have that many of the selected item."}; _temp = createVehicle [WS_RepairKit, position player, [], 0, "CAN_COLLIDE"]; _temp setPos _pos; WSVAR_RepairKit = WSVAR_RepairKit - 1; _temp allowDamage false;};
	case "water": {if(WSVAR_BOTTLEWATER <= 0) exitWith {hint "You don't have that many of the selected item."}; _temp = createVehicle [WS_WATER, position player, [], 0, "CAN_COLLIDE"]; _temp setPos _pos; WSVAR_BOTTLEWATER = WSVAR_BOTTLEWATER - 1; _temp allowDamage false;};
	//case "medkit": {if(!([false,"medkit",1] call fnc_handleinv)) exitWith {hint "You don't have that many of the selected item."}; _temp = "CZ_VestPouch_EP1" createVehicle (position player); _temp setPos _pos;};
	//case "bombs": {if(!([false,"bomb",1] call fnc_handleinv)) exitWith {hint "You don't have that many of the selected item."}; _bomb = "bomb" createVehicle getPos player; _bomb enableSimulation false; _bomb setVariable["bArmed", false, true]; _bomb setPosATL _pos;};
};
dropActive = false;
				//closeDialog 0;
				
[] call pm_fnc_item_list;