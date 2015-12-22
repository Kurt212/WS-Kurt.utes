// input data : NULL
// return data : [WEAPON NAME, WEAPON NUMBER, [MAGAZINE NAMES]];
private["_return", "_weapon", "_nweapon", "_rnd", "_num", "_i", "_j", "_cfgmagazines", "_magazines", "_total_mag", "_arr"];
//TODO : добавить выбор для других типов оружи¤; добавить спавн vѕ : DONE
_rnd = random 100;
call{
	if(_rnd < 5) exitwith {_arr = WSCFG_LAUNCHERS;};
	if(_rnd < 10) exitwith {_arr = WSCFG_PISTOLS_SPECIAL;};
	if(_rnd < 80) exitwith { _arr = WSCFG_GUNS;};
	_arr = WSCFG_PISTOLS;
};
_weapon = _arr call BIS_fnc_selectRandom;


if(_weapon in WSCFG_PISTOLS_SPECIAL && (dayTime > 20 || dayTime < 5)) exitwith {_return = [_weapon, 1, []]; _return;};
_magazines = [];

_cfgmagazines = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines"));

if(_weapon in WSCFG_LAUNCHERS) exitwith{_return = [_weapon, 1, [_cfgmagazines select 0]]; _return;};

_magazines = [_cfgmagazines select 0, _cfgmagazines select 0];
_rnd = round  (random (count _cfgmagazines - 1));

_total_mag = 0;

for "_i" from 0 to _rnd do{
	if (_total_mag > 2) exitwith{};
	_magazines = _magazines + [_cfgmagazines select _i];
	_total_mag = _total_mag + 1;
};

_return = [_weapon, 1, _magazines];
_return;