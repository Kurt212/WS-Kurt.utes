waste_cooldown = 0;
sleep 10;
//JIP to disable exploiting
_name = name player;
_var = format["%1_JIP",_name];
_side = side player;
_index = [_var,waste_JIPLIST] call {
	private["_find", "_array", "_limit", "_return"];
	_return = -1;
	_find = _this select 0;
	_array = _this select 1;
	_limit = count _array - 1;
	for "_i" from 0 to _limit do
	{
		_select = _array select _i;
		if((_find in _select) && (_return == -1)) then
		{
			_return = _i;
		};
	};
	_return;
};

if(_index != -1) then
{

	if(waste_cooldown == 0) then
	{
		_jipSide = (waste_JIPLIST select _index) select 1;
		
		//Debug hint
		//hint format["ORGINIAL SIDE: %1\nNEWSIDE: %2", _jipSide,_side];
		if(_side != _jipSide) then
		{
			_cd = (((waste_JIPLIST select _index) select 2) - time);
			//If cooldown time is less then 30 minutes end the mission for this player telling him to swap back to his original team.
			if(_cd < 1800) then
			{
				hint "You have joined another team within the last 30 minutes, this is restricted by the server host, please choose a slot on the side you previously were.";
				sleep 15;
				endMission "LOSER"
			} else
			{
				
				waste_JIPLIST set[_index,[_var,_side,time]];
				publicVariable "waste_JIPLIST";
			};
		};
	};
} else
{
	//Client Name, Side, Time when set (time when set used for cooldown between side swapping).
	waste_JIPLIST set[count waste_JIPLIST,[_var,_side,time]];
	publicVariable "waste_JIPLIST";
};