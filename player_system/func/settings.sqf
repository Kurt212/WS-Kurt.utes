disableSerialization;

_Dialog = findDisplay 212;




#define cViewDistance 1111
#define cObjectviewDistance 2222
#define cTagsDrawDistance 3333

params ["_key"];

switch(_key) do{
	case 1:
	{
		_ctrl = _Dialog displayCtrl cViewDistance;
		_number = parseNumber ctrlText _ctrl;
		if(_number <= 0) exitWith{};
		setViewDistance _number;
		_ctrl ctrlSetTooltip format ["Current = %1", ViewDistance];
	};
	case 2:
	{
		_ctrl = _Dialog displayCtrl cObjectviewDistance;
		_number = parseNumber ctrlText _ctrl;
		if(_number <= 0) exitWith{};
		setObjectViewDistance _number;
		_ctrl ctrlSetTooltip format ["Current = %1", getObjectViewDistance select 0];
	};	
	case 3:
	{
		_ctrl = _Dialog displayCtrl cTagsDrawDistance;
		_number = parseNumber ctrlText _ctrl;
		if(_number <= 0) exitWith{};
		WSVAR_TAGS_DRAW_DISTANCE = _number;
		_ctrl ctrlSetTooltip format ["Current = %1", WSVAR_TAGS_DRAW_DISTANCE];
	};
};