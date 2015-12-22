#define HUD_DELAY 1 

disableSerialization;

cutRsc ["playerHUD","PLAIN"];

_ui = uiNameSpace getVariable "playerHUD";  
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23530;


_txt = _ui displayCtrl 212; // поменять название


while {true} do
{
	
	if(vehicle player != player) then {		
		_car = vehicle player;
		_crew = crew _car;
		_driver = driver _car;
		_gunner = gunner _car;
		_text = "";
		if(!(IsNull _driver)) then { _crew = _crew - [_driver]; _c = "#ffffff"; if(_driver in units group player) then {_c = "#55b34f";}; _text = _text + format["<img size='0.8' image='player_system\icons\driver.paa'/><t size='0.8' font = 'EtelkaNarrowMediumPro' color = '%2'>%1</t> <br/>", name _driver, _c];};
		if(!(IsNull _gunner)) then { _crew = _crew - [_gunner]; _c = "#ffffff"; if(_gunner in units group player) then {_c = "#55b34f";}; _text = _text + format["<img size='0.8' image='player_system\icons\gunner.paa'/><t size='0.8'font = 'EtelkaNarrowMediumPro' color = '%2'>%1</t> <br/>", name _gunner, _c];};
		for "_i" from 0 to count _crew - 1 do{
			_c = "#ffffff";
			if((_crew select _i) in units group player) then {_c = "#55b34f";};
			_n = name(_crew select _i);
			_text = _text + format["<img size='0.8' image='player_system\icons\cargo.paa'/><t size='0.8' font = 'EtelkaNarrowMediumPro' color = '%2'>%1</t> <br/>", _n, _c];
		};
		_txt ctrlSetStructuredText parseText _text;
	}
	else{
		_txt ctrlSetStructuredText parseText "";
		// тип очистка
	};
	_food ctrlSetText format["%1", WSVAR_FOOD] + "%";
	
	_water ctrlSetText format["%1", WSVAR_WATER] + "%";	

	_health ctrlSetText format ["%1",100 - (floor (damage player * 100))] + "%";
		
	uisleep HUD_DELAY;
};