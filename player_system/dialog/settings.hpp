#define XCoord 0.25
#define YCoord 0.35


class SettingsList {

	idd = 212;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "_this execVM 'player_system\settings_list.sqf';";
	class controlsBackground {
		
		class MainBG : w_RscPicture {
		
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			
			moving = true;
			
			x = XCoord; y = YCoord;
			w = 0.70; h = 0.40;
		
		};
		
		class MainTitle : w_RscText {
		
			idc = -1;
			text = "Settings menu";
			sizeEx = 0.04;
			
			x = XCoord + 0.17; y = YCoord + 0.03;
			w = 0.3; h = 0.05;
		
		};
		class ViewDistanceText : w_RscText {
		
			idc = -1;
			text = "View distance(min 200):";
			sizeEx = 0.03;
			
			x = XCoord + 0.01; y = YCoord + 0.09;
			w = 0.3; h = 0.05;
		
		};
		class ObjectViewDistanceText : w_RscText {
		
			idc = -1;
			text = "Object view distance  :";
			sizeEx = 0.03;
			
			x = XCoord + 0.01; y = YCoord + 0.14;
			w = 0.3; h = 0.05;
		};
		class TagsDrawDistanceText : w_RscText {
		
			idc = -1;
			text = "Tags draw distance  :";
			sizeEx = 0.03;
			
			x = XCoord + 0.01; y = YCoord + 0.19;
			w = 0.3; h = 0.05;
		};
		
	};
	
	class controls {
		class CloseButton : w_RscButton {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			size = 0.03;
			sizeEx = 0.03;
			x = XCoord + 0.2; y = YCoord + 0.35;
			w = 0.125; h = 0.06;
		};
		class ViewDistance: w_RscEdit {
			idc = 1111;
			sizeEx = 0.03;
			
			x  = XCoord + 0.24; y = YCoord + 0.1;
			w = 0.1; h = 0.030;
		};
		class ViewDistanceButton : w_RscButton {
			text = "Apply";
			onButtonClick = "[1] execVM 'player_system\func\settings.sqf'";
			x = XCoord + 0.36; y = YCoord + 0.095;
			w = 0.125; h = 0.05;
		};
		class ObjectViewDistance: w_RscEdit {
			idc = 2222;
			sizeEx = 0.03;
			
			x  = XCoord + 0.24; y = YCoord + 0.15;
			w = 0.1; h = 0.030;
		};
		class ObjectViewDistanceButton : w_RscButton {
			text = "Apply";
			onButtonClick = "[2] execVM 'player_system\func\settings.sqf'";
			x = XCoord + 0.36; y = YCoord + 0.145;
			w = 0.125; h = 0.05;
		};
		class TagsDrawDistance: w_RscEdit {
			idc = 3333;
			sizeEx = 0.03;
			
			x  = XCoord + 0.24; y = YCoord + 0.2;
			w = 0.1; h = 0.030;
		};
		class TagsDrawDistanceButton : w_RscButton {
			text = "Apply";
			onButtonClick = "[3] execVM 'player_system\func\settings.sqf'";
			x = XCoord + 0.36; y = YCoord + 0.195;
			w = 0.125; h = 0.05;
		};
		
	};

};