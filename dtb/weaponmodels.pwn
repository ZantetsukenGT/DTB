static const WeaponModels[]
	= { 0,	 331, 333, 334, 335, 336, 337, 338, 339, 341, 321, 322, 323, 324, 325, 326, 342, 343, 344, 0,	0,	 0,	  346, 347,
		348, 349, 350, 351, 352, 353, 355, 356, 372, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 371 };

stock GetWeaponModel(weaponid)
{
	if (0 <= weaponid <= 46)
		return WeaponModels[weaponid];
	return 0;
}
