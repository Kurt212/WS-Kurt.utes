#include "first_enter\define_objects.sqf" // почему не добавить общий дефайн? не знаю :)

#include "first_enter\define_spawns.sqf"

#include "func\compile.sqf"; // скомпилируем все функции


//скомпилируем функции для работы с Player Menu
[] execVM "player_system\compile.sqf"; // а это не нужно сразу, поэтому делаю вот так. Тем более инклудом не получится сделать

waitUntil{!isnil "bis_fnc_init"}; // ну тут хотя бы понятно ...

	player addEventHandler ["Killed", {_this execVM "core\client\handlers\onKilled.sqf";}]; //  если игрок умер
	player addEventHandler ["Respawn", {_this execVM "core\client\handlers\onRespawn.sqf";}]; // когда игрок заного появился

showTagsEnabled = 0; // для отрисовки TAG'ов с никами
WSVAR_SIDE = side player; // пригодится для некоторых вещей

onKeyDown = compile preprocessFile "core\client\handlers\onKeyDown.sqf";

waitUntil {!(isNull (findDisplay 46))}; // хрен знает что такое Display 46
(findDisplay 46) displaySetEventHandler ["KeyDown", '_this call onKeyDown']; // обработка нажатия клавиш

// сразу обазначу путь к файлу TAG'a
switch(WSVAR_SIDE) do {
	case WEST : {WS_SIDE_ICON = MISSION_ROOT + "source\blueTag.paa"};
	case EAST : {WS_SIDE_ICON = MISSION_ROOT + "source\redTag.paa"};
	case RESISTANCE : {WS_SIDE_ICON = MISSION_ROOT + "source\greenTag.paa"};
};

// добавлю сразу побольше рейтинга
player addRating 999999;

// включим отрисовку TAG'ов
[] execVM "core\client\first_enter\drawTags.sqf";

// не самая красивая часть
[] spawn{
	while {true} do{
		waitUntil{sleep 60; rating player < 9999};
		player addRating 999999;
	};
};



//запоминает сторону входа и время входа
[] execVM "core\client\first_enter\setJIP.sqf"; 
//включаем голод и жажду
[] execvm "core\client\first_enter\init_survival.sqf";
// ... и еще щепотку action'ов
[] spawn addActions;
//включаем показатели
// начальный параметры	
WSVAR_WATER = 100;
WSVAR_FOOD = 100;

WSVAR_MONEY = 100;
WSVAR_FuelCan = 0;
WSVAR_EmptyFuelCan = 0;
WSVAR_CannedFood = 0;
WSVAR_BottleWater = 0;
WSVAR_REPAIRKIT = 0;
// включаем худ
[] execVM "core\client\hud.sqf";


// включаем спавн-меню
[] execVM "core\client\spawning\do_spawn_dialog.sqf";

//приветственное сообщение
[] execVM "core\client\first_enter\helloMessage.sqf";
