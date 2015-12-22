#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'player_system\item_list.sqf'";
	onUnload = "menuOpened = nil";
	class controlsBackground {
		
		class MainBG : w_RscPicture {
		
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			
			moving = true;
			
			x = 0.0; y = 0.1;
			w = 1.01; h = 0.685;
		
		};
		
		class MainTitle : w_RscText {
		
			idc = -1;
			text = "Игровое меню";
			sizeEx = 0.05;
			
			x = 0.28; y = 0.112;
			w = 0.3; h = 0.05;
		
		};
		
		
		class moneyIcon : w_RscPicture {
			
	  		idc = -1;
        	text = "\CA\misc\data\icons\picture_money_CA.paa";
        	x = 0.02; y = 0.32;
			w = 0.06; h = 0.06;
		};
		
		
		class waterIcon : w_RscPicture {
			
	  		idc = -1;
        	text = "source\waterIcon.paa";
        	x = 0.02; y = 0.19;
			w = 0.06; h = 0.07;
			
		};
		
		
		class foodIcon : w_RscPicture {
			
      		idc = -1;
        	text = "source\foodIcon.paa";
        	x = 0.02; y = 0.26;
			w = 0.06; h = 0.06;
		};
		
		
		class moneyText : w_RscText {
			
			idc = money_text;
			text = "";
			
			sizeEx = 0.035;
			
			x = 0.1; y = 0.323;
			w = 0.3; h = 0.05;
		};
		
		class foodText : w_RscText {
			
			idc = food_text;
			
			sizeEx = 0.035;
			text = "";
			
			x = 0.1; y = 0.265;
			w = 0.3; h = 0.05;
		};
		
		class waterText : w_RscText {
			
			idc = water_text;
			text = "";
			
			sizeEx = 0.035;
			
			x = 0.1; y = 0.205;
			w = 0.3; h = 0.05;
		};
		
		class HealthStatusInfo : w_RscText {
			text = "Your health status :";
			shadow = 1;
			sizeEx = 0.035;
			
			x = 0.02; y = 0.475;
			w = 0.3; h = 0.05;
		};
		
		
	};
	
	class controls {
	
		class itemList : w_Rsclist {
		
		idc = item_list;
		//onLBSelChanged = "[0] execvm 'player_system\itemList.sqf'";
		
		x = 0.492; y = 0.200;
		w = 0.231; h = 0.4;
		
		};
		/*
		class itemEdit : w_RscCombo {
		
		idc = item_edit;
		
		x = 0.49; y = 0.55;
		w = 0.235; h = 0.03;
		
		};
		*/
		
		class moneyInput: w_RscCombo {
			
			idc = money_value;
			
			x  = 0.02; y = 0.410;
			w = 0.1; h = 0.030;
		};
		
		class DropButton : w_RscButton {
			
			text = "Drop";
			onButtonClick = "[] spawn pm_fnc_drop";
			size = 0.026;
			sizeEx = 0.026;
			
			x = 0.610; y = 0.63;
			w = 0.125; h = 0.05;
			
		};
		
		class UseButton : w_RscButton {
			
			text = "Use";
			onButtonClick = "[] spawn pm_fnc_use";
			size = 0.026;
			sizeEx = 0.026;
			x = 0.48; y = 0.63;
			w = 0.125; h = 0.05;
			
		};
		
		class DropcButton : w_RscButton {

			text = "Drop Money";
			onButtonClick = "[] spawn pm_fnc_drop_money";
			size = 0.026;
			sizeEx = 0.026;
			
			x = 0.13; y = 0.405;
			w = 0.145; h = 0.05;
			
		};
		
		class CloseButton : w_RscButton {
			
			text = "Close";
			onButtonClick = "closeDialog 0;";
			size = 0.035;
			sizeEx = 0.035;
			x = 0.02; y = 0.7;
			w = 0.15; h = 0.075;
			
		};
		
		class GroupManagement : w_RscButton {
			text = "Group management";
			onButtonClick = "[] call Kurt_fnc_UIGroupMenuOpen;";
			
			x = 0.160; y = 0.63;
			w = 0.225; h = 0.05;
		};

		class  settings: w_RscButton {
			text = "Settings";
			onButtonClick = "[] spawn pm_fnc_settingslist";
		
			x = 0.02; y = 0.63;
			w = 0.125; h = 0.05;
		};
		
		class  CommonHealthStatus: w_RscText {
			idc = 81;
			style =   0x02;
			text = "Common";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = 0.02; y = 0.525;
			w = 0.08; h = 0.05;
		};
		class  HeadHealthStatus: w_RscText {
			idc = 82;
			style =   0x02;
			text = "Head";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;		
			
			x = 0.11; y = 0.525;
			w = 0.07; h = 0.05;
		};
		class  BodyHealthStatus: w_RscText {
			idc = 83;
			style =   0x02;
			text = "Body";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = 0.181; y = 0.525;
			w = 0.07; h = 0.05;
		};
		class  HandsHealthStatus: w_RscText {
			idc = 84;
			style =   0x02;
			text = "Hands";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = 0.251; y = 0.525;
			w = 0.07; h = 0.05;
		};
		class LegsHealthStatus: w_RscText {
			idc = 85;
			style =   0x02;
			text = "Legs";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = 0.322; y = 0.525;
			w = 0.07; h = 0.05;
		};

	};

};