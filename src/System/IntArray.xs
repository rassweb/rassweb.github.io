//
//  Integer Array
//
int rsArrayInt(string items = "") {
    if(items == "")
        return(xsArrayCreateInt(0));

    int itemList = strSplit(items, ",");
    int newArray = xsArrayCreateInt(0);
    int listSize = xsArrayGetSize(itemList);


    for(i = 0; < listSize) {
        int integer = strToInt(strTrim(xsArrayGetString(itemList, i)), 0, NULL);

        if(integer != NULL) {
            int newSize = xsArrayGetSize(newArray);
            xsArrayResizeInt(newArray, newSize + 1);
            xsArraySetInt(newArray, newSize, integer);
        }
    }
    return(newArray);
}

bool rsArrayIntPush(int arrayId = -1, int value = -1) {
    if(arrayId != -1) {
        int listSize = xsArrayGetSize(arrayId);
        xsArrayResizeInt(arrayId, listSize + 1);
        return(xsArraySetInt(arrayId, listSize, value));
    }
    return(false);
}

bool rsArrayIntEdit(int arrayId = -1, int index = -1, int value = -1) {
    if(arrayId != -1) {
        int listSize = xsArrayGetSize(arrayId);
        if(index < 0 || index > (listSize - 1) || listSize < 1) { return(false); }
        return(xsArraySetInt(arrayId, index, value));
    }
    return(false);
}

bool rsArrayIntRemove(int arrayId = -1, int index = -1) {
    if(arrayId != -1) {
        int listSize = xsArrayGetSize(arrayId);
        if(index < 0 || index > (listSize - 1) || listSize < 1) { return(false); }

        int newArray = xsArrayCreateInt(0);
        for(i = 0; < listSize) {
            if(i != index) {
                int getNewSize = xsArrayGetSize(newArray);
                xsArrayResizeInt(newArray, getNewSize + 1);
                xsArraySetInt(newArray, getNewSize, xsArrayGetInt(arrayId, i));
            }
        }
        xsArrayResizeInt(arrayId, xsArrayGetSize(newArray));
        for(i = 0; < xsArrayGetSize(newArray)) {
            xsArraySetInt(arrayId, i, xsArrayGetInt(newArray, i));
        }
        newArray = -1;
        return(true);
    }
    return(false);
}

int rsArrayIntGet(int arrayId = -1, int index = -1) {
    if(arrayId != -1) {
        return(xsArrayGetInt(arrayId, index));
    }
    return(NULL);
}

int rsArrayIntIndexOf(int arrayId = -1, int value = -1) {
    if(arrayId != -1) {
        for(i = 0; < xsArrayGetSize(arrayId)) {
            if(xsArrayGetInt(arrayId, i) == value) {
                return(i);
                break;
            }
        }
    }
    return(-1);
}

int rsArrayIntShift(int arrayId = -1) {
    if(arrayId != -1 && xsArrayGetSize(arrayId) > 0) {
        int value = rsArrayIntGet(arrayId, 0);
        if(rsArrayIntRemove(arrayId, 0)) {
            return(value);
        }
    }
    return(NULL);
}

int rsArrayIntPop(int arrayId = -1) {
    if(arrayId != -1) {
        int size = xsArrayGetSize(arrayId);
        if(size > 0) {
            int value = rsArrayIntGet(arrayId, size - 1);
            if(rsArrayIntRemove(arrayId, size - 1)) {
                return(value);
            }
        }
    }
    return(NULL);
}
