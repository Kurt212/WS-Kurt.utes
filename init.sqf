#define ENABLESERVER
#define ENSABLECLIENT

#include "core\addTowns.sqf"; // добавим сразу все города


/*
resistance setFriend[west, 0];
resistance setFriend[EAST, 0];
*/

#ifdef ENSABLECLIENT

// инициализация клиента
if(!isDedicated) then { execVM "core\client\init_client.sqf"; };

#endif

#ifdef ENABLESERVER

// инициализация сервера
if(isServer) then { 
	execVM "core\server\init_server.sqf";
	waste_JIPLIST = [];
	publicVariable "waste_JIPLIST";
};

#endif

// полезная вещь. хранит в себе файловый путь к папке с миссией
MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};

//R3F init
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

//Dynamic Weather system
[] execVM "addons\DynamicWeatherEffects\DynamicWeatherEffects.sqf";

[true, true, true, true] execVM "addons\GroupSystem\init.sqf";


enableSaving[false,false];
