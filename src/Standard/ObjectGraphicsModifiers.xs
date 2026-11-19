//
//  Change Skin for Units and Buildings
//
int rsObjectSetGraphics(int playerId = -1, int unitId = -1, int standingGraphic = NULL, int attackGraphic = NULL, int walkingGraphic = NULL, int dyingGraphic = NULL, int decayGraphic = NULL) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        if(attackGraphic != NULL) { rsEffect(playerId, unitId, cSetAttribute, cStandingGraphic, standingGraphic); }
        if(attackGraphic != NULL) { rsEffect(playerId, unitId, cSetAttribute, cAttackGraphic, attackGraphic); }
        if(walkingGraphic != NULL) { rsEffect(playerId, unitId, cSetAttribute, cWalkingGraphic, walkingGraphic); }
        if(dyingGraphic != NULL) { rsEffect(playerId, unitId, cSetAttribute, cDyingGraphic, dyingGraphic); }
        if(decayGraphic != NULL) { rsEffect(playerId, unitId, cSetAttribute, cUndeadGraphic, decayGraphic); }
    }
    return(unitId);
}

int rsObjectSetStandingGraphic(int playerId = -1, int unitId = -1, int standingGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cStandingGraphic, standingGraphic);
    }
    return(unitId);
}

int rsObjectSetStanding2Graphic(int playerId = -1, int unitId = -1, int standing2Graphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cStanding2Graphic, standing2Graphic);
    }
    return(unitId);
}

int rsObjectSetAttackGraphic(int playerId = -1, int unitId = -1, int attackGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cAttackGraphic, attackGraphic);
    }
    return(unitId);
}

int rsObjectSetAttack2Graphic(int playerId = -1, int unitId = -1, int attack2Graphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cAttack2Graphic, attack2Graphic);
    }
    return(unitId);
}

int rsObjectSetIdleAttackGraphic(int playerId = -1, int unitId = -1, int idleAttackGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cIdleAttackGraphic, idleAttackGraphic);
    }
    return(unitId);
}

int rsObjectSetDyingGraphic(int playerId = -1, int unitId = -1, int dyingGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cDyingGraphic, dyingGraphic);
    }
    return(unitId);
}

int rsObjectSetDecayGraphic(int playerId = -1, int unitId = -1, int decayGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cUndeadGraphic, decayGraphic);
    }
    return(unitId);
}

int rsObjectSetRunningGraphic(int playerId = -1, int unitId = -1, int runningGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cRunningGraphic, runningGraphic);
    }
    return(unitId);
}

int rsObjectSetSpecialGraphic(int playerId = -1, int unitId = -1, int specialGraphic = -1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, cSpecialGraphic, specialGraphic);
    }
    return(unitId);
}
