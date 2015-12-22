private ["_key", "_shift", "_ctrlKey", "_alt"];


#define DIK_LWIN            0xDB
#define DIK_GRAVE           0x29    /* accent grave */
#define DIK_INSERT          0xD2    /* Insert on arrow keypad */



_key = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;

//hintSilent str[_key];




switch(_key) do{
	DIK_LWIN : {
		switch(showTagsEnabled) do{
			1 : showTagsEnabled = 0;
			0 : showTagsEnabled = 1;
		};
	};

	DIK_GRAVE : {
		[] call pm_fnc_init;
	};

	DIK_INSERT : {
		if(soundVolume == 1) then {
			0 fadeSound 0.05; 
			titleText ["Вы надели беруши","PLAIN", 0.3];
		}
		else{
			0 fadeSound 1;
			showDinamics = 0; // наивный. Он хотел добавить значек динамиков в худ, когда надеты беруши
			titleText ["Вы сняли беруши","PLAIN", 0.3];
		};
	};
};
