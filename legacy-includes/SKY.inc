#if defined _INC_SKY
    #endinput
#endif
#define _INC_SKY

#include <a_samp>
#include <omp>
#include <Pawn.RakNet>

#if !defined FLOAT_NAN
    #define FLOAT_NAN (Float:0x7FFFFFFF)
#endif

const
    PLAYER_SYNC = 207,
    AIM_SYNC = 203,
    VEHICLE_SYNC = 200,
    PASSENGER_SYNC = 211,
    SPECTATING_SYNC = 212,
    TRAILER_SYNC = 210,

    RPC_ClearPlayerAnimation = 87,
    RPC_RequestSpawn = 129,
    RPC_DeathBroadcast = 166;

static
    bool:disableSyncBugs = true,
    bool:knifeSync = true,

    lastWeapon[MAX_PLAYERS char],
    fakeHealth[MAX_PLAYERS char],
    fakeArmour[MAX_PLAYERS char],
    Float:fakeQuat[MAX_PLAYERS][4] = {{FLOAT_NAN, ...}, ...},
    lastUpdateTick[MAX_PLAYERS],
    bool:blockKeySync[MAX_PLAYERS char],
    bool:infiniteAmmo[MAX_PLAYERS char],

    bool:syncOnFootDataFrozen[MAX_PLAYERS char], // Stores the frozen state for OnFoot Sync
    bool:syncAimDataFrozen[MAX_PLAYERS char], // Stores the frozen state for Aim Sync
    bool:syncVehicleDataFrozen[MAX_PLAYERS char], // Stores the frozen state for Vehicle Sync
    bool:syncPassengerDataFrozen[MAX_PLAYERS char], // Stores the frozen state for Passenger Sync
    bool:syncSpectatingDataFrozen[MAX_PLAYERS char], // Stores the frozen state for Spectating Sync
    bool:syncAllDataFrozen[MAX_PLAYERS char],

    E_SYNC_TYPES:lastSyncPacket[MAX_PLAYERS],

    lastSyncData[MAX_PLAYERS][PR_OnFootSync], resetSyncData[PR_OnFootSync],
    lastAimSyncData[MAX_PLAYERS][PR_AimSync], resetAimSyncData[PR_AimSync],
    lastVehicleSyncData[MAX_PLAYERS][PR_InCarSync], resetVehicleSyncData[PR_InCarSync],
    lastPassengerSyncData[MAX_PLAYERS][PR_PassengerSync], resetPassengerSyncData[PR_PassengerSync],
    lastSpectatingSyncData[MAX_PLAYERS][PR_SpectatingSync], resetSpectatingSyncData[PR_SpectatingSync];

// Sync Packets
enum E_SYNC_TYPES
{
    E_PLAYER_SYNC = 0,
    E_AIM_SYNC,
    E_VEHICLE_SYNC,
    E_PASSENGER_SYNC,
    E_SPECTATING_SYNC,
    E_LAST_SYNC,
    E_ALL_SYNC
}

static bool:GetSyncFrozenState(playerid, E_SYNC_TYPES:type)
{
    switch (type)
    {
        case E_PLAYER_SYNC:
            return syncOnFootDataFrozen{playerid};
        case E_AIM_SYNC:
            return syncAimDataFrozen{playerid};
        case E_VEHICLE_SYNC:
            return syncVehicleDataFrozen{playerid};                
        case E_PASSENGER_SYNC:
            return syncPassengerDataFrozen{playerid};
        case E_SPECTATING_SYNC:
            return syncSpectatingDataFrozen{playerid};
        case E_ALL_SYNC:
            return syncAllDataFrozen{playerid};
    }

    return bool:-1;        
} 

static stock SetSyncFrozenState(playerid, E_SYNC_TYPES:type, bool:toggle)
{
    switch (type)
    {
        case E_PLAYER_SYNC:
            syncOnFootDataFrozen{playerid} = toggle;
        case E_AIM_SYNC:
            syncAimDataFrozen{playerid} = toggle;        
        case E_VEHICLE_SYNC:
            syncVehicleDataFrozen{playerid} = toggle;        
        case E_PASSENGER_SYNC:
            syncPassengerDataFrozen{playerid} = toggle;
        case E_SPECTATING_SYNC:
            syncSpectatingDataFrozen{playerid} = toggle;
        case E_ALL_SYNC:
            syncAllDataFrozen{playerid} = toggle;
    }
}

static bool:IsPlayerUpdatePacket(packetid)
{
    return (
        packetid == PLAYER_SYNC ||
        packetid == VEHICLE_SYNC ||
        packetid == PASSENGER_SYNC ||
        packetid == SPECTATING_SYNC ||
        packetid == AIM_SYNC ||
        packetid == TRAILER_SYNC);
}

static bool:IsNan(Float:value)
{
    return value != value;
}

static stock sendSyncData(playerid, animation, &BitStream:bs)
{
    BS_WriteValue(
        bs,
        PR_UINT8, PLAYER_SYNC,
        PR_UINT16, playerid
    );

    if (!IsNan(fakeQuat[playerid][0]))
    {
        lastSyncData[playerid][PR_quaternion] = fakeQuat[playerid];
    }

    if (fakeHealth{playerid} != 255)
    {
        lastSyncData[playerid][PR_health] = fakeHealth{playerid};
    }

    if (fakeArmour{playerid} != 255)
    {
        lastSyncData[playerid][PR_armour] = fakeArmour{playerid};
    }

    // Make them appear standing still if paused
    if (GetTickCount() - lastUpdateTick[playerid] > 2000)
    {
        lastSyncData[playerid][PR_velocity] = Float:{0.0, 0.0, 0.0};
    }

    // Animations are only sent when they are changed
    if (!animation)
    {
        lastSyncData[playerid][PR_animationId] = 0;
        lastSyncData[playerid][PR_animationFlags] = 0;
    }

    BS_WriteOnFootSync(bs, lastSyncData[playerid], true); 
}

static stock sendAimSyncData(playerid, &BitStream:bs)
{
    BS_WriteValue(
        bs,
        PR_UINT8, AIM_SYNC,
        PR_UINT16, playerid
    );

    // Fix first-person up/down aim sync
    if (lastWeapon{playerid} == 34 
    || lastWeapon{playerid} == 35 
    || lastWeapon{playerid} == 36 
    || lastWeapon{playerid} == 43)
    {
        lastAimSyncData[playerid][PR_aimZ] = -lastAimSyncData[playerid][PR_camFrontVec][2];

        if (lastAimSyncData[playerid][PR_aimZ] > 1.0)
        {
            lastAimSyncData[playerid][PR_aimZ] = 1.0;
        }
        else if (lastAimSyncData[playerid][PR_aimZ] < -1.0)
        {
            lastAimSyncData[playerid][PR_aimZ] = -1.0;
        }
    }

    if (infiniteAmmo{playerid})
    {
        lastAimSyncData[playerid][PR_camZoom] = 2;
    }

    BS_WriteAimSync(bs, lastAimSyncData[playerid]);
}

static stock sendVehicleSyncData(playerid, &BitStream:bs)
{
    BS_WriteValue(
        bs,
        PR_UINT8, VEHICLE_SYNC,
        PR_UINT16, playerid
    );

    if (!IsNan(fakeQuat[playerid][0]))
    {
        lastVehicleSyncData[playerid][PR_quaternion] = fakeQuat[playerid];
    }

    if (fakeHealth{playerid} != 255)
    {
        lastVehicleSyncData[playerid][PR_playerHealth] = fakeHealth{playerid};
    }

    if (fakeArmour{playerid} != 255)
    {
        lastVehicleSyncData[playerid][PR_armour] = fakeArmour{playerid};
    }

    BS_WriteInCarSync(bs, lastVehicleSyncData[playerid], true);
}

static stock sendPassengerSyncData(playerid, &BitStream:bs)
{
    BS_WriteValue(
        bs,
        PR_UINT8, PASSENGER_SYNC,
        PR_UINT16, playerid
    );

    if (fakeHealth{playerid} != 255)
    {
        lastPassengerSyncData[playerid][PR_playerHealth] = fakeHealth{playerid};
    }

    if (fakeArmour{playerid} != 255)
    {
        lastPassengerSyncData[playerid][PR_playerArmour] = fakeArmour{playerid};
    }

    BS_WritePassengerSync(bs, lastPassengerSyncData[playerid]);
}

static stock sendSpectatingSyncData(playerid, &BitStream:bs)
{
    BS_WriteValue(
        bs,
        PR_UINT8, SPECTATING_SYNC,
        PR_UINT16, playerid
    );

    BS_WriteSpectatingSync(bs, lastSpectatingSyncData[playerid]);
}

public OnPlayerConnect(playerid)
{
    fakeHealth{playerid} =
    fakeArmour{playerid} = 255;

    #if defined SKY_OnPlayerConnect
        return SKY_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}

#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect SKY_OnPlayerConnect
#if defined SKY_OnPlayerConnect
    forward SKY_OnPlayerConnect(playerid);
#endif

public OnPlayerDisconnect(playerid, reason)
{
    lastWeapon{playerid} =
    lastUpdateTick[playerid] =
    _:lastSyncPacket[playerid] =
    blockKeySync{playerid} =
    infiniteAmmo{playerid} =

    syncAimDataFrozen{playerid} =
    syncAllDataFrozen{playerid} =
    syncOnFootDataFrozen{playerid} =
    syncVehicleDataFrozen{playerid} =
    syncPassengerDataFrozen{playerid} =
    syncSpectatingDataFrozen{playerid} = false;

    fakeQuat[playerid] = Float:{FLOAT_NAN, FLOAT_NAN, FLOAT_NAN, FLOAT_NAN};

    lastSyncData[playerid] = resetSyncData;
    lastAimSyncData[playerid] = resetAimSyncData;
    lastVehicleSyncData[playerid] = resetVehicleSyncData;
    lastPassengerSyncData[playerid] = resetPassengerSyncData;
    lastSpectatingSyncData[playerid] = resetSpectatingSyncData;

    #if defined SKY_OnPlayerDisconnect
        return SKY_OnPlayerDisconnect(playerid, reason);
    #else
        return 1;
    #endif
}

#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect SKY_OnPlayerDisconnect
#if defined SKY_OnPlayerDisconnect
    forward SKY_OnPlayerDisconnect(playerid, reason);
#endif

public OnIncomingPacket(playerid, packetid, BitStream:bs)
{
    if (IsPlayerUpdatePacket(packetid))
    {
        lastUpdateTick[playerid] = GetTickCount();
    }

    switch (packetid)
    {
        case PLAYER_SYNC:
        {
            new d[PR_OnFootSync];

            BS_IgnoreBits(bs, 8);
            BS_ReadOnFootSync(bs, d);

            if (d[PR_weaponId] > 46 || (d[PR_weaponId] > 18 && d[PR_weaponId] < 22))
            {
                d[PR_weaponId] = 0;
            }

            // Because of detonator crasher - Sends AIM_KEY in this packet and cam mode IDs 7, 8, 34, 45, 46, 51 and 65 in ID_AIM_SYNC
            if (d[PR_weaponId] == 40)
            {
                d[PR_keys] &= ~128;
            }

            if (disableSyncBugs)
            {
                // Prevent "ghost shooting" bugs
                if ((d[PR_weaponId] >= WEAPON_COLT45 && d[PR_weaponId] <= WEAPON_SNIPER) || d[PR_weaponId] == WEAPON_MINIGUN)
                {
                    switch (d[PR_animationId])
                    {
                            // PED_RUN_*
                        case 1222..1236,
                            // PED_SWAT_RUN
                            1249,
                            // PED_WOMAN_(RUN/WALK)_*
                            1275..1287,
                            // FAT_FATRUN_ARMED
                            459,
                            // MUSCULAR_MUSCLERUN*
                            908,
                            909,
                            // PED_WEAPON_CROUCH
                            1274,
                            // PED_WALK_PLAYER
                            1266,
                            // PED_SHOT_PARTIAL(_B)
                            1241,
                            1242,
                            // Baseball bat
                            17..27,
                            // Knife
                            745..760,
                            // Sword
                            1545..1554,
                            // Fight
                            471..507,
                            1135..1151:
                        {
                            // Only remove action key if holding aim
                            if (d[PR_keys] & 128)
                            {
                                d[PR_keys] &= ~1;
                            }

                            // Remove fire key
                            d[PR_keys] &= ~4;

                            // Remove aim key
                            d[PR_keys] &= ~128;
                        }
                    }
                }
                else if (d[PR_weaponId] == WEAPON_SPRAYCAN || d[PR_weaponId] == WEAPON_FIREEXTINGUISHER || d[PR_weaponId] == WEAPON_FLAMETHROWER)
                {
                    if (d[PR_animationId] < 1160 || d[PR_animationId] > 1167)
                    {
                        // Only remove action key if holding aim
                        if (d[PR_keys] & 128)
                        {
                            d[PR_keys] &= ~1;
                        }

                        // Remove fire key
                        d[PR_keys] &= ~4;

                        // Remove aim key
                        d[PR_keys] &= ~128;
                    }
                }
                else if (d[PR_weaponId] == WEAPON_GRENADE)
                {
                    if (d[PR_animationId] < 644 || d[PR_animationId] > 646)
                    {
                        d[PR_keys] &= ~1;
                    }
                }
            }

            if (GetSyncFrozenState(playerid, E_PLAYER_SYNC)
            || GetSyncFrozenState(playerid, E_ALL_SYNC))
            {
                d = lastSyncData[playerid];
            }
            else
            {
                lastSyncData[playerid] = d;
            }			

            if (blockKeySync{playerid})
            {
                d[PR_keys] = 0;
            }

            if (fakeHealth{playerid} != 255)
            {
                d[PR_health] = fakeHealth{playerid};
            }

            if (fakeArmour{playerid} != 255)
            {
                d[PR_armour] = fakeArmour{playerid};
            }

            if (!IsNan(fakeQuat[playerid][0]))
            {
                d[PR_quaternion] = fakeQuat[playerid];
            }

            if (d[PR_weaponId] == 44 || d[PR_weaponId] == 45)
            {
                d[PR_keys] &= ~4;
            }
            else if (d[PR_weaponId] == 4 && !knifeSync)
            {
                d[PR_keys] &= ~128;
            }

            lastWeapon{playerid} = d[PR_weaponId];
            lastSyncPacket[playerid] = E_PLAYER_SYNC;

            BS_SetWriteOffset(bs, 8);
            BS_WriteOnFootSync(bs, d); // rewrite
        }
        case AIM_SYNC:
        {
            new d[PR_AimSync];

            BS_IgnoreBits(bs, 8);
            BS_ReadAimSync(bs, d);

            if (GetSyncFrozenState(playerid, E_AIM_SYNC)
            || GetSyncFrozenState(playerid, E_ALL_SYNC))
            {
                d = lastAimSyncData[playerid];
            }
            else
            {
                lastAimSyncData[playerid] = d;
            }			

            // Fix first-person up/down aim sync
            if (lastWeapon{playerid} == 34 
            || lastWeapon{playerid} == 35 
            || lastWeapon{playerid} == 36 
            || lastWeapon{playerid} == 43)
            {
                d[PR_aimZ] = -d[PR_camFrontVec][2];

                if (d[PR_aimZ] > 1.0)
                {
                    d[PR_aimZ] = 1.0;
                }
                else if (d[PR_aimZ] < -1.0)
                {
                    d[PR_aimZ] = -1.0;
                }
            }

            if (infiniteAmmo{playerid})
            {
                d[PR_camZoom] = 2;
            }

            lastSyncPacket[playerid] = E_AIM_SYNC;

            BS_SetWriteOffset(bs, 8);
            BS_WriteAimSync(bs, d); // rewrite
        }
        case VEHICLE_SYNC:
        {
            new d[PR_InCarSync];

            BS_IgnoreBits(bs, 8);
            BS_ReadInCarSync(bs, d);

            if (GetSyncFrozenState(playerid, E_VEHICLE_SYNC)
            || GetSyncFrozenState(playerid, E_ALL_SYNC))
            {
                d = lastVehicleSyncData[playerid];
            }
            else
            {
                lastVehicleSyncData[playerid] = d;
            }				

            if (d[PR_weaponId] > 46 || (d[PR_weaponId] > 18 && d[PR_weaponId] < 22))
            {
                d[PR_weaponId] = 0;
            }

            if (fakeHealth{playerid} != 255)
            {
                d[PR_playerHealth] = fakeHealth{playerid};
            }

            if (fakeArmour{playerid} != 255)
            {
                d[PR_armour] = fakeArmour{playerid}; 
            }

            lastSyncPacket[playerid] = E_VEHICLE_SYNC;

            BS_SetWriteOffset(bs, 8);
            BS_WriteInCarSync(bs, d); // rewrite
        }
        case PASSENGER_SYNC:
        {
            new d[PR_PassengerSync];

            BS_IgnoreBits(bs, 8);
            BS_ReadPassengerSync(bs, d);

            if (GetSyncFrozenState(playerid, E_PASSENGER_SYNC)
            || GetSyncFrozenState(playerid, E_ALL_SYNC))
            {
                d = lastPassengerSyncData[playerid];
            }
            else
            {
                lastPassengerSyncData[playerid] = d;
            }				

            if (d[PR_weaponId] > 46 || (d[PR_weaponId] > 18 && d[PR_weaponId] < 22))
            {
                d[PR_weaponId] = 0;
            }

            if (fakeHealth{playerid} != 255)
            {
                d[PR_playerHealth] = fakeHealth{playerid};
            }

            if (fakeArmour{playerid} != 255)
            {
                d[PR_playerArmour] = fakeArmour{playerid};
            }

            lastSyncPacket[playerid] = E_PASSENGER_SYNC;

            BS_SetWriteOffset(bs, 8);
            BS_WritePassengerSync(bs, d); // rewrite
        }
        case SPECTATING_SYNC:
        {
            new d[PR_SpectatingSync];

            BS_IgnoreBits(bs, 8);
            BS_ReadSpectatingSync(bs, d);

            if (GetSyncFrozenState(playerid, E_SPECTATING_SYNC)
            || GetSyncFrozenState(playerid, E_ALL_SYNC))
            {
                d = lastSpectatingSyncData[playerid];
            }
            else
            {
                lastSpectatingSyncData[playerid] = d;
            }	

            lastSyncPacket[playerid] = E_SPECTATING_SYNC;	

            BS_SetWriteOffset(bs, 8);
            BS_WriteSpectatingSync(bs, d); // rewrite
        }
    }

    #if defined SKY_OnIncomingPacket
        return SKY_OnIncomingPacket(playerid, packetid, bs);
    #else
        return 1;
    #endif
}

#if defined _ALS_OnIncomingPacket
    #undef OnIncomingPacket
#else
    #define _ALS_OnIncomingPacket
#endif
#define OnIncomingPacket SKY_OnIncomingPacket
#if defined SKY_OnIncomingPacket
    forward SKY_OnIncomingPacket(playerid, packetid, BitStream:bs);
#endif

// Make a player appear to spawn for all players but himself
stock SpawnPlayerForWorld(playerid)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    new BitStream:bs = BS_New();

    BS_WriteValue(
        bs,
        PR_UINT32, playerid
    );

    PR_SendRPC(bs, -1, RPC_RequestSpawn);

    BS_Delete(bs);

    return 1;
}

// Keep re-sending the last received sync data
#pragma deprecated Please use FreezeSyncPacket instead
stock FreezeSyncData(playerid, bool:toggle)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    lastSyncData[playerid][PR_keys] =
    lastSyncData[playerid][PR_udKey] =
    lastSyncData[playerid][PR_lrKey] =
    lastSyncData[playerid][PR_specialAction] = 0;
    lastSyncData[playerid][PR_velocity] = Float:{0.0, 0.0, 0.0};

    SetSyncFrozenState(playerid, E_PLAYER_SYNC, toggle);

    return 1;
}

// Keep re-sending the last recieved sync packet of a certain type
stock FreezeSyncPacket(playerid, E_SYNC_TYPES:type = E_PLAYER_SYNC, bool:toggle)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    if (type == E_LAST_SYNC)
    {
        type = lastSyncPacket[playerid];
    }

    switch (type)
    {
        case E_PLAYER_SYNC: // Player Sync
        {
            lastSyncData[playerid][PR_keys] =
            lastSyncData[playerid][PR_udKey] =
            lastSyncData[playerid][PR_lrKey] =
            lastSyncData[playerid][PR_specialAction] = 0;
            lastSyncData[playerid][PR_velocity] = Float:{0.0, 0.0, 0.0};

            SetSyncFrozenState(playerid, E_PLAYER_SYNC, toggle);
        }
        case E_AIM_SYNC: // Aim Sync
            syncAimDataFrozen{playerid} = toggle;
        case E_VEHICLE_SYNC: // Vehicle Sync
        {
            lastVehicleSyncData[playerid][PR_velocity] = Float:{0.0, 0.0, 0.0};
            lastVehicleSyncData[playerid][PR_keys] =
            lastVehicleSyncData[playerid][PR_udKey] =
            lastVehicleSyncData[playerid][PR_lrKey] = 0;

            SetSyncFrozenState(playerid, E_VEHICLE_SYNC, toggle);				
        }
        case E_PASSENGER_SYNC: // Passenger Sync
        {
            lastPassengerSyncData[playerid][PR_keys] =
            lastPassengerSyncData[playerid][PR_udKey] =
            lastPassengerSyncData[playerid][PR_lrKey] = 0;

            SetSyncFrozenState(playerid, E_PASSENGER_SYNC, toggle);
        }
        case E_SPECTATING_SYNC: // Spectate Sync
        {
            lastSpectatingSyncData[playerid][PR_keys] =
            lastSpectatingSyncData[playerid][PR_udKey] =
            lastSpectatingSyncData[playerid][PR_lrKey] = 0;

            SetSyncFrozenState(playerid, E_SPECTATING_SYNC, toggle);
        }
        case E_ALL_SYNC: // All Syncs
            SetSyncFrozenState(playerid, E_ALL_SYNC, toggle);
        default:
            return 0;
    }

    return 1;
}

// Set the HP bar (warning: affects GetPlayerHealth)
stock SetFakeHealth(playerid, health)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    fakeHealth{playerid} = health;

    return 1;
}

// Set the armour bar (warning: affects GetPlayerArmour)
stock SetFakeArmour(playerid, armour)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    fakeArmour{playerid} = armour;

    return 1;
}

// Creates a quaternion from Euler angles
stock GetRotationQuaternion(Float:x, Float:y, Float:z, &Float:qw, &Float:qx, &Float:qy, &Float:qz) // by IllidanS4
{
    new Float:cx = floatcos(-0.5*x, degrees);
    new Float:sx = floatsin(-0.5*x, degrees);
    new Float:cy = floatcos(-0.5*y, degrees);
    new Float:sy = floatsin(-0.5*y, degrees);
    new Float:cz = floatcos(-0.5*z, degrees);
    new Float:sz = floatsin(-0.5*z, degrees);
    qw = cx * cy * cz + sx * sy * sz;
    qx = cx * sy * sz + sx * cy * cz;
    qy = cx * sy * cz - sx * cy * sz;
    qz = cx * cy * sz - sx * sy * cz;
}

// Force a specific facing angle to sync for other players
stock SetFakeFacingAngle(playerid, Float:angle = FLOAT_NAN)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    if (IsNan(angle))
    {
        fakeQuat[playerid] = Float:{FLOAT_NAN, FLOAT_NAN, FLOAT_NAN, FLOAT_NAN};
    }
    else
    {
        GetRotationQuaternion(0.0, 0.0, angle, fakeQuat[playerid][0], fakeQuat[playerid][1], fakeQuat[playerid][2], fakeQuat[playerid][3]);
    }

    return 1;
}

// Disable stealth-knife sync (only the player doing it will see it happen)
stock SetKnifeSync(toggle)
{
    knifeSync = !!toggle;

    return 1;
}

// Make a player appear dead for other players
stock SendDeath(playerid)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    // auto *pPlayer = netGame->pPlayerPool->pPlayer[playerid];

    // pPlayer->byteState = PLAYER_STATE_WASTED;

    new BitStream:bs = BS_New();

    BS_WriteValue(
        bs,
        PR_UINT16, playerid
    );

    PR_SendRPC(bs, -1, RPC_DeathBroadcast);

    BS_Delete(bs);

    return 1;
}

// Set the last animation data
// native SetLastAnimationData(playerid, data);

// Send the last sync data
// If an animation is specified, it will be similar to ApplyAnimation
#pragma deprecated Please use SendLastSyncPacket instead
stock SendLastSyncData(playerid, toplayerid, animation = 0)
{
    if (!IsPlayerConnected(playerid) || !IsPlayerConnected(toplayerid))
    {
        return 0;
    }

    new BitStream:bs = BS_New();

    sendSyncData(playerid, animation, bs);

    PR_SendPacket(bs, toplayerid, _, PR_RELIABLE_SEQUENCED);

    BS_Delete(bs);

    return 1;
}

// Send the last sync packet
// If a type is specified it will sync that packet only
// If an animation is specified, it will be similar to ApplyAnimation
stock SendLastSyncPacket(playerid, toplayerid, E_SYNC_TYPES:type = E_PLAYER_SYNC, animation = 0)
{
    if (!IsPlayerConnected(playerid) || !IsPlayerConnected(toplayerid))
    {
        return 0;
    }

    new BitStream:bs = BS_New();

    if (type == E_LAST_SYNC)
    {
        type = lastSyncPacket[playerid];
    }

    switch (type)
    {
        case E_PLAYER_SYNC: // Player Sync
            sendSyncData(playerid, animation, bs);
        case E_AIM_SYNC: // Aim Sync
            sendAimSyncData(playerid, bs);
        case E_VEHICLE_SYNC: // Vehicle Sync
            sendVehicleSyncData(playerid, bs);
        case E_PASSENGER_SYNC: // Passenger Sync
            sendPassengerSyncData(playerid, bs);
        case E_SPECTATING_SYNC: // Spectate Sync
            sendSpectatingSyncData(playerid, bs);
        default:
            return !BS_Delete(bs);
    }

    PR_SendPacket(bs, toplayerid, _, PR_RELIABLE_SEQUENCED);

    BS_Delete(bs);

    return 1;
}

// Clear animations for another player only
stock ClearAnimationsForPlayer(playerid, forplayerid)
{
    if (!IsPlayerConnected(playerid) || !IsPlayerConnected(forplayerid))
    {
        return 0;
    }

    new BitStream:bs = BS_New();

    BS_WriteValue(
        bs,
        PR_UINT16, playerid
    );

    PR_SendRPC(bs, forplayerid, RPC_ClearPlayerAnimation);

    BS_Delete(bs);

    return 1;
}

// Disable infinity ammo bugs and other bugs (some bugs still work)
stock SetDisableSyncBugs(toggle)
{
    disableSyncBugs = !!toggle;

    return 1;
}

// Make the weapon state always synced as WEAPONSTATE_MORE_BULLETS
stock SetInfiniteAmmoSync(playerid, toggle)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    infiniteAmmo{playerid} = !!toggle;

    return 1;
}

// Stop syncing keys for a player
stock SetKeySyncBlocked(playerid, toggle)
{
    if (!IsPlayerConnected(playerid))
    {
        return 0;
    }

    blockKeySync{playerid} = !!toggle;

    return 1;
}

// Same as YSF (renamed to avoid problems)
#pragma deprecated Please use TextDrawSetPos instead
native TextDrawSetPosition(Text:text, Float:x, Float:y) = TextDrawSetPos;
// Same as YSF (renamed to avoid problems)
#pragma deprecated Please use PlayerTextDrawSetPos instead
native PlayerTextDrawSetPosition(playerid, PlayerText:text, Float:x, Float:y) = PlayerTextDrawSetPos;
// Set the string of a TextDraw per-player
#pragma deprecated Please use TextDrawSetStringForPlayer instead
native TextDrawSetStrForPlayer(Text:text, playerid, const string[]) = TextDrawSetStringForPlayer;
