private ["_code"];

#define MaxDistance WSVAR_TAGS_DRAW_DISTANCE


if(WSVAR_SIDE == resistance) then{
	_code =
	{
		_fnc_proportion = {
			params ["_min", "_max", "_nmin", "_nmax", "_i"];
			_return = _nmax - ((_nmax - _nmin)*(_i - _min)/(_max - _min));
			_return;
		};
		_unit = units (group player) - [player];     
		{        
			_bool = (player distance _x < MaxDistance) && (player distance _x <= viewDistance) && !(isObjectHidden _x);        
			if((_bool) && (vehicle player != vehicle _x) && (alive player)) then {          
				_playerPosVisual = getPosVisual  _x;
				_playerPosATL = getPosATLVisual _x;
				_playerPos = [0,0,0];
				if(surfaceIsWater position _x) then {_playerPos = _playerPosVisual;}
				else {
					_playerPos = _playerPosATL;
				};      
				_size = [0, MaxDistance, 0.02, 0.03, player distance _x] call _fnc_proportion; 
				_sizeIcon = [0, MaxDistance-200, 0.1, 0.4, player distance _x] call _fnc_proportion;
				_color = [];     
				if( groupId ( group _x) == groupId (group player)) then { _color = [0.8,1,0,1];}     
				else { _color = [0,0.5,1,1]; }; 					
				if(showTagsEnabled == 1) then {drawIcon3D ["", _color, _playerPos, 0, 0, direction player,name _x, 2, _size, "EtelkaNarrowMediumPro"];}; 
				drawIcon3D [WS_SIDE_ICON,  [1,1,1,1], [_playerPos select 0, _playerPos select 1, (_playerPos select 2) + 2.5], _sizeIcon, _sizeIcon, direction player];        
			};     
		}foreach _unit;  
	};
}
else {
	_code =
	{
		_fnc_proportion = {
			params ["_min", "_max", "_nmin", "_nmax", "_i"];
			_return = _nmax - ((_nmax - _nmin)*(_i - _min)/(_max - _min));
			_return;
		};
		_unit = allUnits - [player];     
		{        
			_bool = (player distance _x < MaxDistance) && (player distance _x <= viewDistance)  && !(isObjectHidden _x);        
			if((WSVAR_SIDE == side _x) && (_bool) && (vehicle player != vehicle _x) && (alive player)) then {          
				_playerPosVisual = getPosVisual  _x;
				_playerPosATL = getPosATLVisual _x;
				_playerPos = [0,0,0];
				if(surfaceIsWater position _x) then {_playerPos = _playerPosVisual;}
				else {
					_playerPos = _playerPosATL;
				};
				_size = [0, MaxDistance, 0.02, 0.03, player distance _x] call _fnc_proportion; 
				_sizeIcon = [0, MaxDistance-200, 0.1, 0.4, player distance _x] call _fnc_proportion;
				if(_sizeIcon < 0.1) then {_sizeIcon = 0.1};
				_color = [];   

				if( groupId ( group _x) == groupId (group player)) then { _color =  [0.8,1,0,1];}     
				else { _color = [0,0.5,1,1]; };    

				//hintSilent format["SIZE = %1\nICON = %2\nCOLOR = %3", _size, _sizeIcon, _color]; 

				if(showTagsEnabled == 1) then {drawIcon3D ["", _color, _playerPos, 0, 0, direction player,name _x, 2, _size, "EtelkaNarrowMediumPro"];};   
				_iconPosition = _x modelToWorld(_x selectionPosition "head");
				_iconPosition = [_iconPosition select 0, _iconPosition select 1, (_iconPosition select 2) + 1];
				drawIcon3D [WS_SIDE_ICON,  [1,1,1,1], _iconPosition, _sizeIcon, _sizeIcon, 0];         
			};     
		}foreach _unit;
	};
};


["drawTags", "onEachFrame", _code] call BIS_fnc_addStackedEventHandler;