// немного бесполезная функция, т.к. изначально хотел добавлять вес

#define INC(a) a = a + 1

_item = _this select 0;

call{
	if(_item == WS_FOOD) exitwith {INC(WSVAR_CannedFood);};
	if(_item == WS_FUELCAN && (_this select 1 == 1)) exitwith {INC(WSVAR_FuelCan);};
	if(_item == WS_WATER) exitwith {INC(WSVAR_BottleWater);};
	if(_item == WS_FUELCAN && (_this select 1 == 0)) exitwith {INC(WSVAR_EmptyFuelCan);};
};