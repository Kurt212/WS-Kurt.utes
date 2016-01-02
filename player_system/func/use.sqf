//не знаю как заинклудить ориганальный файл player_sys.sqf
//поэтому так
#define playersys_DIALOG 2001
#define money_text 2002
#define water_text 2003
#define food_text 2004
#define item_list 2005
#define player_list 2006
#define money_value 2007
#define carry_weight 2009
#define item_edit 2010
//ага

if(isNil"Using") then {Using = false;};
disableSerialization;

params ["_ctrl"];
_Dialog = ctrlParent _ctrl;
_item_list = _Dialog displayCtrl item_list;

_data = (_item_list lbData(lbCurSel _item_list));

if(_data == "") exitWith {hint "You didn't select anything to drop";};
if(Using) exitwith {hint "You're already using something";};


Using = true;

switch(_data) do{						
	case "fuelFull": 
	{
		if(WSVAR_FuelCan > 0) then{
			[] execVM "player_system\func\refuel.sqf";
		};
	};

	case "repairkits":
	{
		if(WSVAR_RepairKit > 0) then{
			[] execVM "player_system\func\repair.sqf";
		};
	};
	
	case "fuelEmpty":
	{
		titleText["It's empty","PLAIN"];
		sleep 1.5;
		titleText["","PLAIN"];
	};
		
	case "canfood": 
	{
		if(WSVAR_CannedFood > 0) then{
			if((vehicle player) == player) then { player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon"; };
			WSVAR_CannedFood = WSVAR_CannedFood - 1;
			if(WSVAR_FOOD + 60 > 100) then {WSVAR_FOOD = 100;}
			else {WSVAR_FOOD = WSVAR_FOOD + 60;};
			sleep  1.5;
		};
	};
										
	case "water": 
	{
		if(WSVAR_BottleWater > 0) then{
			if((vehicle player) == player) then { player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon"; };
			WSVAR_BottleWater = WSVAR_BottleWater - 1;
			if(WSVAR_WATER + 60 > 100) then {WSVAR_WATER = 100;}
			else {WSVAR_WATER = WSVAR_WATER + 60;};
			sleep  1.5;
		};
	};
};

Using = false;

[] execVM "player_system\item_list.sqf";