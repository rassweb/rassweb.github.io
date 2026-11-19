void rsConsole(string text = "") {
    if(RS_SHOW_ERROR_LOG) {
        xsChatData("<RED>" + text);
    }
}

int rsTotal(int array = -1) {
    return(xsArrayGetSize(array));
}

//
//  Max Tech and Unit Number
//
bool rsTechInRange(int techId = -1) {
    if(techId <= RS_MAX_TECHNOLOGY_ID && techId > 0) {
        return(true);
    }
    rsConsole("rsTechInRange Error:\nThe number of tech ID must be between 1 and " + RS_MAX_TECHNOLOGY_ID);
    return(false);
}

bool rsUnitInRange(int unitId = -1) {
    if(unitId <= RS_MAX_UNIT_ID && unitId > 0) {
        return(true);
    }
    rsConsole("rsUnitInRange Error:\nThe number of unit ID must be between 1 and " + RS_MAX_UNIT_ID);
    return(false);
}

bool rsClassInRange(int classId = -1) {
    if(classId > 899 && classId < 1000) {
        return(true);
    }
    rsConsole("rsClassInRange Error:\nThe number of class ID must be between 900 and 999");
    return(false);
}

//
//  Player validation
//
bool rsPlayerInRange(int playerId = -1) {
    int getTotalPlayer = xsGetNumPlayers();
    if((playerId > 0 && playerId <= getTotalPlayer) == true) {
        return(true);
    }
    rsConsole("rsPlayerInRange Error:\nThe number of players must be between 1 and " + getTotalPlayer);
    return(false);
}

bool rsIsPlayer(int playerId = -1) {
    int getTotalPlayer = xsGetNumPlayers();
    if((playerId > -2 && playerId <= getTotalPlayer) == true) {
        return(true);
    }
    rsConsole("rsIsPlayer Error:\nInvalid player ID: " + playerId +". The number of players must be between -1 and " + getTotalPlayer);
    return(false);
}

//
//  Base Resources: Food, wood, stone, gold
//
int rsGetResourceId(string resource = "food") {
    resource = strToLower(resource);
    int resourceId = 0;

         if(resource == "food") { resourceId = cAttributeFood; }
    else if (resource == "wood") { resourceId = cAttributeWood; }
    else if (resource == "gold") { resourceId = cAttributeGold; }
    else if(resource == "stone") { resourceId = cAttributeStone; }
    else { resourceId = -1; }

    return(resourceId);
}

string rsGetResourceAsString(int resource = 0) {
    string resourceId = "";
    switch(resource) {
        case 0 : { resourceId = "food"; }
        case 1 : { resourceId = "wood"; }
        case 2 : { resourceId = "stone"; }
        case 3 : { resourceId = "gold"; }
        default : { resourceId = "invalid"; }  
    }
    return(resourceId);
}

//
//  Technology and Object Resource cost manipulation
//
int rsGetCostOperationId(string operation = "add", string resource = "food") {
    operation = strToLower(operation);
    resource = strToLower(resource);
    int operationId = -1;

    if(operation == "add" || operation == "subtract") {
             if(resource == "food") { operationId = cAttrAddFoodCost; }
        else if(resource == "gold") { operationId = cAttrAddGoldCost; }
        else if(resource == "stone") { operationId = cAttrAddStoneCost; }
        else if(resource == "wood") { operationId = cAttrAddWoodCost; }

    } else if(operation == "multiply") {
             if(resource == "food") { operationId = cAttrMulFoodCost; }
        else if(resource == "gold") { operationId = cAttrMulGoldCost; }
        else if(resource == "stone") { operationId = cAttrMulStoneCost; }
        else if(resource == "wood") { operationId = cAttrMulWoodCost; }
        else if(resource == "all") { operationId = cAttrMulAllCosts; }
    } else {
             if(resource == "food") { operationId = cAttrSetFoodCost; }
        else if(resource == "gold") { operationId = cAttrSetGoldCost; }
        else if(resource == "stone") { operationId = cAttrSetStoneCost; }
        else if(resource == "wood") { operationId = cAttrSetWoodCost; }
    }
    return(operationId);
}

//
//  Technology or Unit Resource Cost Operations. This is not working for technologies yet.
//
int rsGetResourceOperationId(int resourceField = 1, string where = "unit", string type = "resource") {
    if(resourceField < 1 || resourceField > 3) { rsConsole("rsGetResourceOperationId: resourceField Error:\nThe resource ID must be between 1 and 3"); return(NULL); }

    where = strToLower(where);
    type = strToLower(type);
    int operationId = -1;

    if(where == "unit") {
        if(resourceField == 2) {
                if(type == "resource") { operationId = cTypeSecondCost; }
            else if(type == "amount") { operationId = cAmountSecondCost; }
            else if(type == "deduct") { operationId = cDeductFlagSecondCost; }
        } else if(resourceField == 3) {
                if(type == "resource") { operationId = cTypeThirdCost; }
            else if(type == "amount") { operationId = cAmountThirdCost; }
            else if(type == "deduct") { operationId = cDeductFlagThirdCost; }
        } else {
                if(type == "resource") { operationId = cTypeFirstCost; }
            else if(type == "amount") { operationId = cAmountFirstCost; }
            else if(type == "deduct") { operationId = cDeductFlagFirstCost; }
        }
    } else {
        if(resourceField == 2) {
                if(type == "resource") { operationId = cAttrTypeSecondCost; }
            else if(type == "amount") { operationId = cAttrAmountSecondCost; }
            else if(type == "deduct") { operationId = cAttrDeductFlagSecondCost; }
        } else if(resourceField == 3) {
                if(type == "resource") { operationId = cAttrTypeThirdCost; }
            else if(type == "amount") { operationId = cAttrAmountThirdCost; }
            else if(type == "deduct") { operationId = cAttrDeductFlagThirdCost; }
        } else {
                if(type == "resource") { operationId = cAttrTypeFirstCost; }
            else if(type == "amount") { operationId = cAttrAmountFirstCost; }
            else if(type == "deduct") { operationId = cAttrDeductFlagFirstCost; }
        }
    }
    return(operationId);
}

int rsGetUnitOperationId(string operation = "set") {
    if(operation == "add" || operation == "subtract") {
        return(cAddAttribute);
    } else if(operation == "multiply") {
        return(cMulAttribute);
    }
    return(cSetAttribute);
}
//
//  Technology States
//
int rsGetTechStateId(string techState = "") {
    techState = strToLower(techState);
    int stateId = cTechStateInvalid;

        if(techState == "disabled") { stateId =  cTechStateDisabled; }
    else if(techState == "notready") { stateId = cTechStateNotReady; }
    else if(techState == "ready") { stateId = cTechStateReady; }
    else if(techState == "inprogress") { stateId = cTechStateResearching; }
    else if(techState == "done") { stateId = cTechStateDone; }
    else if(techState == "queued") { stateId = cTechStateQueued; }
    else {  stateId = cTechStateInvalid; }

    return(stateId);
}

string rsGetTechStateAsString(int techState = 0) {
    string stateId = "invalid";
    switch(techState) {
        case -1 : { stateId = "disabled"; }
        case 0 : { stateId = "notReady"; }
        case 1 : { stateId = "ready"; }
        case 2 : { stateId = "inProgress"; }
        case 3 : { stateId = "done"; }
        case 4 : { stateId = "queued"; }
        default : { stateId = "invalid"; }  
    }
    return(stateId);
}

float rsMath(string operation = "set", float value1 = 0, float value2 = 0) {
    if(operation == "add") {
        return(value1 + value2);
    } else if(operation == "subtract") {
        return(value1 - value2);
    } else if(operation == "multiply") {
        return(value1 * value2);
    }
    return(value2);
}

//
//  Effect Amount Alias 
//
void rsEffect(int playerId = -1, int unitTechObjectId = -1, int effectId = -1, int attributeOrOperation = -1, float value = -1, int locationEntry = -1) {
    xsEffectAmount(effectId, unitTechObjectId, attributeOrOperation, value, playerId, locationEntry);
}
