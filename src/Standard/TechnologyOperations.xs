//
//  Technology Operations
//

int rsTechModifyAttr(int playerId = -1, int techId = -1, int attribute = -1, float value = 0, int locationEntry = NULL) {
    rsEffect(playerId, techId, cModifyTech, attribute, value, locationEntry);
    return(techId);
}

// Enabe or Disable Technology
int rsTechEnable(int playerId = -1, int techId = -1, bool enabled = true) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        if(enabled) {
            rsTechModifyAttr(playerId, techId, cAttrSetState, cAttributeEnable);
        } else {
            rsTechModifyAttr(playerId, techId, cAttrSetState, cAttributeDisable);
        }
    }
    return(techId);
}

int rsTechSetMetadata(int playerId = -1, int techId = -1, int nameId = NULL, int descriptionId = NULL, int iconId = NULL) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        if(nameId != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetName, nameId); }
        if(descriptionId != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetDescription, descriptionId); }
        if(iconId != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetIcon, iconId); }
    }
    return(techId);
}

int rsTechSetLocation(int playerId = -1, int techId = -1, int buildingId = NULL, int buttonId = NULL, int trainTime = NULL, int hotkeyId = NULL, int trainLocationIndex = 0) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        if(buildingId != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetLocation, buildingId, trainLocationIndex); }
        if(buttonId != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetButton, buttonId, trainLocationIndex); }
        if(trainTime != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetTime, trainTime, trainLocationIndex); }
        if(hotkeyId != NULL) { rsTechModifyAttr(playerId, techId, cAttrSetHotkey, hotkeyId, trainLocationIndex); }
    }
    return(techId);
}

//
//  Base cost modifier: food, wood, gold, stone
//
int rsTechModifyBaseCost(int playerId = -1, int techId = -1, string operation = "set", string costType = "food", float amount = 0) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        int operationId = rsGetCostOperationId(operation, costType);
        if(operation == "subtract") {
            amount = 0 - amount;
        }
        rsTechModifyAttr(playerId, techId, operationId, amount);
    }
    return(techId);
}

//
//  Technology Time Operation
//  Apply for all entry
int rsTechModifyTime(int playerId = -1, int techId = -1, string operation = "add", float value = 0) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        int getEntryLength = xsGetTechAttribute(playerId, techId, cTechNumResearchLocations);
        float result = value;
        for(i = 0; < getEntryLength) {
            int getResearchTime = xsGetTechAttribute(playerId, techId, cTechResearchTime, i);
            if(operation == "subtract") {
                result = getResearchTime - value;
            } else if(operation == "add") {
                result = getResearchTime + value;
            } else if(operation == "multiply") {
                result = getResearchTime * value;
            }
            rsTechModifyAttr(playerId, techId, cAttrSetTime, result, i);
        }
    }
    return(techId);
}

//
//  Resource Cost Modifiers: Currentry Not Working
//
int rsTechSetResourceCost(int playerId = -1, int techId = -1, int resourceIndex = -1, string resourceName = "food", float amounts = 0, int deductFlag = 1) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        rsTechModifyAttr(playerId, techId, rsGetResourceOperationId(resourceIndex, "tech", "resource"), rsGetResourceId(resourceName));
        rsTechModifyAttr(playerId, techId, rsGetResourceOperationId(resourceIndex, "tech", "amount"), amounts);
        rsTechModifyAttr(playerId, techId, rsGetResourceOperationId(resourceIndex, "tech", "deduct"), deductFlag);
    }
    return(techId);
}

int rsTechSetResourceCostType(int playerId = -1, int techId = -1, int resourceIndex = -1, string resourceName = "food") {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        rsTechModifyAttr(playerId, techId, rsGetResourceOperationId(resourceIndex, "tech", "resource"), rsGetResourceId(resourceName));
    }
    return(techId);
}

int rsTechSetResourceCostAmount(int playerId = -1, int techId = -1, int resourceIndex = -1, float amounts = 0) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        rsTechModifyAttr(playerId, techId, rsGetResourceOperationId(resourceIndex, "tech", "amount"), amounts);
    }
    return(techId);
}

int rsTechSetResourceCostDeduct(int playerId = -1, int techId = -1, int resourceIndex = -1, int deductFlag = 1) {
    if(rsTechInRange(techId) && rsPlayerInRange(playerId)) {
        rsTechModifyAttr(playerId, techId, rsGetResourceOperationId(resourceIndex, "tech", "deduct"), deductFlag);
    }
    return(techId);
}
