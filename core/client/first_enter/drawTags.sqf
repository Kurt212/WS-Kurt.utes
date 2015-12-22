_fnc_proportion = compile preprocessFile "core\client\first_enter\_proportion.sqf";

while {true} do{
	if(WSVAR_SIDE == resistance) then {
		onEachFrame {
		_unit = units (group player) - [player];     
		{        
			_bool = (player distance _x < 700) && (player distance _x <= viewDistance) && !(isObjectHidden _x);        
			if((_bool) && (vehicle player != vehicle _x) && (alive player)) then {          
				_playerPosVisual = getPosVisual  _x;
				_playerPosATL = getPosATLVisual _x;
				_playerPos = [0,0,0];
				if(surfaceIsWater position _x) then {_playerPos = _playerPosVisual;}
				else {
					_playerPos = _playerPosATL;
				};      
				_size = [0, 700, 0.02, 0.035, player distance _x] call _fnc_proportion; 
				_sizeIcon = [0, 700, 0.2, 0.7, player distance _x] call _fnc_proportion;
				_color = [];     
				if( groupId ( group _x) == groupId (group player)) then { _color =  [0.8,1,0,1];}     
				else { _color = [0,0.5,1,1]; }; 					
				if(showTagsEnabled == 1) then {drawIcon3D ["", _color, _playerPos, 0, 0, direction player,name _x, 2, _size, "EtelkaNarrowMediumPro"];}; 
				drawIcon3D [WS_SIDE_ICON,  [1,1,1,1], [_playerPos select 0, _playerPos select 1, (_playerPos select 2) + 2.5], _sizeIcon, _sizeIcon, 0];        
			};     
		}foreach _unit;  
	};
	}
	else{
	onEachFrame {
		_unit = allUnits - [player];     
		{        
			_bool = (player distance _x < 700) && (player distance _x <= viewDistance)  && !(isObjectHidden _x);        
			if(WSVAR_SIDE == side _x && (_bool) && (vehicle player != vehicle _x) && (alive player)) then {          
				_playerPosVisual = getPosVisual  _x;
				_playerPosATL = getPosATLVisual _x;
				_playerPos = [0,0,0];
				if(surfaceIsWater position _x) then {_playerPos = _playerPosVisual;}
				else {
					_playerPos = _playerPosATL;
				};
				_size = [0, 700, 0.02, 0.035, player distance _x] call _fnc_proportion; 
				_sizeIcon = [0, 700, 0.2, 0.7, player distance _x] call _fnc_proportion;
				_color = [];     
				if( groupId ( group _x) == groupId (group player)) then { _color =  [0.8,1,0,1];}     
				else { _color = [0,0.5,1,1]; };     
				if(showTagsEnabled == 1) then {drawIcon3D ["", _color, _playerPos, 0, 0, direction player,name _x, 2, _size, "EtelkaNarrowMediumPro"];};   
				drawIcon3D [WS_SIDE_ICON,  [1,1,1,1], [_playerPos select 0, _playerPos select 1, (_playerPos select 2) + 2.5], _sizeIcon, _sizeIcon, 0];        
			};     
		}foreach _unit;  
	};
	};
	uisleep 10;
};
