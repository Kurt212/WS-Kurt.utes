#define GEOCASH_BOX "Box_IND_Wps_F"

//спавними ящики с оружием

_nbox = 0;

{ 
	private["_i", "_j", "_respawn_point", "_spawn", "_box", "_data", "_weapon", "_nweapon", "_magazines"];      
	_rad = (triggerArea _x select 0) min (triggerArea _x select 1);

	_spawn = [_x, _rad] call BIS_fnc_randomPosTrigger;  
	_box = createvehicle [GEOCASH_BOX, _spawn, [], 0, "FLY"]; 	
	
	clearWeaponCargoGlobal _box; clearMagazineCargo _box; 
	_nbox = _nbox + 1;
	for "_j" from 0 to floor (random 3) do{  	
		_data = call ws_fnc_selectRandomWeapon;    
		_weapon = _data select 0;    
		_nweapon = _data select 1;    
		_magazines = _data select 2; 
		_box addWeaponCargoGlobal [_weapon, _nweapon];    
		{ 
			_box addMagazineCargoGlobal [_x, 1];    
		}forEach _magazines;   
	};  
}forEach towns;    

//спавним машины

_ncar = 0;


{   
	_number = round (random 6) + 4;  
	for "_i" from 0 to _number do{   
		_ncar = _ncar + 1;
		[_x] call ws_fnc_spawnRandomVehicle;   
		sleep 0.1;
	};  
}forEach towns;

systemChat format["Boxes spawned : %1", _nbox];
systemChat format["Cars spawned : %1", _ncar];