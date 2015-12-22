/*
** 	(_weapon >> "type");
** 1 - обычное оружие
** 2 - пистолеты
** 4 - пусковые установки
** 16 - магазины для типа 2
** 256 - магазины для типа 1
** 1536 - магазины для типа 4 
*/


WSCFG_GUNS = []; // обычные винтовки, дробовики, пулеметы
WSCFG_PISTOLS = []; // пистолеты
//WSCFG_LAUNCHERS_SPECIAL = ["rhs_weap_igla", "rhs_weap_fim92", "rhs_weap_rpg7", "launch_Titan_F", "rhs_weap_fgm148"];
WSCFG_LAUNCHERS_SPECIAL = [];

WSCFG_LAUNCHERS = ["launch_NLAW_F", "launch_RPG32_F", "rhs_weap_rpg7_pgo", "rhs_weap_M136_hp"];
WSCFG_PISTOLS_SPECIAL = ["rhs_weap_rsp30_white", "rhs_weap_rsp30_red", "rhs_weap_rsp30_green"];

_cfgweapons = configFile >> "cfgWeapons";


//добавляем в WSCFG_GUNS названия оружий, которые подходят
//TODO : разораться со страндартным, длс-ным и рхс оружием || donez

for "_i" from 0 to (count _cfgweapons)-1 do {
	_wep = _cfgweapons select _i;
	if(isClass _wep && getText(_wep >> "displayName") != ""	&& getText(_wep >> "picture") != ""
	 && getText(_wep >> "DLC")=="") then
	{
		_wepname = configName(_wep);
		switch(getNumber(_wep >> "type")) do
		{
			case 1: {
				WSCFG_GUNS pushBack _wepname;
			};
			case 2: {
				WSCFG_PISTOLS pushBack _wepname;
			};
			case 4: {
				WSCFG_LAUNCHERS_SPECIAL pushBack _wepname;
			};
		};
	};
};

WSCFG_LAUNCHERS_SPECIAL = WSCFG_LAUNCHERS_SPECIAL - WSCFG_LAUNCHERS;
WSCFG_PISTOLS = WSCFG_PISTOLS - 
["rhs_weap_tr8","rhs_weap_rsp30_white",	"rhs_weap_rsp30_white_used", "rhs_weap_rsp30_red", 
"rhs_weap_rsp30_red_used", "rhs_weap_rsp30_green", "rhs_weap_rsp30_green_used"];

_to_cut = [];

for "_i" from 0 to count WSCFG_LAUNCHERS_SPECIAL - 1 do{
	_wep = WSCFG_LAUNCHERS_SPECIAL select _i;
	_first_4_chars = call{
		_a = toArray(_wep);
		_s = toString ([_a select 0, _a select 1, _a select 2, _a select 3]);
		_s;
	};
	if(_first_4_chars != "rhs_" && _first_4_chars != "laun") then{
		_to_cut pushBack _wep;
	}
	else{
		_last_5_chars = call{
			_a = toArray(_wep);
			_s = toString ([_a select(count _a - 1), _a select(count _a - 2), 
				_a select(count _a - 3), _a select(count _a - 4), _a select(count _a - 5)]);
			_s;			
		};	
		if(_last_5_chars == "desu_") then{
			_to_cut pushBack _wep;
		};
	};	
};

WSCFG_LAUNCHERS_SPECIAL = WSCFG_LAUNCHERS_SPECIAL - _to_cut;