#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(!isNil"Using") exitwith {};
disableSerialization;

_data = GET_SELECTED_DATA(item_list);
_value = parsenumber(GET_SELECTED_DATA(item_edit));

Using = true;

switch(_data) do{						
	case "fuelFull": 
	{
		if(WSVAR_FuelCan > 0) then{
			closeDialog 0;
			[] spawn pm_fnc_refuel;
		};
	};
	
	case "fuelEmpty":
	{
		titleText["It's empty","PLAIN"];
		sleep 1.5;
		titleText["","PLAIN"];
	};
	
	case "repairkits":
	{
		if(WSVAR_RepairKit > 0) then{
			closeDialog 0;
			[] spawn pm_fnc_repair;
		};
	};
		
	case "canfood": 
	{
		if(WSVAR_CannedFood > 0) then{
			if((vehicle player) == player) then { player playmove "AinvPknlMstpSnonWnonDnon_1"; };
			WSVAR_CannedFood = WSVAR_CannedFood - 1;
			if(WSVAR_FOOD + 60 > 100) then {WSVAR_FOOD = 100;}
			else {WSVAR_FOOD = WSVAR_FOOD + 60;};
			sleep  1.5;
		};
	};
										
	case "water": 
	{
		if(WSVAR_BottleWater > 0) then{
			if((vehicle player) == player) then { player playmove "AinvPknlMstpSnonWnonDnon_1"; };
			WSVAR_BottleWater = WSVAR_BottleWater - 1;
			if(WSVAR_WATER + 60 > 100) then {WSVAR_WATER = 100;}
			else {WSVAR_WATER = WSVAR_WATER + 60;};
			sleep  1.5;
		};
	};
};

Using = nil;

[] call pm_fnc_item_list;