
// скомпилируем функции, которыми пользуемся > 1 раза

addActions = compile preprocessFile "core\client\func\addActions.sqf"; // добавляем экшену
addToInventory = compile preprocessFile "core\client\func\addToInventory.sqf"; // бесполезная, но существующая функция
pm_fnc_init = compile preprocessFile "player_system\init.sqf"; // вызов PLAYER MENU
scanTowns = compile preprocessFile "core\client\func\scanTowns.sqf"; // действительно сканируе триггеры городов на наличие союзников/врагов