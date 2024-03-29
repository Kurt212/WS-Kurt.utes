Spawn_Markers = [];

_i = 0;
while{!((getMarkerPos format["Spawn_%1", _i]) isEqualTo [0,0,0])} do
{
	Spawn_Markers pushback format["Spawn_%1", _i];
	_i = _i + 1;
};

waituntil{!isNil"towns"};


{
	private["_trigger"];
	_p = getMarkerPos _x;
	_distance = 10000;
	{
		if((_p distance _x) < _distance) then {_distance = _p distance _x; _trigger = _x;};
	}foreach towns;
	_markers = _trigger getVariable "Markers";
	if(isNil"_markers")  then {_markers = []; _trigger setVariable ["Markers", _markers];};
	_markers pushback _x;
	_trigger setVariable ["Markers", _markers];
}foreach Spawn_Markers;


Spawn_Objects_Positions = 
[
	[2938.25,4548.8,0.538673], // kameny base
	[2937.71,4542.38,0.534885], // kameny base
	[2958.46,4525.7,0.27013], // kameny base
	[2960.36,4528.31,0.672581], // kameny base
	[2962.08,4531.35,0.27013], // kameny base
	[2964.21,4534.62,0.27013], // kameny base
	[2956.42,4523.19,0.27013], // kameny base
	[2975.55,4523.32,9.91303], // kameny base
	[2968.88,4517.77,9.91303], // kameny base
	[2972.34,4524.99,9.91303], // kameny base
	[2975.34,4523.03,9.91303], // kameny base
	[2953.98,4490.94,1.84778], // kameny base
	[2957.03,4499.33,1.84778], // kameny base
	[2953.37,4495.38,1.84778], // kameny base
	[2964.69,4492.04,1.84778], // kameny base
	[2965.06,4495.74,1.84778], // kameny base
	[2960.31,4488.14,1.84778], // kameny base
	[2953.48,4496.39,4.5478], // kameny base
	[2953.91,4490.81,4.5478], // kameny base
	[2964.66,4495.89,4.5478], // kameny base
	[2964.9,4491.11,4.5478], // kameny base
	[2960.4,4488.53,4.54781], // kameny base
	[3145.15,4318.42,0.340782], // curch
	[3141.4,4305.74,0.569105], // curch
	[3195.09,4599.67,0.402104], // factory
	[3206.04,4602,0.77066], // factory
	[3284.24,4330.2,0.547197], // farm
	[3274.43,4328.66,0.531588], // farm
	[3258.15,4318.98,0.528297], // farm
	[3461.6,4426.61,0.765074], // farm 2
	[3465.32,4432.71,0.831995], // farm 2
	[3486.59,4335.13,0.994692], // house kameny
	[3483.33,4339.66,1.77922], // house kameny
	[3482.7,4339.46,5.1977], // house kameny
	[3487.15,4336.11,4.49539], // house kameny
	[3531.44,4271.42,0.876387], // farm 3
	[3538.99,4270.29,0.621283], // farm 3
	[3696.2,4121.68,0.740536], //factory 2
	[3687.62,4120.82,0.542923], // factory 2
	[4294.94,3182.88,0.73163], //farm 4
	[4286.35,3176.41,0.735586], //farm 4
	[4282.3,3160.61,0.74378], //farm 4
	[4227.69,3244.73,0.491516], //house strelka
	[4236.11,3243.4,0.68655], //house strelka	
	[4230.49,3245.67,4.0593], //house strelka	
	[4235.5,3242.21,3.95367], //house strelka
	[3999.62,3121.49,0.308111], //house field
	[4005.47,3126.13,0.00109482], //house field
	[3891.31,3300.08,0.195797], //house strelka base
	[3891.6,3300,3.06129], //house strelka base
	[3883.11,3325.13,0.261436], //house strelka base 2
	[3868.33,3304.48,0.267221], // strelka base
	[3867.3,3301.15,0.271206], // strelka base
	[3865.84,3298.41,0.274473], // strelka base
	[3864.75,3295.4,0.278082], // strelka base
	[3856.65,3308.75,0.267242], // strelka base
	[3855.57,3305.6,0.271011], // strelka base
	[3854.68,3302.57,0.274635], // strelka base
	[3853.45,3299.51,0.278292], // strelka base
	[3842.57,3314.27,0.267235], // strelka base
	[3841.73,3311.02,0.271116], // strelka base
	[3840.67,3308.27,0.274405], // strelka base
	[3839.43,3305.19,0.278093], // strelka base
	[3825.63,3320.88,3.68144], // strelka base
	[3868.44,3387.95,0.331997], // strelka base
	[3870.39,3380.67,3.68524], // strelka base
	[3867.35,3385.24,3.70049], // strelka base
	[3896.87,3383.73,0.396635], // strelka base
	[3890.14,3381.57,0.327555], // strelka base
	[3911.06,3383.03,0.374784], // strelka base
	[3910.22,3371.5,0.392082], // strelka base
	[3902.68,3374,0.280556], // strelka base
	[3920.89,3378.83,0.544792], // strelka base
	[3931.54,3371.56,0.918152], // strelka base
	[3929.72,3387.31,1.00036], // strelka base
	[3933.27,3375.75,4.9159], // strelka base
	[3927.52,3359.93,4.15676], // strelka base
	[3912.81,3365.38,4.40336], // strelka base
	[3895.6,3370.52,4.26513], // strelka base
	[3896.82,3382.64,4.39385], // strelka base
	[3914.28,3383.07,4.60957], // strelka base
	[3897.88,3384.01,8.41795], // strelka base
	[3907.63,3372.71,8.53801], // strelka base
	[3922.01,3377.82,8.76475], // strelka base
	[3926.46,3366.98,8.56703], // strelka base
	[3932.48,3375.11,12.9021], // strelka base
	[3926.3,3368.75,12.5644], // strelka base
	[3913.49,3370.12,12.4574], // strelka base
	[3747.78,3202.56,0.40884], // LISAYA
	[3753.01,3202.12,0.540615], //LISAYA
	[3753.81,3195.84,0.499748], //LISAYA
	[3743.17,3182.03,0.12915], //LISAYA
	[3397.27,3548.05,0.135607], // hangar
	[3412.47,3541.01,0.162899], // hangar
	[3400.07,3526.29,0.0628891], // hangar
	[3425.79,3686.16,0.0821705], // hangar2
	[3434.83,3700.46,0.0821705], //hangar2
	[3419.45,3707.39,0.0821705], //hangar2
	[3486.77,3702.81,0.27771], // school
	[3503.48,3699.83,0.342129], //school
	[3483.2,3695.66,3.03515], // school
	[3503.02,3699.6,2.84527], // school
	[3503.67,3700.36,5.31919], //school
	[3485.09,3702.94,5.29531], //school
	[3763.68,3510.12,0.061985], //hangar3
	[3749.38,3513.27,0.061985], //hangar3
	[3746.93,3500.42,0.061985], //hangar3
	[3949.72,3556.21,0.139906], //hangar4
	[3941.1,3557.61,0.139906], //hangar4
	[3931.88,3550.43,0.139906], //hangar4
	[3949.78,3547.9,0.139906], //hangar4
	[3990.11,3551.3,0.0997658], //hangar5
	[3971.33,3537.25,0.17108], //hangar5
	[3985.97,3524.23,0.156359], //hangar5
	[4028.38,3553.03,0.0821686], //hangar6
	[4016.08,3543.1,0.0821686], //hangar6
	[4024.75,3527.31,0.0821686], //hangar6
	[3534.91,3564.27,0.084465], //fire station
	[3525.51,3562.79,0.0696716], //fire station
	[3542.47,3567.77,4.94107], //fire station
	[3542.42,3568.17,9.55023], //fire station
	[3543.58,3567.96,14.0033], //fire station
	[3416.4,3937.18,20.2591], // shpil'
	[3239.43,4075.54,0.956402], // house parking
	[3239.3,4075.71,4.39338], // house parking
	[2870.03,3865.9,0.485481], // house hill
	[2869.85,3861.17,0.209984], //house hill
	[2870.06,3860.91,3.12766], //house hill
	[4291.53,3351.9,0.634096], // supermarket
	[4295.31,3359.57,0.9594], // supermarket
	[4303.26,3359.26,0.566626], //supermarket
	[4297.39,3341.54,0.0686569] // supermarket
];

