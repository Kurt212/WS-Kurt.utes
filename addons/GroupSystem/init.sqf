/*
	Author : Kurt
	
	Arguments :
	_this select 0 true/false Bluefor
	_this select 1 true/false Redfor
	_this select 2 true/false Independent
	_this select 3 true/false Civilian

*/

//Тут я поменял side player на WSVAR_SIDE

#include "include.sqf"

//Kurt_GroupSystem_SidesEnabled = _this;

if !(IsDedicated) then{
    Kurt_fnc_GroupCreate = {
        /*
         Arguments:
         _this select 0 (STRING) - name of the group
         _this select 1 (STRING) - the group password
		
         Return:
         (BOOL) - fnc's success
         */
        private["_name", "_password", "_g"];
        _g = CreateGroup (WSVAR_SIDE);
        _name = _this select 0;
        _password = _this select 1;
        _g SetVariable["Kurt_Group_Info", [_name, _password], true];
        [player] join _g;
        _return = groupId (group player) == groupId _g;
		if(!_return) then{
			systemchat "Can not create group!";
		};
		_return
	};
       
    Kurt_fnc_GroupLeave = {
		/*
		Return:
         (BOOL) - fnc's success
		*/
		_group_left = group player;
		_was_leader = (leader _group_left) == player;
		private "_var";
		if(count units _group_left > 1) then{_var = _group_left getVariable "Kurt_Group_Info";};
        [player] joinsilent grpNull;
		if(_was_leader and !IsNull _group_left and !isNil "_var") then{
			_group_left setVariable ["Kurt_Group_Info", _var, true];
		};		
		_return = groupId (group player) != groupId _group_left;
		if(!_return) then{
			systemchat "Can not leave group";
		};
		_return
    };
       
    Kurt_fnc_GroupJoin = {
        /*
         Arguments:
         _this select 0 (STRING) - groupId of the needed group
         _this select 1 (STRING) - the password
                       
         Return:
         (BOOL) - fnc's success
         */
        private["_tmp", "_password", "_g", "_return"];
        _tmp = false;
        {if(groupId _x == (_this select 0)) exitwith{_tmp = true; _g = _x;}; } foreach allGroups;
        if !(_tmp) exitwith{false};
        _password = _this select 1;
        if(_password == ((_g GetVariable "Kurt_Group_Info") select 1)) then {_return = true; [player] joinsilent _g;}
		else {_return = false;};
		if(!_return) then{
			systemchat "Can not join group!";
		};
        _return
	};
	//main fnc
	Kurt_fnc_UIGroupMenuOpen = {
		private["_side_index", "_dialog", "_grvalue", "_group_array", "_tmp", "_gr_name", "_index", "_txt"];
		_side_index = call{
			if(WSVAR_SIDE == WEST) exitwith {0};
			if(WSVAR_SIDE == EAST) exitwith {1};
			if(WSVAR_SIDE == RESISTANCE) exitwith {2};
			if(WSVAR_SIDE == CIVILIAN) exitwith {3};
		};
		
		if !(Kurt_GroupSystem_SidesEnabled select _side_index) exitwith {};
		
		createdialog "GroupSystem"; disableSerialization;
		_dialog = findDisplay UIDISPLAY; _grvalue = _dialog displayCtrl UIGROUPLIST; _txt = _Dialog displayCtrl UIGROUPINFO; 
		_txt ctrlSetStructuredText parseText "Information : <br/>";
		_group_array = [];
		{_has_variable = _x getVariable "Kurt_Group_Info";  if(side _x == WSVAR_SIDE and !isNil "_has_variable") then {_group_array pushback _x};} foreach allGroups;
		
		
		for "_i" from 0 to (count _group_array - 1) do{
			_current_group = _group_array select _i;
			if(count units _current_group != 0) then{
				_gr_name = (_current_group getvariable "Kurt_Group_Info") select 0;
				_index = _grvalue lbadd _gr_name;
				_grvalue lbSetData [_index,  groupId _current_group];
			};
		};
	};
	
	Kurt_fnc_UIGroupRefresh = {
		private["_Dialog", "_grvalue", "_group_array", "_tmp", "_index", "_gr_name", "_txt"];
		_Dialog = findDisplay UIDISPLAY; _grvalue = _dialog displayCtrl UIGROUPLIST; _txt = _Dialog displayCtrl UIGROUPINFO; 
		lbClear _grvalue; _txt ctrlSetStructuredText parseText "Information : <br/>";
		_password_line = _Dialog displayCtrl 203; _password_line ctrlSetText "";
		
		_group_array = [];
		{_has_variable = _x getVariable "Kurt_Group_Info";  if(side _x == WSVAR_SIDE and !isNil "_has_variable") then {_group_array pushback _x};} foreach allGroups;
				
		for "_i" from 0 to (count _group_array - 1) do{
			_current_group = _group_array select _i;
			if(count units _current_group != 0) then{
				_gr_name = (_current_group getvariable "Kurt_Group_Info") select 0;
				_index = _grvalue lbadd _gr_name;
				_grvalue lbSetData [_index,  groupId _current_group];
			};
		};
		_grvalue lbSetCurSel 0;
		[_grvalue, 0] call Kurt_fnc_UIGroupInfoShow;
	};
	
	Kurt_fnc_GroupHasPassword = {
		/*
         Arguments:
         _this select 0 (STRING) - groupId of the needed group
                       
         Return:
         (BOOL) - if group has password in SYSTEM
		*/
		
		_id = _this select 0;
		
		_grp = call {
			private "_group";
			_group = grpNull;
			{_has_variable = _x getVariable "Kurt_Group_Info"; if((groupId _x == _id) and !isNil"_has_variable") exitwith{_group = _x;};} foreach allGroups;
			_group
		};
		
		if(IsNull _grp) exitwith{false};
		_password = ((_grp getVariable "Kurt_Group_Info") select 1);		
		if(_password == "") then {false}
		else {true};
	};
	
	Kurt_fnc_UIGroupInfoShow = {
		params["_ctrl", "_index"];
		private["_Dialog", "_data", "_txt", "_str", "_g", "_count"];
		_data = _ctrl lbData _index;
		
		if(_data == "") exitwith {};
		
		_g = call {
			private "_group";
			{if(groupId _x == _data) exitwith{_group = _x;};} foreach allGroups;
			_group
		};
		
		if(isNull _g) then{
			systemchat "Group is null!";
		};		
		
		_str = "Information : <br/>";
		_count = 0;
		{	
			_count = _count + 1;
			if(name _x == name player) then{_str = _str + format["<t color='#ffcc66'>%2.</t> <t color='#55b34f'>%1</t><br/>", name _x, _count];}
			else {_str = _str + format["<t color='#ffcc66'>%2.</t> %1<br/>", name _x, _count];};
		} foreach (units _g);
		if(_count == 0) then {systemchat "Group seems to be empty!"};
		_Dialog = findDisplay UIDISPLAY;
		_txt = _Dialog displayCtrl UIGROUPINFO; 
		_txt ctrlSetStructuredText parseText _str;	
		
		//активируем или дизактивируем поле пароля
		
		_has_password = [groupId _g] call Kurt_fnc_GroupHasPassword;
		_password_line = _Dialog displayCtrl 203;
		if(_has_password) then{
			_password_line ctrlSetText "";
			_password_line ctrlShow true;
		}
		else{
			_password_line ctrlSetText "";
			_password_line ctrlShow false;
		};
	};	
};
//["nam123e", "pass"] call Kurt_fnc_GroupCreate; call Kurt_fnc_UIGroupMenuOpen;
//a = cursorTarget; (group a) setVariable ["Kurt_Group_Info", ["name", "pass"], true];a = cursorTarget; (group a) setVariable ["Kurt_Group_Info", ["name", "pass"], true];
