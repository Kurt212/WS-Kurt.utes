class SettingsList {

	idd = 212;
	movingEnable = true;
	enableSimulation = true;
	class controlsBackground {
		
		class MainBG : w_RscPicture {
		
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			
			moving = true;
			
			x = 0.0; y = 0.1;
			w = 0.70; h = 0.30;
		
		};
		
		class MainTitle : w_RscText {
		
			idc = -1;
			text = "Settings menu";
			sizeEx = 0.04;
			
			x = 0.17; y = 0.13;
			w = 0.3; h = 0.05;
		
		};
		class ViewDistanceText : w_RscText {
		
			idc = -1;
			text = "View distance(min 200):";
			sizeEx = 0.03;
			
			x = 0.01; y = 0.19;
			w = 0.3; h = 0.05;
		
		};
		class ObjectViewDistanceText : w_RscText {
		
			idc = -1;
			text = "Object view distance  :";
			sizeEx = 0.03;
			
			x = 0.01; y = 0.24;
			w = 0.3; h = 0.05;
		
		};
		
	};
	
	class controls {
		class CloseButton : w_RscButton {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			size = 0.03;
			sizeEx = 0.03;
			x = 0.2; y = 0.31;
			w = 0.125; h = 0.06;
		};
		class ViewDistance: w_RscEdit {
			idc = 2222;
			sizeEx = 0.03;
			
			x  = 0.24; y = 0.2;
			w = 0.1; h = 0.030;
		};
		class ViewDistanceButton : w_RscButton {
			text = "Apply";
			onButtonClick = "[] spawn pm_fnc_viewdistance";
			x = 0.36; y = 0.195;
			w = 0.125; h = 0.05;
		};
		class ObjectViewDistance: w_RscEdit {
			idc = 3333;
			sizeEx = 0.03;
			
			x  = 0.24; y = 0.25;
			w = 0.1; h = 0.030;
		};
		class ObjectViewDistanceButton : w_RscButton {
			text = "Apply";
			onButtonClick = "[] spawn pm_fnc_objectviewdistance";
			x = 0.36; y = 0.245;
			w = 0.125; h = 0.05;
		};
		
	};

};