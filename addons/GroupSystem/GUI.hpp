#include "include.sqf"
#include "common.hpp"

class k_RscPicture {

	idc = -1; 
	type = CT_STATIC;
	style = ST_PICTURE;
	
	font = FontM;
	sizeEx = 0.023;
	
	colorBackground[] = {1,1,1,1};
	colorText[] = {};
	
	x = 0.0; y = 0.0;
	w = 0.2; h = 0.2;
	
	text = "";
	
}; 


class k_RscText {
		idc = -1;
		
		type = CT_STATIC;
		style = ST_CENTER;
			
		text = "";
			
		sizeEx = 0.035;
		font = FontM;
			
		colorBackground[] = {1,1,1,0};
		colorText[] = {1,1,1,1};	
	
};

class k_Rsclist
{
		type = CT_LISTBOX;
		style = 69;
		idc = -1;
		text = "";
		w = 0.275;
		h = 0.04;
		//colorSelect[] = {0, 0, 0, 1};
		colorSelect[] = {1, 1, 1, 0.7};
		colorText[] = {1, 1, 1, 0.7};
		colorBackground[] = {1, 1, 1, 0};
		colorSelectBackground[] = {0.40, 0.43, 0.28, 0.5};
		colorScrollbar[] = {0.2,0.2 0.2, 1};
		arrowEmpty = "addons\GroupSystem\src\ui_arrow_combo_ca.paa";
		arrowFull = "addons\GroupSystem\src\ui_arrow_combo_active_ca.paa";
		wholeHeight = 0.45;
		rowHeight = 0.04;
		color[] = {1, 1, 1, 1};
		colorActive[] = {0,0,0,1};
		colorDisabled[] = {0,0,0,0.3};
		shadowtext = true;
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.03;
		soundSelect[] = {"",0.1,1};
		soundExpand[] = {"",0.1,1};
		soundCollapse[] = {"",0.1,1};
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		
		class ListScrollBar
		{
			color[] = {1, 1, 1, 1};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 1};
			thumb = "addons\GroupSystem\src\ui_scrollbar_thumb_ca.paa";
			arrowFull = "addons\GroupSystem\src\ui_arrow_top_active_ca.paa";
			arrowEmpty = "addons\GroupSystem\src\ui_arrow_top_ca.paa";
			border = "addons\GroupSystem\src\ui_border_scroll_ca.paa";
		};
		
		class ResfreshButton
		{
			type = CT_BUTTON;
			style = ST_CENTER;
		};
		
};

class k_RscButton
{
 type = CT_BUTTON;
 style = ST_LEFT;
 x = 0; y = 0; w = 0.3; h = 0.1;
 text = "";
 font = "EtelkaNarrowMediumPro";
 size = 0.035;
 sizeEx = 0.035;
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0.075,0.094,0.075,0.8};
 colorBackground[] = {0.075,0.094,0.075,0.8};
 colorBackgroundDisabled[] = {0.075,0.094,0.075,0.8};
 colorBackgroundActive[] = {0.075,0.094,0.075,0.8};
 //offsetX = 0.004;
 //offsetY = 0.004;
 offsetX = 0;
 offsetY = 0;
 offsetPressedX = 0.002;
 offsetPressedY = 0.002;
 colorFocused[] = {0.075,0.094,0.075,0.8};
 colorShadow[] = {0,0,0,1};
 shadow = 0;
 colorBorder[] = {0,0,0,1};
 borderSize = 0;
 soundEnter[] = {"",0.1,1};
 soundPush[] = {"",0.1,1};
 soundClick[] = {"",0.1,1};
 soundEscape[] = {"",0.1,1};
};

class k_RscEdit
{
  	idc = -1;
  	type = CT_EDIT;
  	style = ST_LEFT;
  	x = 0;
  	y = 0;
  	w = .2;
  	h = .4;
  	sizeEx = .02;
  	font = "EtelkaNarrowMediumPro";
  	
  	text = "";
  	colorText[] = {1,1,1,1};
  	colorBackground[] = {0,0,0,0.4};
	colorSelection[] = {1,1,1,0.25};
	colorDisabled[] = {0,0,0,0};
  	autocomplete = false;
};

//#define XCoord (safeZoneX+safeZoneW*0.35)
//#define YCoord (safeZoneY+safeZoneH*0.3)
#define XCoord (0.0)
#define YCoord (0.1)

class GroupSystem {

	idd = UIDISPLAY;
	
	movingEnable = false;
	class controlsBackground {
		
		class MainBG : k_RscPicture {
		
			idc = -1;
			text = "addons\GroupSystem\src\ui_background_controlers_ca.paa";
			
			x = XCoord; y = YCoord;
			w = 1.2; h = 0.685;
		
		};
		
		class Credits : k_RscText {
			idc = -1;

			text = "By Kurt";			

			x = XCoord + .73; y = YCoord + .59;
			w = .1; h = .1;
			
		};
	};
	
	class controls {
		
		class GroupList : k_Rsclist {
		
			idc = UIGROUPLIST;
			onLBSelChanged = "_this call Kurt_fnc_UIGroupInfoShow; params['_ctrl', '_index']; _data = _ctrl lbData _index;";
	
			x = XCoord + .05; y = YCoord + .1;
			w = 0.35; h = 0.4;
		
		};
		
		class GroupInfo : k_RscText{
			idc = UIGROUPINFO;
			type=13;
			style=0;
			colorBackground[] = {0,0,0,0.1};
			colorText[] = {1,1,1,1};
			
			shadow = 1;
			size = 0.03;
			sizeEx=0.03;	
			text = "";
			x = XCoord + .45; y = YCoord + .1;
			w = 0.35; h = 0.4;
			class Attributes {
				font = "EtelkaNarrowMediumPro";
				align = "left";
			};
		};
		
		class RefreshButton : k_RscButton {
			idc = 202;
			text = "Refresh";
			onButtonClick = "call Kurt_fnc_UIGroupRefresh;";
			style = ST_CENTER;
			size = 0.035;
			sizeEx = 0.035;
			x = XCoord + .55; y = YCoord + .605;
			w = 0.125; h = 0.06;
			
		};
		
		class PassWordLine : k_RscEdit{
			idc = 203;
			style = ST_LEFT+ST_FRAME;
			sizeEx = 0.03;
			x = XCoord + .05; y = YCoord + .525;
			w = 0.22; h = 0.04;
			
		};
		
		class JoinButton : k_RscButton {
			idc = 204;
			text = "Join";
			style = ST_CENTER;
			onButtonClick = "_dialog = findDisplay 9500; _line = _dialog displayCtrl 203; _password = ctrlText _line; _list = _dialog displayCtrl 200; _index = lbCurSel _list; _id = _list lbData(_index); _res = [_id, _password] call Kurt_fnc_GroupJoin; call Kurt_fnc_UIGroupRefresh; [_dialog displayCtrl 201, _index] call Kurt_fnc_UIGroupInfoShow;";
			size = 0.035;
			sizeEx = 0.035;
			x = XCoord + .3; y = YCoord + .52;
			w = .1; h = 0.045;
			
		};

		class CloseButton : k_RscButton {
			idc = -1;
			text = "Close";
			style = ST_CENTER;
			onButtonClick = "closeDialog 0;";
			size = 0.035;
			sizeEx = 0.035;
			x = XCoord + .05; y = YCoord + .605;
			w = 0.125; h = 0.06;
		};

		class CreateGroup : k_RscButton {
			idc = -1;
			text = "Create new";
			onButtonClick = "createDialog 'CreateGroup'; disableSerialization; _dialog = findDisplay 9501; _l = _Dialog displayCtrl 201; _l ctrlShow false;";
			style = ST_CENTER;
			size = 0.035;
			sizeEx = 0.035;
			x = XCoord + .2; y = YCoord + .605;
			w = 0.125; h = 0.06;
		};
		
		class LeaveGroup : k_RscButton {
			idc = -1;
			text = "Leave group";
			onButtonClick = "call Kurt_fnc_GroupLeave;";
			style = ST_CENTER;
			size = 0.035;
			sizeEx = 0.035;
			x = XCoord + .35; y = YCoord + .605;
			w = 0.125; h = 0.06;
		};
	};
};

#define XCoord (safeZoneX+safeZoneW*0.35 + .17)
#define YCoord (safeZoneY+safeZoneH*0.3 + .12)


class CreateGroup {

	idd = UICGDISPLAY;
	
	movingEnable = false;
	
	class controlsBackground {
		
		class MainBG : k_RscPicture {
		
			idc = -1;
			text = "addons\GroupSystem\src\ui_background_controlers_ca.paa";
			
			x = XCoord; y = YCoord;
			w = 0.75; h = 0.3;
		
		};
		
		class MainTitle : k_RscText {
		
			idc = -1;
			text = "Create a new group";
			sizeEx = 0.04;
			
			x = XCoord + .145; y = YCoord + .025;
			w = 0.3; h = 0.05;
		
		};
		class GroupNameText : k_RscText {
		
			idc = -1;
			text = "Name of your group: ";
			sizeEx = 0.035;
			style = ST_LEFT;
			x = XCoord + .015; y = YCoord + .07;
			w = 0.3; h = 0.05;
		
		};
	};
	class controls {
		class GroupNameLine : k_RscEdit{
			idc = 203;
			style = ST_LEFT+ST_FRAME;
			sizeEx = 0.03;
			x = XCoord + .28 ; y = YCoord + .08;
			w = 0.27; h = 0.035;
		};
		
		class PassWordLine : k_RscEdit{
			idc = 201;
			style = ST_LEFT+ST_FRAME;
			sizeEx = 0.03;
			x = XCoord + .28 ; y = YCoord + .14;
			w = 0.27; h = 0.035;
		};
		
		class CheckBox : k_RscButton{
			idc = 202;
			text = "Enable Password";
			style = ST_CENTER;
			x = XCoord + .018; y = YCoord + .14;
			w = 0.23; h = 0.035;
			size = 0.025;
			sizeEx = 0.035;
			onButtonClick = "_ctr = _this select 0; _Dialog = findDisplay 9501; _l = _Dialog displayCtrl 201; if(ctrlText _ctr == 'Enable Password') then {_ctr ctrlSetText 'Disable Password'; _l ctrlShow true;} else {_ctr ctrlSetText 'Enable Password'; _l ctrlShow false; _l ctrlSetText '';};";
		};
		
		class CloseButton : k_RscButton {
			idc = -1;
			text = "Close";
			style = ST_CENTER;
			onButtonClick = "closeDialog 0;";
			size = 0.035;
			sizeEx = 0.04;
			x = XCoord + .018; y = YCoord + .2;
			w = 0.125; h = 0.05;
		};
		
		class CreateBtn : k_RscButton{
			idc = 204;
			text = "Create";
			style = ST_CENTER;
			x = XCoord + .36; y = YCoord + .2;
			w = 0.14; h = 0.05;
			size = 0.035;
			sizeEx = 0.04;
			onButtonClick = "_Dialog = findDisplay 9501; _gname = ctrlText (_Dialog displayCtrl 203); if(_gname == '') exitwith {}; _gpassword = ctrlText (_Dialog displayCtrl 201); [_gname, _gpassword] call Kurt_fnc_GroupCreate; call Kurt_fnc_UIGroupRefresh; closeDialog 0;";
		};
		
	};
	
};

