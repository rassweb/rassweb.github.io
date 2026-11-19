//
//  Float Array
//
int rsArrayFloat(string items = "") {
    if(items == "")
        return(xsArrayCreateFloat(0));

    int itemList = strSplit(items, ",");
    int newArray = xsArrayCreateFloat(0);
    int listSize = xsArrayGetSize(itemList);


    for(i = 0; < listSize) {
        float number = strToFloat(strTrim(xsArrayGetString(itemList, i)), NULL);

        if(number != NULL) {
            int newSize = xsArrayGetSize(newArray);
            xsArrayResizeFloat(newArray, newSize + 1);
            xsArraySetFloat(newArray, newSize, number);
        }
    }
    return(newArray);
}

bool rsArrayFloatPush(int arrayId = -1, float value = -1) {
    if(arrayId != -1) {
        int listSize = xsArrayGetSize(arrayId);
        xsArrayResizeFloat(arrayId, listSize + 1);
        return(xsArraySetFloat(arrayId, listSize, value));
    }
    return(false);
}

bool rsArrayFloatEdit(int arrayId = -1, int index = -1, float value = -1) {
    if(arrayId != -1) {
        int listSize = xsArrayGetSize(arrayId);
        if(index < 0 || index > (listSize - 1) || listSize < 1) { return(false); }
        return(xsArraySetFloat(arrayId, index, value));
    }
    return(false);
}

bool rsArrayFloatRemove(int arrayId = -1, int index = -1) {
    if(arrayId != -1) {
        int listSize = xsArrayGetSize(arrayId);
        if(index < 0 || index > (listSize - 1) || listSize < 1) { return(false); }

        int newArray = xsArrayCreateInt(0);
        for(i = 0; < listSize) {
            if(i != index) {
                int getNewSize = xsArrayGetSize(newArray);
                xsArrayResizeFloat(newArray, getNewSize + 1);
                xsArraySetFloat(newArray, getNewSize, xsArrayGetFloat(arrayId, i));
            }
        }
        xsArrayResizeFloat(arrayId, xsArrayGetSize(newArray));
        for(i = 0; < xsArrayGetSize(newArray)) {
            xsArraySetFloat(arrayId, i, xsArrayGetFloat(newArray, i));
        }
        return(true);
    }
    return(false);
}

float rsArrayFloatGet(int arrayId = -1, int index = -1) {
    if(arrayId != -1) {
        return(xsArrayGetFloat(arrayId, index));
    }
    return(NULL);
}

int rsArrayFloatIndexOf(int arrayId = -1, float value = -1) {
    if(arrayId != -1) {
        for(i = 0; < xsArrayGetSize(arrayId)) {
            if(xsArrayGetFloat(arrayId, i) == value) {
                return(i);
                break;
            }
        }
    }
    return(-1);
}

float rsArrayFloatShift(int arrayId = -1) {
    if(arrayId != -1 && xsArrayGetSize(arrayId) > 0) {
        float value = rsArrayFloatGet(arrayId, 0);
        if(rsArrayFloatRemove(arrayId, 0)) {
            return(value);
        }
    }
    return(NULL);
}

float rsArrayFloatPop(int arrayId = -1) {
    if(arrayId != -1) {
        int size = xsArrayGetSize(arrayId);
        if(size > 0) {
            float value = rsArrayFloatGet(arrayId, size - 1);
            if(rsArrayFloatRemove(arrayId, size - 1)) {
                return(value);
            }
        }
    }
    return(NULL);
}
