int ___RS_API_TECH_STATES___ = -1; // Storage

void ___RS_API_TECHNOLOGY_DB___() {
    if(___RS_API_TECH_STATES___ == -1) {
        ___RS_API_TECH_STATES___ = rsArrayInt();

        for(i = 0; < 8) {
            rsArrayIntPush(___RS_API_TECH_STATES___, rsArrayInt());
        }
    }
}

int ___RS_API_TECHNOLOGY_GET___(int playerId = -1, int techId = -1, bool returnIndex = false) {
    ___RS_API_TECHNOLOGY_DB___();
    int getPlayerDb = rsArrayIntGet(___RS_API_TECH_STATES___, playerId - 1);
    int getDbSize = xsArrayGetSize(getPlayerDb);
    int returnValue = NULL;

    if(getDbSize == 0) { return(returnValue); }

    for(itemId = 0; < getDbSize) {
        int getItems = rsArrayIntGet(getPlayerDb, itemId);
        if(xsArrayGetSize(getItems) != 3) { continue; }

        int key = rsArrayIntGet(getItems, 0);
        if(key == techId) {
            if(returnIndex) {
                returnValue = itemId;
            } else {
                returnValue = getItems;
            }
            break;
        }
    }

    return(returnValue);
}

bool ___RS_API_TECHNOLOGY_SET___(int playerId = -1, int techId = -1, int params = NULL) {
    ___RS_API_TECHNOLOGY_DB___();
    int getPlayerDb = rsArrayIntGet(___RS_API_TECH_STATES___, playerId - 1);
    int getIndex = ___RS_API_TECHNOLOGY_GET___(playerId, techId, true);
    int getDbSize = xsArrayGetSize(getPlayerDb);

    if(getIndex != NULL) {
        int getItems =  rsArrayIntGet(getPlayerDb, getIndex);
        int getKey = rsArrayIntGet(getItems, 0);

        if(techId == getKey) {
            rsArrayIntEdit(getItems, 1, xsGetTechState(techId, playerId));
            rsArrayIntEdit(getItems, 2, params);
            return(true);
        }
    }

    int record = rsArrayInt();
    rsArrayIntPush(record, techId);
    rsArrayIntPush(record, xsGetTechState(techId, playerId));
    rsArrayIntPush(record, params);
    rsArrayIntPush(getPlayerDb, record);
    return(true);
}

bool ___RS_API_TECHNOLOGY_REMOVE___(int playerId = -1, int techId = -1) {
    ___RS_API_TECHNOLOGY_DB___();
    int getPlayerDb = rsArrayIntGet(___RS_API_TECH_STATES___, playerId - 1);
    int getIndex = ___RS_API_TECHNOLOGY_GET___(playerId, techId, true);
    int getDbSize = xsArrayGetSize(getPlayerDb);

    if(getIndex != NULL) {
        rsArrayIntRemove(getPlayerDb, getIndex);
        return(true);
    }
    return(false);
}

void ___RS_API_TECHNOLOGY_CONDITIONS___(int items = -1, int playerId = -1) {
    if(items == -1) { return; }
    int getId = rsArrayIntGet(items, 0);
    int storedState = rsArrayIntGet(items, 1);
    int currentState = xsGetTechState(getId, playerId);
    bool fromQueue = false;

    if(currentState == storedState) { return; }

    if(storedState == cTechStateQueued) {
        fromQueue = true;
    } else {
        fromQueue = false;
    }

    RsEventTechnology(strToLower(rsGetTechStateAsString(currentState)), playerId, getId, currentState, rsArrayIntGet(items, 2), fromQueue);
    if(RS_REMOVE_TECH_IF_DONE && currentState == cTechStateDone) {
        ___RS_API_TECHNOLOGY_REMOVE___(playerId, getId);
    } else {
        rsArrayIntEdit(items, 1, currentState);
    }
}

void ___RS_API_TECHNOLOGY_INSPECTOR___() {
    for(player = 1; < xsGetNumPlayers()) {
        int playerIndex = player -1;
        int getPlayerDb = rsArrayIntGet(___RS_API_TECH_STATES___, playerIndex);
        int getSize = xsArrayGetSize(getPlayerDb);

        if(getSize < 1) { return; }

        for(item = 0; < getSize) {
            int getItems = rsArrayIntGet(getPlayerDb, item);
            ___RS_API_TECHNOLOGY_CONDITIONS___(getItems, player);

        }
    }
}

bool rsTechnologyInspectAdd(int playerId = -1, int techId = -1, int params = NULL) {
    return(___RS_API_TECHNOLOGY_SET___(playerId, techId, params));
}

void rsTechnologyInspectAddAll(int techId = -1, int params = NULL) {
    for(i = 0; < 8) {
        ___RS_API_TECHNOLOGY_SET___(i + 1, techId, params);
    }
}

bool rsTechnologyInspectRemove(int playerId = -1, int techId = -1) {
    return(___RS_API_TECHNOLOGY_REMOVE___(playerId, techId));
}

void rsTechnologyInspectRemoveAll(int techId = -1) {
    for(i = 0; < 8) {
        ___RS_API_TECHNOLOGY_REMOVE___(i + 1, techId);
    }
}
