player hideobject true;

player setposATL [getpos player select 0, getPos player select 1, 0.1];

//
removeAllWeapons player;
removeBackpack player;

// добавляем начальное оружие
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_F";

// начальный параметры	
WSVAR_WATER = 100;
WSVAR_FOOD = 100;

WSVAR_MONEY = 100;
WSVAR_FuelCan = 0;
WSVAR_EmptyFuelCan = 0;
WSVAR_CannedFood = 0;
WSVAR_BottleWater = 0;
WSVAR_REPAIRKIT = 0;

[] execVM "core\client\spawning\do_spawn_dialog.sqf";

[] call addActions;



