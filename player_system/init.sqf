#include "dialog\player_sys.sqf" // пережтки от Тоника

if(!isNil "menuOpened") exitwith{}; // предотвращаем открытие меню, если уже одно есть

// открываем меню
createDialog "playerSettings";
disableSerialization;

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue"];

// наполняем меню
_Dialog = findDisplay playersys_DIALOG;
_foodtext = _Dialog displayCtrl food_text;
_watertext = _Dialog displayCtrl water_text;
_moneytext = _Dialog displayCtrl money_text;
_mvalue = _Dialog displayCtrl money_value;

_carry = _Dialog displayCtrl carry_weight; // пережитки Тоника
// отображение показатель
_foodtext ctrlSettext format["%1 / 100", round(wsvar_food)];
_watertext ctrlSetText format["%1 / 100", round(wsvar_water)];
_moneytext ctrlSetText format["%1", wsvar_money] + " $";
// А эта жуть здесь для выбора количества денег
_mIndex = _mvalue lbadd "$5"; _mvalue lbSetData [(lbSize _mvalue)-1, "5"];
_mIndex = _mvalue lbadd "$15"; _mvalue lbSetData [(lbSize _mvalue)-1, "15"];
_mIndex = _mvalue lbadd "$20"; _mvalue lbSetData [(lbSize _mvalue)-1, "20"];
_mIndex = _mvalue lbadd "$50"; _mvalue lbSetData [(lbSize _mvalue)-1, "50"];
_mIndex = _mvalue lbadd "$75"; _mvalue lbSetData [(lbSize _mvalue)-1, "75"];
_mIndex = _mvalue lbadd "$100"; _mvalue lbSetData [(lbSize _mvalue)-1, "100"];
_mIndex = _mvalue lbadd "$200"; _mvalue lbSetData [(lbSize _mvalue)-1, "200"];
_mIndex = _mvalue lbadd "$300"; _mvalue lbSetData [(lbSize _mvalue)-1, "300"];
_mIndex = _mvalue lbadd "$500"; _mvalue lbSetData [(lbSize _mvalue)-1, "500"];
_mIndex = _mvalue lbadd "$1000"; _mvalue lbSetData [(lbSize _mvalue)-1, "1000"];

// Дамаг панель
_common_damage = damage player;
_CommonHealthStatus = _Dialog displayCtrl 81;
if(_common_damage > 0) then {_CommonHealthStatus ctrlSetBackgroundColor [_common_damage, 0, 0, 1];}
else {_CommonHealthStatus ctrlSetBackgroundColor [0, 0, 0, 0.2];};


_head_damage = player getHit "head";
_HeadHealthStatus = _Dialog displayCtrl 82;
if(_head_damage > 0) then {_HeadHealthStatus ctrlSetBackgroundColor [_head_damage, 0, 0, 1];}
else {_HeadHealthStatus ctrlSetBackgroundColor [0, 0, 0, 0.2];};

_body_damage = player getHit "body";
_BodyHealthStatus = _Dialog displayCtrl 83;
if(_body_damage > 0) then {_BodyHealthStatus ctrlSetBackgroundColor [_body_damage, 0, 0, 1];}
else {_BodyHealthStatus ctrlSetBackgroundColor [0, 0, 0, 0.2];};


_hands_damage = player getHit "hands";
_HandsHealthStatus = _Dialog displayCtrl 84;
if(_hands_damage > 0) then {_HandsHealthStatus ctrlSetBackgroundColor [_hands_damage, 0, 0, 1];}
else {_HandsHealthStatus ctrlSetBackgroundColor [0, 0, 0, 0.2];};

_legs_damage = player getHit "legs";
_LegsHealthStatus = _Dialog displayCtrl 85;
if(_legs_damage > 0) then {_LegsHealthStatus ctrlSetBackgroundColor [_legs_damage, 0, 0, 1];}
else {_LegsHealthStatus ctrlSetBackgroundColor [0, 0, 0, 0.2];};

menuOpened = true; // неважно чему оно равно, главное, что оно не Nil