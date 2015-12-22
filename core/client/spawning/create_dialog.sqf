//Реалтзация спёрта у 404 вэйстлэнда

#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
#define respawn_PlayersInTown_Text0 3408
#define respawn_PlayersInTown_Text1 3409
#define respawn_PlayersInTown_Text2 3410
#define respawn_PlayersInTown_Text3 3411
#define respawn_PlayersInTown_Text4 3412
#define respawn_TownsBlocked 200

disableSerialization;
createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];
_respawnText = _display displayCtrl respawn_Content_Text;

_side = "";
switch(WSVAR_SIDE) do {
	case WEST : {_side = "Blufor"};
	case EAST : {_side = "Opfor"};
	case RESISTANCE : {_side = "Independent"};
};
_respawnText ctrlSetStructuredText parseText (format["You are on %1.<br/>Please select a spawn point.",_side]);
respawnDialogActive = true;

_dynamicControlsArray = [
	[respawn_Town_Button0,respawn_PlayersInTown_Text0],
    [respawn_Town_Button1,respawn_PlayersInTown_Text1],
    [respawn_Town_Button2,respawn_PlayersInTown_Text2],
    [respawn_Town_Button3,respawn_PlayersInTown_Text3],
    [respawn_Town_Button4,respawn_PlayersInTown_Text4]];
	
{
    _button = _display displayCtrl (_x select 0);
    _button ctrlSetText format[""];
    //_button ctrlShow false;
	_button ctrlEnable false;
}foreach _dynamicControlsArray;

[] spawn{
	_display = uiNamespace getVariable "RespawnSelectionDialog";
	_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;
	while {!isNil"respawnDialogActive"} do{
	_timeText = [time/60/60] call BIS_fnc_timeToString;
    _missionUptimeText ctrlSetText format["Mission Uptime: %1", _timeText];
	};
};

[] call scanTowns;

_n = 0;
if(count towns_free == 6) then {_n = count towns_free - 2;}
else {_n  = count towns_free - 1;};

for "_i" from 0 to _n do{
	_btn = _display displayCtrl ((_dynamicControlsArray select _i) select 0);
	_text_btn = (towns_free select _i) select 1;
	_btn ctrlSetText _text_btn;
	_btn ctrlAddEventHandler["ButtonClick", {[CtrlText(_this select 0)] execVM "core\client\spawning\onSpawnSelected.sqf"; closeDialog 0;}];

	_btn ctrlEnable true;
		
	_players = (towns_free select _i) select 2;
	_players_line = _display displayCtrl ((_dynamicControlsArray select _i) select 1);
	_players_text = "";
	{
		_players_text = _players_text + (name _x);
		if(_x != (_players select (count _players -1))) then{_players_text = _players_text + ", ";};
	}foreach _players;
	_players_line ctrlSetText _players_text;
};

if(count towns_block > 0) then {
	_TownsBlockedText = _display displayCtrl respawn_TownsBlocked;
	_s = "Blocked by enemies : ";
	{
		_s = _s + _x;
		if(_x != (towns_block select(count towns_block - 1))) then {_s = _s + ", "};
	}foreach towns_block;

	_TownsBlockedText ctrlsetText _s;
};

