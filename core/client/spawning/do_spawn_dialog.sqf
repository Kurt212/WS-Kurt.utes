titleText ["Loading...", "BLACK OUT", 0.00001];

execVM "core\client\spawning\create_dialog.sqf";
waitUntil {!isNil"respawnDialogActive"};

while {!isNil"respawnDialogActive"} do {
	titleText ["", "BLACK OUT", 0.00001];
};
sleep 0.1;
titleText ["", "BLACK IN", 0.00001];

if(isNil"PlayerFirstSpawn") then {PlayerFirstSpawn = true;}