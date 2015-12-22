// Этот код втирает вам какую-то дичь!

_possible_tows = [[Parking_Trigger, "Парковка у Каменного"], [Kameny_Base_Trigger, "База у Каменного"],  [Kameny_Common_Trigger, "Каменный"], [Strelka_Base_Trigger, "База у Стрелки"], [Strelka_Common_Trigger, "Стрелка"], [Prigorodky_Trigger, "Пригородки"]];

towns_free= [];
towns_block = [];

{
	_friends = [];
	_enemies = 0;
	_list = list (_x select 0);
	if(isNil "_list") exitWith{};
	if(side player == resistance) then {
		{
			if(_x isKindOF "man") then{
				if(groupId group _x == groupID group player) then{
					_friends pushback _x;
				}
				else{
					_enemies = _enemies + 1;
				};
			};
		}foreach _list;
	}
	else{
		{
			if(_x isKindOF "man") then{
				if(side _x == side player) then{
					_friends pushback _x;
				}
				else{
					_enemies = _enemies + 1;
				};
			};
		}foreach _list;
	};
	if(count _friends > 0) then{
		if(_enemies > 0) then{
			towns_block pushback (_x select 1);
		}
		else{
			towns_free pushback [_x select 0, _x select 1, _friends];
		};
	};
}foreach _possible_tows;