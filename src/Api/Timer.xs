//
//  Timer API
//

// "Private" functions. Do not Use!

int ___RS_API_TIMERS___ = -1; // Storage

int ___RS_API_TIMER_IS_EXISTS___(string timerName = "") {
    if(___RS_API_TIMERS___ == -1) { return(NULL); }

    int getSize = xsArrayGetSize(___RS_API_TIMERS___);
    int exists = NULL;
    if(getSize < 1) { return(NULL); }

    for(index = 0; < getSize) {
        int getItems = xsArrayGetInt(___RS_API_TIMERS___, index);
        int itemSize = xsArrayGetSize(getItems);
        if(itemSize != 3) { continue; }

        string key = xsArrayGetString(getItems, 0);
        if(key == timerName) {
            exists = index;
            break;
        }
    }
    return(exists);
}

//
//  Create Timer
//
bool ___RS_API_TIMER_CREATE___(string timerName = "", int duration = 0, int params = 0, string prefix = "BASE:") {
    if(___RS_API_TIMERS___ == -1) {
        ___RS_API_TIMERS___ = xsArrayCreateInt(0);
    }

    duration = duration * 1000;

    int isExists = ___RS_API_TIMER_IS_EXISTS___(prefix + timerName);
    if(isExists != NULL) { return(false); }

    // If not exists
    int createItem = xsArrayCreateInt(3);
    int currentTime = xsGetWorldTime();

    // Set Records: key, value, params
    xsArraySetInt(createItem, 0, xsArrayCreateString(1, prefix + timerName));
    xsArraySetInt(createItem, 1, xsArrayCreateInt(1, currentTime + duration));
    xsArraySetInt(createItem, 2, xsArrayCreateInt(1, params));

    int dbSize = xsArrayGetSize(___RS_API_TIMERS___);
    xsArrayResizeInt(___RS_API_TIMERS___, dbSize + 1);
    xsArraySetInt(___RS_API_TIMERS___, dbSize, createItem);

    // Call Events
    RsEventTimer("created", timerName, currentTime + duration, params);
    RsEventTimerCreated(timerName, currentTime + duration, params);
    return(true);
}

//
//  Remove Timer
//
void ___RS_API_TIMER_REMOVE___(string timerName = "", string prefix = "") {
    int isExists = ___RS_API_TIMER_IS_EXISTS___(prefix + timerName);
    if(isExists == NULL) { return; }

    int dbSize = xsArrayGetSize(___RS_API_TIMERS___);
    for(index = 0; < dbSize) {
        int getItems = xsArrayGetInt(___RS_API_TIMERS___, index);
        int itemSize = xsArrayGetSize(getItems);
        if(itemSize != 3) { continue; }

        string key = xsArrayGetString(xsArrayGetInt(getItems, 0), 0);

        if(key == (prefix + timerName)) {
            int getExpires = xsArrayGetInt(xsArrayGetInt(getItems, 1), 0);
            int getParams = xsArrayGetInt(xsArrayGetInt(getItems, 2), 0);
            rsArrayIntRemove(___RS_API_TIMERS___, index);
            RsEventTimer("deleted", timerName, getExpires, getParams);
            RsEventTimerDeleted(key, getExpires, getParams);
        }
    }
}

//
//  Interactive Function
//
void ___RS_API_TIMER_INSPECTOR___() {
    if(___RS_API_TIMERS___ == -1) { return; }

    int dbSize = xsArrayGetSize(___RS_API_TIMERS___);
    if(dbSize < 1) { return; }

    int currentTime = xsGetWorldTime();

    for(index = 0; < dbSize) {
        int getItems = xsArrayGetInt(___RS_API_TIMERS___, index);
        int itemSize = xsArrayGetSize(getItems);
        if(itemSize != 3) { continue; }
        int getExpiry = xsArrayGetInt(xsArrayGetInt(getItems, 1),0);
        if(getExpiry < currentTime) {
            string key = xsArrayGetString(strSplit(xsArrayGetString(xsArrayGetInt(getItems, 0), 0), ":"), 1);
            int params = xsArrayGetInt(xsArrayGetInt(getItems, 2), 0);
            rsArrayIntRemove(___RS_API_TIMERS___, index);
            RsEventTimer("expired", key, getExpiry, params);
            RsEventTimerExpired(key, getExpiry, params);
        }
    }
}

string rsTimerCreate(string timerId = "", int duration = 0, int params = -1) {
    if(timerId == "") { timerId = "" + xsGetRandomNumber(); }
    else { timerId = strReplace(timerId, ":", "_"); }

    if(___RS_API_TIMER_CREATE___(timerId,  duration, params, "BASE:")) {
        return(timerId);
    }
    return("");
}

void rsTimerRemove(string timerId = "") {
    if(timerId == "") { return; }

    timerId = strReplace(timerId, ":", "_");
    ___RS_API_TIMER_REMOVE___(timerId, "BASE:");
}

//
//  Create Countdown
//
int rsCreateCountdown(string timerUnit = "YY", string timerId = "", int duration = 0, string message = "", int params = 0) {
    int calcDuration = duration;
    int timerUnitId = cTimerUnitSeconds;
    int generateId = xsGetRandomNumberLH(0, 999999);
    int timerParams = xsArrayCreateInt(2);
    timerUnit = strToLower(timerUnit);
    if(timerUnit == "yy") {
        calcDuration = duration * 5;
        timerUnitId = cTimerUnitYears;
    } else if(timerUnit == "mm") {
        calcDuration = duration * 60;
        timerUnitId = cTimerUnitMinutes;
    } else if(timerUnit == "s") {
        timerUnitId = cTimerUnitSeconds;
    } else if(timerUnit == "mm:ss") {
        calcDuration = duration;
        timerUnitId = cTimerUnitMinutesAndSeconds;
    }

    xsArraySetInt(timerParams, 0, generateId);
    xsArraySetInt(timerParams, 1, params);

    if(___RS_API_TIMER_CREATE___(timerId, calcDuration, timerParams, "DISPLAY:")) {
        xsDisplayTimer(generateId, message, duration, timerUnitId, true, -1);
    }
    return(generateId);
}

bool rsRemoveCountdown(int timerId = -1) {
    return(xsClearTimer(timerId, -1));
}
