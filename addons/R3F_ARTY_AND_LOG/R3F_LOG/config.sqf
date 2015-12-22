/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des v�hicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs = [
						"rhsusf_m1025_w_mk19",
						"C_Van_01_transport_F",
						"rhsusf_m998_d_2dr_halftop",
						"rhs_tigr_3camo_msv",
						"rhsusf_m998_w_2dr_fulltop",
						"rhs_tigr_msv",
						"rhsusf_m1025_d_Mk19", 
						"rhsusf_m1025_d", 
						"rhs_tigr_ffv_3camo_msv",
						"rhsusf_m998_w_4dr",
						"rhsusf_m1025_d_m2",
						"rhs_ural_open_chdkz",
						"rhsusf_m1025_w_m2",
						"rhsusf_m1025_w",
						"O_Truck_02_covered_F",
						"rhs_ural_work_chdkz",
						"RHS_Ural_VV_01", 
						"RHS_Ural_Flat_VV_01", 
						"RHS_Ural_Open_Flat_VV_01", 
						"rhs_gaz66_flat_vv", 
						"rhs_gaz66_repair_vv"
						];
/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables = [
							"B_G_Quadbike_01_F",
							"B_G_Offroad_01_F",
							"C_Offroad_01_F",
							"C_Hatchback_01_sport_F",
							"C_SUV_01_F",
							"RHS_UAZ_MSV_01",
							"B_Quadbike_01_F",
							"B_G_Offroad_01_armed_F",
							"rhs_uaz_open_MSV_01",
							"C_Hatchback_01_F"
								];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des v�hicules a�riens pouvant h�liporter des objets h�liportables.
 */
R3F_LOG_CFG_heliporteurs = [
	"O_Ka60_Unarmed_F",
	"B_MH9_F",
	"O_Ka60_F",
	"B_AH9_F"
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets h�liportables.
 */
R3F_LOG_CFG_objets_heliportables = [];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

R3F_LOG_CFG_transporteurs = [
	["rhsusf_m1025_w_m2", 65],
	["rhs_ural_open_chdkz", 120],
	["rhsusf_m1025_d", 65],
	["rhsusf_m1025_d_Mk19", 65],
	["rhs_tigr_3camo_msv", 55],
	["rhsusf_m1025_d_m2", 65],
	["rhsusf_m998_d_2dr_halftop", 90],
	["C_Van_01_transport_F", 100],
	["rhsusf_m998_w_4dr", 65],
	["rhsusf_m1025_w_mk19", 65],
    ["rhs_tigr_ffv_3camo_msv", 55],
    ["rhsusf_m998_w_2dr_fulltop", 90],
	["rhs_tigr_msv", 55],
	["rhs_ural_work_chdkz", 120],
	["rhsusf_m1025_w", 65],
	["O_Truck_02_covered_F", 130],
	["B_Quadbike_01_F", 15],
	["rhs_uaz_open_MSV_01", 30],
	["C_SUV_01_F", 35],
	["B_G_Offroad_01_F", 45],
	["B_G_Quadbike_01_F", 15],
	["RHS_UAZ_MSV_01", 30],
	["C_Hatchback_01_sport_F", 20],
	["C_Offroad_01_F" , 45],
	["B_G_Offroad_01_armed_F", 20],
	["C_Hatchback_01_F", 20],
	["RHS_Ural_VV_01", 120],
	["RHS_Ural_Flat_VV_01", 120],
	["RHS_Ural_Open_Flat_VV_01", 120],
	["rhs_gaz66_flat_vv", 100],
	["rhs_gaz66_repair_vv", 100]
];

R3F_LOG_CFG_objets_transportables =  [
	["Box_East_Support_F", 15],
	["Box_East_Wps_F", 15],
	["Box_East_WpsSpecial_F", 15],
	["Box_NATO_Support_F", 15],
	["Box_NATO_Wps_F", 15],
	["Box_NATO_WpsSpecial_F", 15],
	["Land_CanisterPlastic_F", 15],
	["Land_Sacks_goods_F", 20],
	["Land_HBarrierBig_F", 60],
	["Land_Mil_WallBig_4m_F",50],
	["Land_HBarrier_3_F", 27],
    ["Land_HBarrier_5_F", 45],
    ["Land_HBarrier_1_F", 9],
    ["O_Quadbike_F", 10],
    ["B_Quadbike_F", 10],
	["Land_ToiletBox_F", 30],
	//["O_Lifeboat", 5],
	//["B_Lifeboat", 5],
	["O_Mk6", 10],
	["B_Mk6", 10],
	["Land_Cargo_House_V1_F", 100],
	["Land_Cargo_HQ_V1_F", 110],	
	["Land_Cargo_Patrol_V1_F", 110],
	["Land_Sack_F", 1],	
	["Land_Cargo20_military_F", 100],
	["Box_IND_Wps_F", 15]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/
R3F_LOG_CFG_objets_deplacables = [
	"Box_East_Support_F",
	"Box_East_Wps_F",
	"Box_East_WpsSpecial_F",
	"Box_NATO_Support_F",
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
    "Land_HBarrier_5_F",
	"Land_Cargo20_military_F",
	"Land_Mil_WallBig_4m_F",
    "O_Quadbike_F",
    "B_Quadbike_F",
	"Land_ToiletBox_F",
	"O_Assaultboat",
	"B_Assaultboat",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Box_IND_Wps_F"];
R3F_LOG_CFG_objets_deplacables = R3F_LOG_CFG_objets_deplacables + WS_OBJECTS;