#define INVALID_PICKUP_ID	-1
#define INVALID_BOMBSITE_ID 2
#define PLANT_TIME			5000
#define DEFUSE_TIME			5000
#define BOMB_ANIM_SPEED		4.1
#define BOMB_ATTACH_INDEX	9

enum
{
	BOMBSITE_A,
	BOMBSITE_B
}

new bool: g_IsBombsiteCreated[2 char];
new bool: g_IsBombPlanted;
new bool: g_IsBombDefused;
new bool: g_IsBombBeingPlanted;
new bool: g_IsBombBeingDefused;
new g_BombPlantTick;
new g_BombDefuseTick;
new g_BombPlantTimer;
new g_BombDefuseTimer;
new g_BombPlantSite;
new g_BombCarrierID = INVALID_PLAYER_ID;
new g_BombPlanterID = INVALID_PLAYER_ID;
new g_BombDefuserID = INVALID_PLAYER_ID;
new g_BombPickupID	= INVALID_PICKUP_ID;
new Float: g_BombPickupPos[3];
new g_BombsiteObjects[2][5];
new g_BombObject = INVALID_OBJECT_ID;
new bool: g_IsBombExploding;
new g_BombExplodeTimer;
new g_PlayerBombsite[MAX_PLAYERS char]			   = { INVALID_BOMBSITE_ID, ... };
new PlayerText: g_BombProgressBackTD[MAX_PLAYERS]  = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_BombProgressMaxTD[MAX_PLAYERS]   = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_BombProgressValueTD[MAX_PLAYERS] = { PlayerText: INVALID_TEXT_DRAW, ... };
new PlayerText: g_BombTextTD[MAX_PLAYERS]		   = { PlayerText: INVALID_TEXT_DRAW, ... };

#define GetOppositeBombsite(%0)		((%0 == BOMBSITE_A) ? (BOMBSITE_B) : (BOMBSITE_A))
#define AttachPlayerBombToBack(%0)	(SetPlayerAttachedObject(%0, BOMB_ATTACH_INDEX, 1252, 1, 0.047846, -0.193535, 0.0, 0.0, 90.0, 0.0))
#define AttachBombToPlayerHands(%0) (SetPlayerAttachedObject(%0, BOMB_ATTACH_INDEX, 1252, 6, 0.135370, 0.069800, -0.034781))
#define UnattachBombFromPlayer(%0)	(RemovePlayerAttachedObject(%0, BOMB_ATTACH_INDEX))
