
// Powered by TAW_Tonic. Я бы сделал по-другому, но не буду
#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
if(isNil {MoneyInUse}) then {MoneyInUse = false};
if(isnil {WSVAR_MONEY}) then {WSVAR_MONEY = 0;};
disableSerialization;

private["_money","_pos","_cash"];
_Dialog = findDisplay playersys_DIALOG;
_moneytext = _Dialog displayCtrl money_text;
_money = parsenumber(GET_SELECTED_DATA(money_value));
if(MoneyInUse) exitwith {hint "You are already dropping money.";};
if((WSVAR_MONEY < _money) OR (WSVAR_MONEY <= 0)) exitwith {hint format["You don't have $%1 to drop", _money];};
MoneyInUse = true;
_pos = getPosATL player;
player playmove "AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon";
sleep 1.5;
_cash = createVehicle [WS_MONEY, position player, [], 0, "CAN_COLLIDE"]; 
_cash setPos _pos;
_cash setVariable ["money", _money, true];
WSVAR_MONEY = WSVAR_MONEY - _money;
MoneyInUse = false;
_moneytext ctrlSetText format["%1", WSVAR_MONEY];