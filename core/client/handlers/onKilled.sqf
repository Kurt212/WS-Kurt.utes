//добавить сюда сброс всех WS_OBJECTS

// отправка на сервер в обработчик убийств
WS_MPKilled = [WSVAR_SIDE, _this select 1];
publicVariableServer "WS_MPKilled";

// сброс всякого говна 
[] spawn {
if(WSVAR_MONEY > 0) then{
	_l = createvehicle[WS_MONEY, getposatl player, [], 0, "CAN_COLLIDE"];
	_l setVariable ["money", WSVAR_MONEY, true];
	_l allowDamage false;
};
if(WSVAR_FuelCan > 0) then{
	for "_i" from 0 to WSVAR_FuelCan - 1 do{
		_l = createvehicle[WS_FUELCAN, getposatl player, [], 0, "CAN_COLLIDE"]; 
		_l setVariable ["fuelcan", 1, true];
		_l allowDamage false;
	};
};
if(WSVAR_EmptyFuelCan > 0) then{
	for "_i" from 0 to WSVAR_EmptyFuelCan - 1 do{
		_l = createvehicle[WS_FUELCAN, getposatl player, [], 0, "CAN_COLLIDE"]; 
		_l setVariable ["fuelcan", 0, true];
		_l allowDamage false;
	};
};
if(WSVAR_CannedFood > 0) then{
	for "_i" from 0 to WSVAR_CannedFood - 1 do{
		_l = createvehicle[WS_FOOD, getposatl player, [], 0, "CAN_COLLIDE"]; 
		_l allowDamage false;
	};
};
if(WSVAR_BottleWater > 0) then{
	for "_i" from 0 to WSVAR_BottleWater - 1 do{
		_l = createvehicle [WS_WATER, getposatl player, [], 0, "CAN_COLLIDE"];
		_l allowDamage false;
	};
};
if(WSVAR_REPAIRKIT > 0) then{
	for "_i" from 0 to WSVAR_REPAIRKIT - 1 do {
		_l = createvehicle [WS_REPAIRKIT, getposatl player, [], 0, "CAN_COLLIDE"];
		_l allowDamage false;
	};
};
};

removeAllActions player;