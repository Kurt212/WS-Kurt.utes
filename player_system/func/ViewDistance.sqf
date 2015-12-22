disableSerialization;

_Dialog = findDisplay 212;

_ctrl = _Dialog displayCtrl 2222;

_number = parseNumber ctrlText _ctrl;

setViewDistance _number;