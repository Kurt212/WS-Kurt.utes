//Спавним здания на острове и выставляем их

_position = [4298.9399,2617.1299,1.4];    
_l =  createvehicle["Land_Pier_small_F", _position, [], 0, "CAN_COLLIDE"];   
_azimut=308.328;    
_l setdir _azimut;

_position = [4464.5098,3078.1899, 0.0112462];
_azimut=316.522;
_vehicle="Land_LifeguardTower_01_F";
_l = _vehicle createvehicle _position;
_l setdir _azimut;

_position = [4478.3799,3079.55, 0.0220639];
_azimut=137.88901;
_vehicle="Land_Sun_chair_F";
_l = _vehicle createvehicle _position;
_l setdir _azimut;

_position = [4468.1001, 3067.71, 0.021562001];
_azimut= 138.8;
_vehicle= "Land_Sun_chair_F";
_l = _vehicle createvehicle _position;
_l setdir _azimut;


_position = [4509.52,3107.8301,0.0217623];
_azimut= 136.327;
_vehicle= "Land_Sun_chair_F";
_l = _vehicle createvehicle _position;
_l setdir _azimut;

_position = [4489.1001,3089.3601, 0.021515399];
_azimut= 137.282;
_vehicle= "Land_Sun_chair_F";
_l = _vehicle createvehicle _position;
_l setdir _azimut;


_position = [4521.5, 3119.9399, 0.0195763];
_azimut= 137.778;
_vehicle= "Land_Sun_chair_F";
_l = _vehicle createvehicle _position;
_l setdir _azimut;

_l =  "Land_LifeguardTower_01_F" createvehicle [4513.75,3126.2,0.0446086];
_l setdir 325.953;

_l =  "Land_Sun_chair_F" createvehicle [4532.77,3128.47,0.022905899];
_l setdir 134.948;

_l =  "Land_i_House_Small_03_V1_F" createvehicle [3751.3899,3199.9199,0.108902];
_l setdir 13.8035;

_l =  "Land_Carousel_01_F" createvehicle [4381.7002,3235.52,0];
_l setdir 0;

_l =  "Land_TreeBin_F" createvehicle [4380.6401,3239.97,0];
_l setdir 0;

_l =  "Land_i_Garage_V2_F" createvehicle [4168.54,3272.72,2.533234];
_l setdir 109.986;

_l =  "Land_i_Garage_V2_F" createvehicle [4236.2798,3265.24,2.89905];
_l setdir 286.32101;
_l setpos [(getpos _l select 0), (getpos _l select 1), (getpos _l select 2)+0.2];

_l =  "Land_u_House_Big_01_V1_F" createvehicle [4230.5601,3244.3701,1.1914901];
_l setdir 108.838;

_l =  "Land_Slide_F" createvehicle [4377.2402,3244.73,0];
_l setdir 0;

_l =  "Land_Swing_01_F" createvehicle [4372.9502,3240.8401,0];
_l setdir 333.76901;

_l =  "Land_Swing_01_F" createvehicle [4374.5698,3251.1599,0];
_l setdir 250.513;

_l =  "Land_SlideCastle_F" createvehicle [4386.46,3244.29,0];
_l setdir 0;

_l =  "Land_Unfinished_Building_01_F" createvehicle [3828.1899,3318.8,1.16215];
_l setdir 20.8936;

_l =  "Land_i_Stone_HouseBig_V2_F" createvehicle [3892.3799,3303.3899,0];
_l setdir 112.478;

_l =  "Land_i_Stone_Shed_V3_F" createvehicle [3882.03,3324.4099,0];
_l setdir 20.288099;

_l =  "Land_Chapel_Small_V2_F" createvehicle [4482.27,3324.49,0.62859303];
_l setdir 18.3304;

_l =  "Land_Grave_forest_F" createvehicle [4482.8599,3320.4399,0.0061264001];
_l setdir 288.547;

_l =  "Land_Grave_forest_F" createvehicle [4481.0698,3320.8701,0.0062103299];
_l setdir 288.547;
_l setpos [(getpos _l select 0), (getpos _l select 1), (getpos _l select 2)];

_l =  "Land_HumanSkeleton_F" createvehicle [4484.1699,3325.1201,-0.067958802];
_l setdir 342.36301;

_l =  "Land_Unfinished_Building_02_F" createvehicle [3871.9399,3383.1001,1.4411];
_l setdir 20.3057;


_l =  "Land_Cargo_House_V2_F" createvehicle [3860.8401,3397.6899,0.077188499];
_l setdir 286.862;

_l =   createvehicle ["Land_Wall_Tin_4", [3863.5801,3374.3799,0.26305401- 0.4], [], 0, "CAN_COLLIDE"];
_l setdir 18.542101;

_l =   createvehicle ["Land_Wall_Tin_4", [3856.02,3377,0.262871- 0.4], [], 0, "CAN_COLLIDE"];
_l setdir 18.542101;

_l =   createvehicle ["Land_Wall_Tin_4", [3856.02,3377,0.262871- 0.4], [], 0, "CAN_COLLIDE"];
_l setdir 18.542101;

_l =   createvehicle ["Land_Wall_Tin_4", [3852.3,3378.28,0.333166 - 0.4], [], 0, "CAN_COLLIDE"]; 
_l setdir 18.542101;

_l =   createvehicle ["Land_Wall_Tin_4", [3852.3601,3384.54,0.92176598-0.8], [], 0, "CAN_COLLIDE"]; 
_l setdir 285.20099;

_l =   createvehicle ["Land_Wall_Tin_4", [3855.48,3395.74,0.79125798 - 0.7], [], 0, "CAN_COLLIDE"]; 
_l setdir 285.20099;

_l =   createvehicle ["Land_Wall_Tin_4", [3851.1201,3380.75,0.88963902  - 0.9], [], 0, "CAN_COLLIDE"]; 
_l setdir 290.12201;

_l =   createvehicle ["Land_Wall_Tin_4", [3853.4199,3388.29,0.482811 - 0.3], [], 0, "CAN_COLLIDE"];   
_l setdir 285.245;

_l =   createvehicle ["Land_Wall_Tin_4", [3854.45,3391.99,0.404562 - 0.4], [], 0, "CAN_COLLIDE"];  
_l setdir 285.245;

_l =   createvehicle ["Land_Wall_Tin_4", [3856.4199,3399.3999,0.000368118 +0.2], [], 0, "CAN_COLLIDE"];  
_l setdir 104.325;

_l =   createvehicle ["Land_Wall_Tin_4", [3859.8,3375.7,0.26282299 - 0.4], [], 0, "CAN_COLLIDE"];  
_l setdir 18.542101;

_l =   createvehicle ["Land_A_BuildingWIP", [3903.47,3376.9399,0.1], [], 0, "CAN_COLLIDE"];    
_l setdir 198.743;

_l =   createvehicle ["Land_Wall_Tin_4", [3857.46,3403.21,0.52377099 - 0.4], [], 0, "CAN_COLLIDE"];  
_l setdir 286.474;

_l =   createvehicle ["Land_Wall_Tin_4", [3867.3999,3402.4199,0.000274658], [], 0, "CAN_COLLIDE"];
_l setdir 193.599;

_l =   createvehicle ["Land_Wall_Tin_4", [3859.9299,3404.55,0.00022315999], [], 0, "CAN_COLLIDE"];
_l setdir 194.993;

_l =   createvehicle ["Land_Wall_Tin_4", [3863.7,3403.45,0.120285 - 0.1], [], 0, "CAN_COLLIDE"];  
_l setdir 196.17599;

_l =   createvehicle ["Land_Wall_Tin_4", [3871.27,3401.4299,0.00057029701], [], 0, "CAN_COLLIDE"];
_l setdir 193.379;

_l =   createvehicle ["Land_Wall_Tin_4", [3875.03,3400.49,0.000576019], [], 0, "CAN_COLLIDE"];
_l setdir 193.379;

_l =   createvehicle ["Land_Hangar_F", [3403.3201,3542.54,0.080730401], [], 0, "CAN_COLLIDE"];
_l setdir 179.002;

_l =   createvehicle ["Land_a_stationhouse", [3544.6499,3557.4199,-0.0044403099], [], 0, "CAN_COLLIDE"];
_l setdir 180.492;

_l =   createvehicle ["Land_Hangar_2",[3940.33,3554.32,0], [], 0, "CAN_COLLIDE"];
_l setdir 180;

_l =  createvehicle ["Land_A_GeneralStore_01_dam", [4294.75,3350.46,-0.6], [], 0, "CAN_COLLIDE"];    
_l setdir 290;  

_l =  createvehicle ["Land_ladder", [4293,3367.8,-1], [], 0, "CAN_COLLIDE"];          
_l setdir 200;        

_l =  createvehicle ["Land_ladder_half", [3673.7,4119.96,10.8332], [], 0, "CAN_COLLIDE"];    
_l setdir 215;

_l =  createvehicle ["Land_ladder_half", [3688.6,4109.51,10.6235], [], 0, "CAN_COLLIDE"];      
_l setdir 215;

_l =   createvehicle ["Land_i_Barracks_V1_F", [3719.9399,3557.1299,0], [], 0, "CAN_COLLIDE"];
_l setdir 0;

_l =   createvehicle ["Land_i_Stone_HouseSmall_V2_F", [3826.4399,3535.03,0], [], 0, "CAN_COLLIDE"];
_l setdir 179.72701;

_l =   createvehicle ["Land_d_Stone_HouseSmall_V1_F", [3879.1699,3533.8401,0.014286 - 0.9], [], 0, "CAN_COLLIDE"];  
_l setdir 180.05499;

_l =   createvehicle ["Land_Hangar_F", [3979.77,3543.1001,0 + 0.1], [], 0, "CAN_COLLIDE"];  
_l setdir 180.07201;

_l =   createvehicle ["Land_Hangar_F", [4021.8501,3542.1599,0], [], 0, "CAN_COLLIDE"];
_l setdir 180.192;

_l =   createvehicle ["Land_CarService_F", [3891.54,3639.21,0], [], 0, "CAN_COLLIDE"];
_l setdir 359.94601;

_l =   createvehicle ["Land_Slum_House03_F", [4354.1699,3621.9399,0.71223801 - 0.5], [], 0, "CAN_COLLIDE"];  
_l setdir 256.30499;

_l =   createvehicle ["Land_Slum_House01_F", [4356.5,3612.51,0.00196075], [], 0, "CAN_COLLIDE"];
_l setdir 244.855;

_l =   createvehicle ["Land_MilOffices_V1_F", [3494.3799,3644.9099,-0.027612699 - 0.3], [], 0, "CAN_COLLIDE"];  
_l setdir 0.155514;

_l =   createvehicle ["Land_A_Office01_EP1", [3493.29,3700.02,-0.138805], [], 0, "CAN_COLLIDE"];  
_l setPos[getPos _l select 0, getPos _l select 1, (getPos _l select 2) + 0.2];

_l =   createvehicle ["Land_cargo_house_slum_F", [3920.02,3938.23,-0.067817703], [], 0, "CAN_COLLIDE"];
_l setdir 137.93401;

_l =   createvehicle ["Land_Slum_House03_F", [3924.76,3931.76,-0.0573502], [], 0, "CAN_COLLIDE"];
_l setdir 44.436901;

_l =   createvehicle ["Land_d_House_Big_01_V1_F", [3246.1399,4074.3999,-0.36306], [], 0, "CAN_COLLIDE"];  
_l setdir 312.40601;

_l =   createvehicle ["Land_Ind_Oil_Tower_EP1", [3012.04,4085.8201,0.167007], [], 0, "CAN_COLLIDE"]; 
_l setdir 150;
 
_l =   createvehicle ["Land_Chapel_V2_F", [3147.5,4314.3301,0.686459 -0.7], [], 0, "CAN_COLLIDE"];  
_l setdir 115.88;

_l =   createvehicle ["Land_afbarabizna", [3718.71,3820.12,0.4], [], 0, "CAN_COLLIDE"];

_l =   createvehicle ["Land_dum_rasovna", [2871.17,3858.01,-0.4], [], 0, "CAN_COLLIDE"]; 
_l setDir 170;

_l =   createvehicle ["Land_dum_zboreny", [4002.97,3125.4,-0.4], [], 0, "CAN_COLLIDE"]; 
_l setdir 260;

_l =   createvehicle ["Land_Castle_01_tower_F", [3182.45,4315.8101,0.28875399], [], 0, "CAN_COLLIDE"];  
_l setdir 200;

_l =   createvehicle ["Land_FuelStation_Shed_F", [3136.04,4352.7798,0.033271801], [], 0, "CAN_COLLIDE"];
_l setdir 209.271;

_l =   createvehicle ["Land_FuelStation_Build_F", [3137.8601,4341.6802,0.121447], [], 0, "CAN_COLLIDE"];
_l setdir 300.21201;

_l =   createvehicle ["Land_FuelStation_Sign_F", [3149.78,4346.75,0.0336609], [], 0, "CAN_COLLIDE"];
_l setdir 301.23199;

_l =   createvehicle ["Land_Panelak2", [2974.97,4516.47,0], [], 0, "CAN_COLLIDE"];
_l setdir 217; 

_l =   createvehicle ["Land_Panelak", [2959.48,4493.2,0], [], 0, "CAN_COLLIDE"]; 
_l setdir 25; 

_l =   createvehicle ["Land_A_TVTower_Base", [3415.3,3937.96, -0.4], [], 0, "CAN_COLLIDE"];  

_l =   createvehicle ["Land_A_TVTower_Mid", [3415.3,3937.96, -1], [], 0, "CAN_COLLIDE"];

_l =   createvehicle ["Land_A_TVTower_Top", [3415.3,3937.96, -1], [], 0, "CAN_COLLIDE"];


_l =   createvehicle ["Land_Tovarna2", [3200.72,4595.48,0.4], [], 0, "CAN_COLLIDE"]; 
_l setdir 30;



_l =   createvehicle ["Land_dp_bigTank_F", [3210.1299,4553.23,-0.0105572], [], 0, "CAN_COLLIDE"];
_l setdir 245.799;

_l =   createvehicle ["Land_dp_bigTank_F", [3233.3899,4551.3799,-0.014245], [], 0, "CAN_COLLIDE"];
_l setdir 245.513;

_l =   createvehicle ["Land_TTowerBig_1_F", [3461.29,4563,-0.4], [], 0, "CAN_COLLIDE"];  
_l setdir 225.66299;

_l =   createvehicle ["Land_Ind_Workshop01_01", [3744.15,3181.23,0], [], 0, "CAN_COLLIDE"]; 
_l setDir 190;


_l =   createvehicle ["Land_i_House_Big_02_V1_F", [3485.14,4337.85,1.14052], [], 0, "CAN_COLLIDE"];    
_l setdir 97.3511;

_l =   createvehicle ["Land_Factory_Main_F", [3682.55,4121.5,0.0069313], [], 0, "CAN_COLLIDE"];      
_l setdir -235;

_l =   createvehicle ["Land_Wreck_Traw_F", [4470.1,3556.51,-4.45352], [], 0, "CAN_COLLIDE"];   
_l setdir 358.408;


_l =  createvehicle["Land_Crane_F", [3884.54,3408.06,-0.0860138], [], 0, "CAN_COLLIDE"];      
_l setdir 88.4027;




