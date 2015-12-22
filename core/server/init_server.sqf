//инициализируем функции и переменные
#include "func\compile.sqf";

#include "wscfg_vehicles.sqf"
#include "wscfg_weapons.sqf"
#include "define_objects.sqf"
#include "define_spawns.sqf";

[] execvm "core\server\Buildigs_Spawn.sqf";


"SpawnedTownInfo" addPublicVariableEventHandler{
	private["_town", "_lst", "_good","_car"];
	_good = false;
	_town = _this select 1;
	_lst = +(list _town);
	[] call
	{
		_x = _lst call BIS_fnc_selectRandom;
		if((typeof _x) in WSCFG_VEHICLES && local _x) then
		{
			[_x] call ws_fnc_putWeaponInVehicle;
			_good = true; 
			systemchat format["weapon added in %1", _x];
		};
	};
	if(!_good) then{
		_car = [getpos _town] call ws_fnc_spawnRandomVehicle; 
		systemchat format["car spawnned %1", _car];
	};
};

"WS_MPKilled" addPublicVariableEventHandler{
	private["_side", "_killer", "_data"];
	_data = _this select 1;
	_side = _data select 0;
	_killer = _data select 1;
	//hint format ["Unit - %1\nKiller - %2", _side, side _killer];
	if((_side == resistance) && (side _killer == resistance )) exitwith { _killer addscore 2;};
	if((_side in [WEST, EAST]) && (side _killer in [WEST, EAST])) exitwith { _killer addRating 1400;};
};


setTimeMultiplier 16;

//sleep 2;
//спавним начальную технику и ящики в городах
call { execFSM "core\server\monitor.fsm"; };

//миссии

[] execvm "core\server\missions\init.sqf";