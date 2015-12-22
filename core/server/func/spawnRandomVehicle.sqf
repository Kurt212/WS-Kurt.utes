// input data : [position]
// return data : [object]
private ["_return", "_rnd", "_arr", "_veh", "_vpos", "_new_vpos"];
_rnd = random 100;
_arr = WSCFG_VEHICLES; 
if(_rnd < 10) then {_arr = WSCFG_HEAVY_VEHICLES;}; // поменять значение шанса спавна грузовика
if(_rnd < 1) then {_arr = WSCFG_VEHICLES_SPECIAL;}; // поменять значение шанса спавна специальной техники

_town = _this select 0;

_veh = _arr call BIS_fnc_selectRandom;

_arr_markers = _town getVariable "Markers";

_marker = _arr_markers call BIS_fnc_selectRandom;

_new_vpos = getMarkerPos _marker;

_return = createVehicle [_veh, _new_vpos, [], 0, "NONE"];


clearWeaponCargoGlobal _return; clearMagazineCargoGlobal _return; clearItemCargoGlobal _return;
_return setFuel (random 1); _return setDamage (random .50); _return setDir (random 360);

[_return] call ws_fnc_putWeaponInVehicle;


_return;