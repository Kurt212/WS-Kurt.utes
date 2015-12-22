// кто-то ленивая жопа ;)

#define HUNGER_DELAY 72
#define THIRST_DElAY 36

// голод
[] spawn  {
	systemChat "Hunger init";
	while{true} do
	{
		uisleep HUNGER_DELAY;
		if(WSVAR_FOOD < 2) then {player setDamage 1; hint "You have starved to death.";}
		else
		{
		WSVAR_FOOD = WSVAR_FOOD - 1;
		if(WSVAR_FOOD < 2) then {player setDamage 1; hint "You have starved to death.";};
		switch(WSVAR_FOOD) do {
			case 50: {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", WSVAR_FOOD];};
			case 30: {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", WSVAR_FOOD];};
			case 20: {hint format["You are starting to starve, you need to find something to eat otherwise you will start to lose health!", WSVAR_FOOD];};
			case 10: {hint format["You are now starving to death, you will slowly lose health, find something to eat quickly!", WSVAR_FOOD]; player setDamage (damage player)*1.4;};
			};
		};
	};
};
// жажда
[] spawn  {
	systemChat "Thirst init";
	while{true} do
	{
		uisleep THIRST_DElAY;
		if(WSVAR_WATER < 2) then {player setDamage 1; hint "You have died from dehydration.";}
		else
		{
			WSVAR_WATER = WSVAR_WATER - 1;
			if(WSVAR_WATER < 2) then {player setDamage 1; hint "You have died from dehydration.";};
			switch(WSVAR_WATER) do {
				case 50: {hint format["You haven't drank anything in awhile, your thirst level is %1", WSVAR_WATER];};
				case 30: {hint format["You haven't drank anything in awhile, your thirst level is %1\n\nYou should find something to drink soon.", WSVAR_WATER];};
				case 20: {hint format["You haven't drank anything in along time, you should find someting to drink soon or you'll start to die from dehydration", WSVAR_WATER];};
				case 10: {hint format["You are now suffering from severe dehydration find something to drink quickly!", WSVAR_WATER]; player setDamage (damage player)*1.4;};
				};
		};
	};
};