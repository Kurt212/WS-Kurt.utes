params["_Dialog"];

#define cViewDistance 1111
#define cObjectviewDistance 2222
#define cTagsDrawDistance 3333

_VD = _Dialog displayCtrl cViewDistance;
_VD ctrlSetTooltip format ["Current = %1", ViewDistance];

_OVD = _Dialog displayCtrl cObjectviewDistance;
_OVD ctrlSetTooltip format ["Current = %1", getObjectViewDistance select 0];

_TDD = _Dialog displayCtrl cTagsDrawDistance;
_TDD ctrlSetTooltip format ["Current = %1", WSVAR_TAGS_DRAW_DISTANCE];

menuOpened = true;
