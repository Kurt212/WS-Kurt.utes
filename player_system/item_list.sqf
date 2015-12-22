#include "dialog\player_sys.sqf";
disableSerialization;

private["_itemListIndex","_itemList"];

_dialog2 = findDisplay playersys_DIALOG;
_itemList = _dialog2 displayCtrl item_list;

lbClear _itemList;

if(WSVAR_CannedFood > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Canned Food", WSVAR_CannedFood];
_itemList lbSetData [(lbSize _itemList)-1, "canfood"];
};
if(WSVAR_BottleWater > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Water bottle", WSVAR_BottleWater];
_itemList lbSetData [(lbSize _itemList)-1, "water"];
};
if(WSVAR_FuelCan > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Fuel Can", WSVAR_FuelCan];
_itemList lbSetData [(lbSize _itemList)-1, "fuelFull"];
};
if(WSVAR_EmptyFuelCan > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Empty Fuel Can", WSVAR_EmptyFuelCan];
_itemList lbSetData [(lbSize _itemList)-1, "fuelEmpty"];
};
if(WSVAR_RepairKit > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Repair KIt", WSVAR_RepairKit];
_itemList lbSetData [(lbSize _itemList)-1, "repairkits"];
};