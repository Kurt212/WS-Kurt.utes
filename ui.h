
	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 1e+038;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsbackground
		{
			class foodHIcon : w_RscPicture 
			{
				idc= -1;
				x = safeZoneX+safeZoneW-0.15;
				y = safeZoneY+safeZoneH-0.24;
				w = 0.05; h = 0.06;
				text = "source\foodIcon.paa";
			};
			
			class waterHIcon  : w_RscPicture 
			{
				idc= -1;
				x = safeZoneX+safeZoneW-0.15;
				y = safeZoneY+safeZoneH-0.18;
				w = 0.055; h = 0.07;
				text = "source\waterIcon.paa";

			};	
			
			class HealthHIcon : w_RscPicture 
			{
				idc= -1;
				x = safeZoneX+safeZoneW-0.14;
				y = safeZoneY+safeZoneH-0.1;
				w = 0.04; 
				h = 0.05;
				text = "source\healthIcon.paa";
			};
			class WaterMark : w_RscText 
			{
				idc= -1;
				text = "Wasteland by Kurt";
				sizeEx=0.05;
				size=1
				textcolor[] = {1, 1, 1, 0.5};
				
				x = safeZoneX+safeZoneW-0.5;y = safeZoneY+safeZoneH-0.1; 
				w = 0.3; h = 0.05;
			};
		};
		class controls
		{
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x = safeZoneX+safeZoneW-0.080;
				y = safeZoneY+safeZoneH-0.23;
				w=0.3;
				h=0.05;
				sizeEx=0.04;
				size=1;
				font="EtelkaNarrowMediumPro";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x = safeZoneX+safeZoneW-0.080;
				y = safeZoneY+safeZoneH-0.165;
				w=0.3;
				h=0.05;
				sizeEx=0.04;
				size=1;
				font="EtelkaNarrowMediumPro";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthtext
			{
				type=0;
				idc=23530;
				style=0;
				x = safeZoneX+safeZoneW-0.080;
				y = safeZoneY+safeZoneH-0.1;
				w=0.3;
				h=0.05;
				sizeEx=0.04;
				size=1;
				font="EtelkaNarrowMediumPro";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			class VehicleInfo : w_RscText
			{
				type=13;
				idc=212;
				style=0;
				size = 0.040;
				sizeEx=0.035;
				x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW))) + 0.1;
                y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH))) - 0.5;
				w = 0.3; h = 0.65;
				colorText[] = {1,1,1,1};
				lineSpacing = 17;
				colorBackground[] = {0,0,0,0};
				text = "";
				shadow = 2;
				class Attributes {
					align = "right";
				};			
			};
		};   
 	};	