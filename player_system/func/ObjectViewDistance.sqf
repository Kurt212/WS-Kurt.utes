disableSerialization;

_Dialog = findDisplay 212;

_ctrl = _Dialog displayCtrl 3333;

_number = parseNumber ctrlText _ctrl;

setObjectViewDistance _number;