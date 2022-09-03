
#include <YSI_Coding\y_hooks>

hook OnVehicleStreamIn(vehicleid, forplayerid)
{
	SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	return 1;
}
