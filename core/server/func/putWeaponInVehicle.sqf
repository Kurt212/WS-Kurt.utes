//TODO : спавн медкитов с маленькой веро¤тностью
// input data : [vehicle{object}]
// return data : Null
private["_data", "_weapon", "_nweapon", "_magazines"];

params ["_vehicle"];

_data = call ws_fnc_selectRandomWeapon;
_weapon = _data select 0;
_number_weapons = _data select 1;
_magazines = _data select 2;
_vehicle addWeaponCargoGlobal [_weapon, _number_weapons];
{
	_vehicle addMagazineCargoGlobal [_x, 1];
}forEach _magazines;
