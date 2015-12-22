
// функции рабооты с PLAYER MENU
pm_fnc_use = compile preprocessFile "player_system\use.sqf"; // use
pm_fnc_drop = compile preprocessFile "player_system\drop.sqf"; // drop
pm_fnc_item_list = compile preprocessFile "player_system\item_list.sqf"; // что-то ещё... не помню
pm_fnc_drop_money = compile preprocessFile "player_system\drop_money.sqf"; // выкинуть нафиг эти деньги! Кому они вообще нужны?
pm_fnc_roguelist = compile preprocessFile "player_system\roguelist.sqf"; // пережитки Тоника
pm_fnc_repair = compile preprocessFile "player_system\func\repair.sqf"; // починка транспорта REPAIRKIT'ом
pm_fnc_refuel = compile preprocessFile "player_system\func\refuel.sqf"; // заправка транспорта
pm_fnc_settingslist = compile preprocessFile "player_system\settingslist.sqf"; // открывает окно настроек
pm_fnc_viewdistance = compile preprocessFile "player_system\func\ViewDistance.sqf"; // выставляет указанную ViewDistance
pm_fnc_objectviewdistance = compile preprocessFile "player_system\func\ObjectViewDistance.sqf"; // то же самое
