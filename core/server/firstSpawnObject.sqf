#define SELECT_RANDOM(a) (##a call {private "_return"; _return = (_this) select(random ((count _this) - 1)); _return})

/*

	WS_FOOD_CONTAINER setVariable [
									foodcontainer // всегда
									5 			// сколько всего еды
									true 		// всегда
								]
	WS_WATER_CONTAINER setVariable  [
									watercontainer // всегда
									5			 // сколько всего воды
									true 		 //	всегда								
								]											
	WS_MONEY		setVariable 		[
									money // всегда
									100 	 // сколько денег
									true // всегда
								]	
	WS_FUELCAN 	setVariable		[
									fuelcan  // всегда
									0 		// пустая канистра // 1 // полная канистра
									true 	// всегда
								]								
							
*/
							
_nobject = 0;


_objects = [WS_FOOD_CONTAINER, WS_WATER_CONTAINER, WS_FUELCAN, WS_REPAIRKIT];

#define OBJECTS_NUMBER 30  // поменять, чтобы изменить колличество объектов на карте. Так же поменять в monitor.fsm

while {_nobject < OBJECTS_NUMBER} do {
	private["_pos", "_rand", "_obj", "_l", "_available"];
	_pos = SELECT_RANDOM(Spawn_Objects_Positions);
	_multiplier = if(round random 1 == 0) then {-1} else {1};
	_pos = [(_pos select 0) + _multiplier*(random 1), (_pos select 1) + _multiplier*(random 1), _pos select 2];
	_rand = random 100;
	if(_rand < 5) then {_available = [WS_FOOD_CONTAINER, WS_WATER_CONTAINER]; _obj = SELECT_RANDOM(_available);}
	else {_available = [WS_FUELCAN, WS_REPAIRKIT]; _obj = SELECT_RANDOM(_available);};
	_l = createvehicle [_obj, _pos, [], 0, "CAN_COLLIDE"];
	
	call{
		if(_obj == WS_FOOD_CONTAINER) exitwith {_l setVariable["foodcontainer", 5, true];};
		if(_obj == WS_WATER_CONTAINER) exitwith {_l setVariable ["watercontainer", 5, true];};
		if(_obj == WS_FUELCAN) exitwith {
			_rand = random 100; 
			if(_rand < 70) then { _l setVariable["fuelcan", 1, true]; }
			else { _l setVariable ["fuelcan", 0, true];};
		};
	};
	_l allowdamage false;
	_nobject = _nobject + 1;
};

systemChat format ["Objects spawned : %1", _nobject];