//#define XCoord 0.25
#define XCoord (10 * GUI_GRID_W + GUI_GRID_X)
#define YCoord (4.5 * GUI_GRID_H + GUI_GRID_Y - 0.1)


class SettingsList {

	idd = 212;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "_this execVM 'player_system\settings_list.sqf';";
	class controlsBackground {
		
		class Title : RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "Настройки WASTELAND";

			x = XCoord; y = YCoord + 0.11 - (11 / 250);
			w = 0.492; h = (1 / 25);
		};

		class MainBackground : RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.76};

			x = XCoord;	y = YCoord + 0.11;
			w = 0.492;	h = 0.2;
		};		

		class ViewDistanceText : RscText {
		
			idc = -1;
			text = "View distance(min 200)";
			sizeEx = 0.03;
			
			x = XCoord + 0.01; y = YCoord + 0.14;
			w = 0.3; h = 0.05;
		
		};

		class ObjectViewDistanceText : RscText {
	
			idc = -1;
			text = "Object view distance";
			sizeEx = 0.03;
			
			x = XCoord + 0.01; y = YCoord + 0.185;
			w = 0.3; h = 0.05;
		};

		class TagsDrawDistanceText : RscText {
		
			idc = -1;
			text = "Tags draw distance";
			sizeEx = 0.03;
			
			x = XCoord + 0.01; y = YCoord + 0.235;
			w = 0.3; h = 0.05;
		};
		
	};
	
	class controls {

		class ViewDistance: RscEdit {
			idc = 1111;
			sizeEx = 0.03;

			x  = XCoord + 0.24; y = YCoord + 0.15;
			w = 0.1; h = 0.030;
		};

		class ViewDistanceButton : RscButtonMenu {
			idc = -1;

			text = "Apply";
			onButtonClick = "[1] execVM 'player_system\func\settings.sqf'";
			x = XCoord + 0.36; y = YCoord + 0.145;
			w = 0.1; h = 0.04;	
		};

		class ObjectViewDistance: RscEdit {
			idc = 2222;
			sizeEx = 0.03;
			
			x  = XCoord + 0.24; y = YCoord + 0.20;
			w = 0.1; h = 0.030;
		};

		class ObjectViewDistanceButton : RscButtonMenu {
			idc = -1;

			text = "Apply";
			onButtonClick = "[2] execVM 'player_system\func\settings.sqf'";
			x = XCoord + 0.36; y = YCoord + 0.195;
			w = 0.1; h = 0.04;	
		};

		class TagsDrawDistance: RscEdit {
			idc = 3333;
			sizeEx = 0.03;
			
			x  = XCoord + 0.24; y = YCoord + 0.25;
			w = 0.1; h = 0.030;
		};

		class TagsDrawDistanceButton : RscButtonMenu {
			idc = -1;

			text = "Apply";
			onButtonClick = "[3] execVM 'player_system\func\settings.sqf'";
			x = XCoord + 0.36; y = YCoord + 0.245;
			w = 0.1; h = 0.04;	
		};
		
		class CloseButton : RscButtonMenu {
			idc = -1;

			text = "Close";
			onButtonClick = "closeDialog 0;";

			x = XCoord; y = YCoord + 0.31 + (11 / 2500);
			w = 0.1; h = 0.04;	
		};
	};

};