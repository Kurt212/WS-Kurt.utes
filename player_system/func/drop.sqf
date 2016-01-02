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

params ["_key", "_ctrl"];

/*
	keys:
	1 - дроп денег
	2 - дроп предмета
*/


disableSerialization;

switch(_key) do
{
	case 1:
	{

		if(isNil {dropActive}) then {dropActive = false};
		if(isNil {MoneyInUse}) then {MoneyInUse = false};
		if(isnil {WSVAR_MONEY}) then {WSVAR_MONEY = 0;};


		if(MoneyInUse) exitwith {hint "You are already dropping money.";};

		_Dialog = ctrlParent _ctrl;
		_moneytext = _Dialog displayCtrl money_text;
		_MVC = _Dialog displayCtrl money_value;

		_money = parsenumber (_MVC lbData(lbCurSel _MVC));

		if((WSVAR_MONEY < _money) OR (WSVAR_MONEY <= 0)) exitwith {hint format["You don't have $%1 to drop", _money];};

		MoneyInUse = true;
		dropActive = true;
		_pos = getPosATL player;
		player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
		sleep 1.5;
		_cash = createVehicle [WS_MONEY, position player, [], 0, "CAN_COLLIDE"]; 
		_cash setPos _pos;
		_cash setVariable ["money", _money, true];
		WSVAR_MONEY = WSVAR_MONEY - _money;
		MoneyInUse = false;
		dropActive = false;
		_moneytext ctrlSetText format["%1", WSVAR_MONEY];
	};

	case 2:
	{
		if(isNil {dropActive}) then {dropActive = false};
		_Dialog = ctrlParent _ctrl;
		_item_list = _Dialog displayCtrl item_list;

		_data = (_item_list lbData(lbCurSel _item_list));


		if(_data == "") exitWith {hint "You didn't select anything to drop";};
		if(dropActive) exitwith {hint "You're already dropping something";};
		if(vehicle player != player) exitwith {hint "You can't use this action while in a vehicle."};


		// обработка дропа
		switch(_data) do 
		{
			case "canfood": {
				if(WSVAR_CannedFood <= 0) exitWith {hint "You don't have that many of the selected item."}; 
				dropActive = true;
				player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
				sleep 1.5;
				_pos = getPosATL player;
				_temp = createVehicle [WS_FOOD, position player,[], 0, "CAN_COLLIDE"]; 
				_temp setPos [(_pos select 0)+1, _pos select 1, _pos select 2]; 
				WSVAR_CannedFood = WSVAR_CannedFood - 1; 
				_temp allowDamage false;
			};
			case "fuelFull": {
				if(WSVAR_FuelCan <= 0) exitWith {hint "You don't have that many of the selected item."}; 
				dropActive = true;
				player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
				sleep 1.5;
				_pos = getPosATL player;
				_temp= createVehicle [WS_FUELCAN, position player, [], 0, "CAN_COLLIDE"]; 
				_temp setVariable["fuelcan", 1, true]; 
				_temp setPos _pos; 
				WSVAR_FuelCan = WSVAR_FuelCan - 1; 
				_temp allowDamage false;
			};
			case "fuelEmpty": {
				if(WSVAR_EmptyFuelCan <= 0) exitWith {hint "You don't have that many of the selected item."}; 
				dropActive = true;
				player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
				sleep 1.5;
				_pos = getPosATL player;
				_temp= createVehicle [WS_FUELCAN, position player, [], 0, "CAN_COLLIDE"]; 
				_temp setVariable["fuelcan", 0, true]; 
				_temp setPos _pos; 
				WSVAR_EmptyFuelCan = WSVAR_EmptyFuelCan - 1; 
				_temp allowDamage false;
			};
			case "repairkits": {
				if(WSVAR_RepairKit <= 0) exitWith {hint "You don't have that many of the selected item."};
				dropActive = true;
				player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
				sleep 1.5;
				_pos = getPosATL player;
				_temp = createVehicle [WS_RepairKit, position player, [], 0, "CAN_COLLIDE"]; 
				_temp setPos _pos; 
				WSVAR_RepairKit = WSVAR_RepairKit - 1; 
				_temp allowDamage false;
			};
			case "water": {
				if(WSVAR_BOTTLEWATER <= 0) exitWith {hint "You don't have that many of the selected item."};
				dropActive = true;
				player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
				sleep 1.5; 
				_pos = getPosATL player;
				_temp = createVehicle [WS_WATER, position player, [], 0, "CAN_COLLIDE"]; 
				_temp setPos _pos; 
				WSVAR_BOTTLEWATER = WSVAR_BOTTLEWATER - 1;
				_temp allowDamage false;
			};
		};

		dropActive = false;

		[] execVM "player_system\item_list.sqf";

	};
};