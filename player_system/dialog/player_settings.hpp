#include "player_sys.sqf"

#define COORDX (6 * GUI_GRID_W + GUI_GRID_X)
#define COORDY (4.5 * GUI_GRID_H + GUI_GRID_Y - 0.1)

//(11 / 250)

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'player_system\item_list.sqf'";
	onUnload = "menuOpened = nil";
	class controlsBackground {

		class Title : RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "Игровое меню";

			x = COORDX; y = COORDY + 0.11 - (11 / 250);
			w = 0.723; h = (1 / 25);
		};

		class MainBackground : RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.76};

			x = COORDX;	y = COORDY + 0.11;
			w = 0.492 - (11 / 2500);
			//h = 16 * GUI_GRID_H;
			h = 0.36;
		};		
				
		class waterIcon : RscPicture {
			
	  		idc = -1;
        	text = "source\waterIcon.paa";
        	x = COORDX + 0.02; y = COORDY + 0.14;
			w = 0.06; h = 0.07;
			
		};
		
		class foodIcon : RscPicture {
			
      		idc = -1;
        	text = "source\foodIcon.paa";
        	x = COORDX + 0.02; y = COORDY + 0.21;
			w = 0.06; h = 0.06;
		};
		
		class moneyIcon : RscPicture {
			
	  		idc = -1;
        	text = "source\picture_money_CA.paa";
        	x = COORDX + 0.02; y = COORDY + 0.27;
			w = 0.06; h = 0.06;
		};

		class waterText : RscText {
			
			idc = water_text;
			text = "";
			
			sizeEx = 0.035;
			
			x = COORDX + 0.1; y = COORDY + 0.155;
			w = 0.3; h = 0.05;
		};
				
		class foodText : RscText {
			
			idc = food_text;
			
			sizeEx = 0.035;
			text = "";
			
			x = COORDX + 0.1; y = COORDY + 0.215;
			w = 0.3; h = 0.05;
		};
		
		class moneyText : RscText {
			
			idc = money_text;
			text = "";
			
			sizeEx = 0.035;
			
			x = COORDX + 0.1; y = COORDY + 0.273;
			w = 0.3; h = 0.05;
		};
		
		class HealthStatusInfo : RscText {
			text = "Your health status :";
			shadow = 1;
			sizeEx = 0.035;
			
			x = COORDX + 0.02; y = COORDY + 0.355;
			w = 0.3; h = 0.05;
		};
	};
	
	class controls {

		class itemList : RscListBox {
			idc = item_list;
			colorBackground[] = {0,0,0,0.76};
			
			x = COORDX + 0.492; y = COORDY + 0.11;
			w = 0.231; h = 0.4;
		
		};

		class DropButton : RscButtonMenu {
			idc = -1;

			text = "Drop";
			onButtonClick = "[2, _this select 0] execVM 'player_system\func\drop.sqf'";
			
			x = COORDX + 0.623; y = COORDY + 0.51 + (11 / 2500);
			w = 0.1; h = 0.04;		
		};
		
		class UseButton : RscButtonMenu {
			idc = -1;	

			text = "Use";
			onButtonClick = "[_this select 0] execVM 'player_system\func\use.sqf'";

			x = COORDX + 0.492; y = COORDY + 0.51 + (11 / 2500);
			w = 0.1; h = 0.04;
		};
		
		class moneyInput: RscCombo {
			idc = money_value;
			
			x = COORDX + 0.22; y = COORDY + 0.155;
			w = 0.1; h = 0.035;
		};
		
		class DropMoneyButton : RscButtonMenu {
			idc = -1;	
			
			text = "Drop money";
			onButtonClick = "[1, _this select 0] execVM 'player_system\func\drop.sqf'";
			
			x = COORDX + 0.33; y = COORDY + 0.155;
			//w = 0.125; h = 0.05;		
		};
		
		class  CommonHealthStatus: RscText {
			idc = 81;
			style =   0x02;

			text = "Common";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = COORDX + 0.02; y = COORDY + 0.405;
			w = 0.08; h = 0.05;
		};

		class  HeadHealthStatus: RscText {
			idc = 82;
			style =   0x02;

			text = "Head";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;		
			
			x = COORDX + 0.11; y = COORDY + 0.405;
			w = 0.07; h = 0.05;
		};

		class  BodyHealthStatus: RscText {
			idc = 83;
			style =   0x02;

			text = "Body";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = COORDX + 0.181; y = COORDY + 0.405;
			w = 0.07; h = 0.05;
		};

		class  HandsHealthStatus: RscText {
			idc = 84;
			style =   0x02;

			text = "Hands";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = COORDX + 0.251; y = COORDY + 0.405;
			w = 0.07; h = 0.05;
		};

		class LegsHealthStatus: RscText {
			idc = 85;
			style =  0x02;

			text = "Legs";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.03;
			shadow = 1;
			
			x = COORDX + 0.322; y = COORDY + 0.405;
			w = 0.07; h = 0.05;
		};
		
		class  SettingsButton: RscButtonMenu {
			idc = -1;	

			text = "Settings";
			onButtonClick = "createDialog 'SettingsList';";
		
			x = COORDX; y = COORDY + 0.47 + (11 / 2500);
			w = 0.125; h = 0.04;
		};

		class GroupManagement : RscButtonMenu {
			idc = -1;	

			text = "Group";
			onButtonClick = "[] call Kurt_fnc_UIGroupMenuOpen;";
			
			x = COORDX + 0.125 + (11 / 2500); y = COORDY + 0.47 + (11 / 2500);
			w = 0.1; h = 0.04;
		};

		class CloseButton : RscButtonMenu {
			idc = -1;	
			
			text = "Close";
			onButtonClick = "closeDialog 0;";

			x = COORDX; y = COORDY + 0.51 + (22 / 2500);
			w = 0.1; h = 0.04;		
		};

	};

};