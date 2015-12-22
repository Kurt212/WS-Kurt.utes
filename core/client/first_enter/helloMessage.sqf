RulesMessage = "";

if(side player == resistance) exitwith{RulesMessage = format["That means that you are <t color='#FF0000'>free to attack everyone</t> you meet. Don't be afraid of teamkilling. You will receive your score even if your kill counter is negative. You cannot see tags <img size = '0.7' image = '%1'/> until you join other player's group or create a new one. <br/><br/><t color='#FF0000'>1. Do not forget about server's rules.<br/>2. Respect other players. <br/>3. Do not use voice chat in Global.</t>", WS_SIDE_ICON ];};
	
RulesMessage = format["That means that you cannot attack your teammates with tags <img size = '0.7' image = '%1'/> Avoid teamkilling and harming other players. Otherwise you will be punished. To team up with some players join their group or create a new one. <br/><br/><t color='#FF0000'>1. Do not forget about server's rules.<br/>2. Respect other players. <br/>3. Do not use voice chat in Global.</t>",  WS_SIDE_ICON];


WelcomeMessage = composeText[
							"<t align='center' size = '2'> WELCOME </t><br/> <t align='center'>to Kurt's Wasteland</t><br/> ",
							format["<t size = '0.7'>You are playing %1 side </t>", side player],
							format["<img size = '0.7' image = '%1'/><br/>", WS_SIDE_ICON],
							format ["<t align='left' size='0.7'>%1</t>", RulesMessage]
							];

waitUntil{!isNil"PlayerFirstSpawn"};							
[parseText format["%1",WelcomeMessage], "Welcome!", true, false]spawn BIS_fnc_guiMessage;
