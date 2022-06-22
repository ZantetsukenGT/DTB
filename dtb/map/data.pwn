#define MAX_MAP_NAME		   20

#define EXTRASUNNY_LA		   0
#define SUNNY_LA			   1
#define EXTRASUNNY_SMOG_LA	   2
#define SUNNY_SMOG_LA		   3
#define CLOUDY_LA			   4
#define SUNNY_SF			   5
#define EXTRASUNNY_SF		   6
#define CLOUDY_SF			   7
#define RAINY_SF			   8
#define FOGGY_SF			   9
#define SUNNY_VEGAS			   10
#define EXTRASUNNY_VEGAS	   11
#define CLOUDY_VEGAS		   12
#define EXTRASUNNY_COUNTRYSIDE 13
#define SUNNY_COUNTRYSIDE	   14
#define CLOUDY_COUNTRYSIDE	   15
#define RAINY_COUNTRYSIDE	   16
#define EXTRASUNNY_DESERT	   17
#define SUNNY_DESERT		   18
#define SANDSTORM_DESERT	   19

enum e_MapData {
	e_MapName[MAX_MAP_NAME + 1],
	e_MapInterior,
	e_MapWeather,
	e_MapTime,
	Float: e_MapLimits[4],
	Float: e_MapAttackSpawn[4],
	Float: e_MapDefendSpawn[4],
	Float: e_MapBombsiteA[6],
	Float: e_MapBombsiteB[6]
};

new const g_MapData[][e_MapData] = {
	{ "Area 69",
	  0,
	  EXTRASUNNY_DESERT,
	  12,
	  { 47.6139, 1748.5084, 410.6917, 2110.8218 },
	  { 80.4991, 1920.6801, 17.6406, 270.0 },
	  { 268.5736, 1883.1561, -30.0938, 0.0 },
	  { 275.3343, 1857.3244, 7.9339, 0.0, 0.0, 0.0 },
	  { 212.8957, 1822.6464, 5.5806, 0.0, 0.0, 90.0 } },
	{ "LVPD HQ",
	  3,
	  EXTRASUNNY_VEGAS,
	  12,
	  { 188.1783, 138.6871, 301.2983, 197.7730 },
	  { 202.3886, 167.9864, 1003.0234, 270.0 },
	  { 284.3766, 181.3344, 1007.1719, 88.1025 },
	  { 268.0886, 185.2790, 1007.3424, 0.0, 0.0, -178.9351 },
	  { 241.9561, 155.9541, 1002.2258, 0.0, 0.0, -89.9303 } },
	{ "Easter Basin Ship",
	  0,
	  CLOUDY_SF,
	  12,
	  { -1473.4489, 476.3027, -1234.9860, 521.9428 },
	  { -1456.1178, 501.4568, 18.2651, 270.0 },
	  { -1428.4585, 496.0280, 3.0391, 270.0 },
	  { -1408.4591, 498.8294, 10.3907, 0.0, 0.0, -90.0 },
	  { -1297.9842, 507.9202, 10.3727, 0.0, 0.0, -90.0 } },
	{ "Blueberry Acres",
	  0,
	  RAINY_COUNTRYSIDE,
	  12,
	  { -223.8146, -203.5928, 64.2231, 196.2238 },
	  { -78.3996, 115.5201, 3.1172, 160.2623 },
	  { -91.9689, -166.8909, 2.5633, 35.2255 },
	  { -130.1105, -94.2323, 5.6683, 0.0, 0.0, -9.2780 },
	  { -52.0528, 31.2757, 2.3151, 0.0, 0.0, 70.6376 } },
	{ "Fort Carson",
	  0,
	  EXTRASUNNY_COUNTRYSIDE,
	  12,
	  { -382.6241, 959.9423, 125.5307, 1245.5140 },
	  { -294.2161, 1018.9131, 19.5938, 270.0 },
	  { 36.2510, 1198.4744, 18.8594, 90.0 },
	  { -209.8870, 1125.0654, 18.9293, 0.0, 0.0, 130.0662 },
	  { -100.6305, 1075.0704, 18.9190, 0.0, 0.0, -28.5354 } },
	{ "K.A.C.C Base",
	  0,
	  CLOUDY_VEGAS,
	  0,
	  { 2481.9116, 2631.5388, 2752.3015, 2863.5752 },
	  { 2524.2617, 2838.1389, 10.8203, 180.0 },
	  { 2618.7971, 2721.2749, 36.5386, 90.0 },
	  { 2594.4104, 2790.6010, 10.0125, 0.0, 0.0, 270.0 },
	  { 2607.4240, 2835.8918, 10.0152, 0.0, 0.0, 270.0 } },
	{ "Cargo Ship",
	  0,
	  FOGGY_SF,
	  0,
	  { -2531.0332, 1518.9822, -2274.2891, 1569.8701 },
	  { -2328.3931, 1534.4694, 17.3281, 90.0 },
	  { -2371.8933, 1551.3595, 2.1172, 90.0 },
	  { -2472.4907, 1551.8697, 32.3988, 0.0, 0.0, 270.0 },
	  { -2425.9018, 1534.6136, 1.2984, 0.0, 0.0, 180.0 } },
	{ "Desert Airfield",
	  0,
	  SANDSTORM_DESERT,
	  12,
	  { 61.8538, 2253.2637, 454.9153, 2650.3694 },
	  { 101.3502, 2440.3733, 16.4844, 314.7598 },
	  { 379.9916, 2595.8457, 16.4844, 270.0 },
	  { 414.4740, 2533.4160, 15.6671, 0.0, 0.0, -0.8561 },
	  { 275.7522, 2409.6342, 15.7993, 0.0, -4.0999, -150.1292 } },
	{ "El Quedabros",
	  0,
	  SUNNY_DESERT,
	  12,
	  { -1635.4812, 2492.3601, -1243.4812, 2744.3601 },
	  { -1515.8376, 2532.8552, 55.6875, 0.0 },
	  { -1410.8339, 2640.7991, 55.6875, 90.0 },
	  { -1480.6287, 2629.2080, 57.9513, 0.0, 0.0, -89.9999 },
	  { -1327.9675, 2681.5993, 49.2425, 0.0, 0.0, 172.0999 } },
	{ "LS Airport",
	  0,
	  EXTRASUNNY_LA,
	  12,
	  { 1339.1644, -2479.0454, 1850.5762, -2186.5034 },
	  { 1797.7373, -2253.8491, 6.2656, 180.0 },
	  { 1358.0885, -2457.3264, 7.6620, 0.0 },
	  { 1638.7814, -2286.6213, 12.7276, 0.0, 0.0, 89.9009 },
	  { 1551.0833, -2279.4753, -3.6656, 0.0, 0.0, 2.0249 } },
	{ "Come-a-Lot",
	  0,
	  EXTRASUNNY_VEGAS,
	  0,
	  { 2087.2966, 983.1164, 2337.3906, 1183.3639 },
	  { 2168.5676, 1126.1183, 23.3359, 241.0070 },
	  { 2287.8037, 1053.4790, 26.7031, 61.1362 },
	  { 2231.4980, 1115.7857, 28.7687, 0.0, 0.0, -157.5352 },
	  { 2221.7482, 1055.6372, 28.6088, 0.0, 0.0, -166.3388 } },
	{ "Shopping Mall",
	  0,
	  SUNNY_SMOG_LA,
	  12,
	  { 1031.3409, -1582.4686, 1206.1543, -1384.0752 },
	  { 1062.8860, -1405.5974, 13.4678, 180.0 },
	  { 1196.1951, -1572.0994, 13.3828, 0.0 },
	  { 1090.4031, -1486.8060, 14.6137, 0.0, -3.5999, 16.0760 },
	  { 1127.3038, -1544.4913, 21.9241, 0.0, 0.0, 180.0 } },
	{ "Las Barrancas",
	  0,
	  EXTRASUNNY_DESERT,
	  12,
	  { -923.9105, 1396.5925, -618.2459, 1671.9674 },
	  { -874.6109, 1641.8093, 26.9949, 210.5521 },
	  { -803.0180, 1437.8552, 13.7891, 93.8577 },
	  { -733.4641, 1546.2341, 38.1864, 0.0, 1.4999, 89.8198 },
	  { -819.9248, 1503.7919, 18.9851, 0.0, 2.6999, -90.4956 } },
	{ "Palomino Creek",
	  0,
	  SUNNY_COUNTRYSIDE,
	  0,
	  { 2126.1775, -129.0526, 2560.1775, 248.9474 },
	  { 2211.9387, 225.9441, 14.4998, 255.9567 },
	  { 2549.9292, 41.9140, 26.3424, 90.0 },
	  { 2269.3000, -70.3957, 30.7763, 0.0, 0.0, 0.0 },
	  { 2321.2985, 47.9733, 25.6634, 0.0, 0.0, 270.0 } },
	{ "Quarry",
	  0,
	  SANDSTORM_DESERT,
	  12,
	  { 254.1109, 659.4868, 887.1109, 1055.4868 },
	  { 841.7526, 856.7982, 12.9989, 111.2794 },
	  { 529.0360, 736.3010, 12.2573, 46.0660 },
	  { 568.5760, 823.4868, -22.9868, 0.0, 0.0, -170.3659 },
	  { 601.3842, 867.9075, -43.8322, 0.0, 0.0, -90.0 } },
	{ "Forest",
	  0,
	  RAINY_COUNTRYSIDE,
	  0,
	  { 2272.0000, -786.7468, 2650.5508, -492.7468 },
	  { 2463.5598, -743.6622, 106.5667, 73.9564 },
	  { 2508.3716, -516.0724, 92.2672, 139.9921 },
	  { 2351.5744, -653.3881, 127.2196, 0.0, 0.0, -89.4538 },
	  { 2572.1450, -646.6228, 135.6820, -4.5999, 0.4999, 319.6323 } },
	{ "Pier 69",
	  0,
	  EXTRASUNNY_SF,
	  0,
	  { -1725.6558, 1252.9944, -1557.6558, 1476.9944 },
	  { -1699.7819, 1311.9565, 7.0391, 2.2109 },
	  { -1631.3475, 1416.2345, 7.1875, 132.8418 },
	  { -1667.0395, 1402.4527, 8.9390, 0.0, 0.0, 44.5961 },
	  { -1647.8057, 1369.5432, 6.3624, 0.0, 0.0, -44.4555 } },
	{ "Calton Heights",
	  0,
	  RAINY_SF,
	  0,
	  { -2155.0461, 791.6214, -1991.5249, 987.7637 },
	  { -2127.8210, 917.7690, 79.8915, 270.0 },
	  { -2006.0000, 805.6154, 45.4821, 0.0 },
	  { -2058.1706, 926.5901, 56.5376, 6.7999, 0.0, 85.1504 },
	  { -2027.4464, 875.7351, 61.8205, 0.0, 0.0, 271.0285 } },
	{ "The Panopticon",
	  0,
	  FOGGY_SF,
	  21,
	  { -645.9178, -255.4925, -379.9178, 38.5075 },
	  { -581.9360, -83.3745, 64.8351, 270.0 },
	  { -459.6143, -187.6373, 77.4628, 90.0 },
	  { -435.0270, -60.4821, 58.0567, 0.0, 0.0, 270.0 },
	  { -567.3808, -177.0458, 77.5667, 0.0, 0.0, 0.0 } },
	{ "Montgomery",
	  0,
	  CLOUDY_COUNTRYSIDE,
	  9,
	  { 1144.4175, 107.8520, 1480.4175, 443.8520 },
	  { 1409.1008, 196.2225, 19.7602, 66.9756 },
	  { 1201.7622, 364.6428, 19.5321, 245.7889 },
	  { 1273.5183, 299.8068, 18.7378, 0.0, 0.0, 157.7020 },
	  { 1408.7124, 353.7594, 18.2483, 0.0, -1.8999, 158.8740 } },
	{ "Whetstone Junkyard",
	  0,
	  RAINY_COUNTRYSIDE,
	  0,
	  { -1960.8077, -1820.4141, -1666.8077, -1456.4141 },
	  { -1944.1348, -1806.7958, 33.0539, 346.2679 },
	  { -1778.5111, -1610.2251, 21.8060, 135.9410 },
	  { -1857.3039, -1616.3988, 20.9947, 0.0, 0.0, -2.9650 },
	  { -1845.8352, -1711.0001, 40.2521, 0.0, 0.0, 214.3532 } },
	{ "Little Italy",
	  0,
	  EXTRASUNNY_COUNTRYSIDE,
	  12,
	  { 625.3289, -2447.5869, 776.7811, -2283.7559 },
	  { 684.40002, -2410.7, 107.2, 310.003 },
	  { 717.09998, -2305.8999, 107.9, 180.003 },
	  { 737.0966, -2385.8127, 106.1350, 0.0, 0.0, 179.4337 },
	  { 658.2860, -2321.9201, 106.7920, 0.0, 0.0, 86.1060 } }
	//	{"mapname", interior, weatherid, time, {minx, miny, maxx, maxy}, {x, y, z, a}, {x, y, z, a}, {x, y, z, rx, ry, rz}, {x, y, z, rx, ry, rz}},
};

new g_MapID;
new g_NextMapID;
new bool: g_NextMapLoaded;
