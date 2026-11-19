//
//  Unit Attribute Operations
//
int rsObjectEnable(int playerId = -1, int objectId = -1, bool enabled = true) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(objectId)) {
        if(enabled) {
            rsEffect(playerId, objectId, cEnableObject, cAttributeEnable, 1);
        } else {
            rsEffect(playerId, objectId, cEnableObject, cAttributeDisable, 0);
        }
    }
    return(objectId);
}

int rsObjectSetMetadata(int playerId = -1, int objectId = -1, int nameId = NULL, int descriptionId = NULL, int iconId = NULL) {
    if(rsIsPlayer(playerId) && rsUnitInRange(objectId)) {
        if(nameId != NULL) { rsEffect(playerId, objectId, cSetAttribute, cNameId, nameId); }
        if(descriptionId != NULL) { rsEffect(playerId, objectId, cSetAttribute, cDescriptionId, descriptionId); }
        if(iconId != NULL) { rsEffect(playerId, objectId, cSetAttribute, cIconId, iconId); }
    }
    return(objectId);
}

//
//  Add or Modify Train Location
//
int rsObjectSetLocation(int playerId = -1, int objectId = -1, int buildingId = -1, int buttonId = NULL, float trainTime = NULL, int hotkeyId = NULL, int locationIndex = NULL) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(objectId) && rsUnitInRange(buildingId)) {
        int index = 0;
        if(locationIndex != NULL) {
            int totalEntry = xsGetUnitAttribute(objectId, cTrainLocationsTotalNum);
            if((locationIndex + 1) > totalEntry) {
                rsEffect(playerId, objectId, cMulAttribute, cTrainLocationsEntryMod, 32767);
            } else {
                index = locationIndex;
            }
        }
        rsEffect(playerId, objectId, cSetAttribute, cTrainLocation, buildingId, index);
        if(buttonId != NULL) { rsEffect(playerId, objectId, cSetAttribute, cTrainButton, buttonId, index); }
        if(trainTime != NULL) { rsEffect(playerId, objectId, cSetAttribute, cTrainTime, trainTime, index); }
        if(hotkeyId != NULL) { rsEffect(playerId, objectId, cSetAttribute, cHotkeyId, hotkeyId, index); }
    }
    return(objectId);
}

//
//  Train Time Modifier
//
int rsObjectModifyTime(int playerId = -1, int objectId = -1, string operation = "set", float value = 0) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(objectId)) {
        int totalEntry = xsGetObjectAttribute(playerId, objectId, cTrainLocationsTotalNum);
        int operationId = rsGetUnitOperationId(operation);
        float result = value;

        if(operation == "subtract") {
            result = 0 - value;
        }
    
        for(index = 0; < totalEntry) {
            rsEffect(playerId, objectId, operationId, cTrainTime, result, index);
        }
    }
    return(objectId);
}

//
//  For units
//
int rsObjectModifyProperty(int playerId = -1, int objectId = -1, int property = -1, string operation = "set", float value = 0) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(objectId)) {
        int getProperty = xsGetObjectAttribute(playerId, objectId, property);
        float result = rsMath(operation, getProperty, value);

        rsEffect(playerId, objectId, cSetAttribute, property, result);
    }
    return(objectId);
}

//
//  For Unit Classes
//
int rsObjectModifyPropertyByClass(int playerId = -1, int classId = -1, int property = -1, string operation = "", float value = 0) {
    if(rsPlayerInRange(playerId) && rsClassInRange(classId)) {
        int operationId = rsGetUnitOperationId(operation);
        float result = value;

        if(operation == "subtract") {
            result = 0 - value;
        }
    
        rsEffect(playerId, classId, operationId, property, result);
    }
    return(classId);
}

//
//  Armor and Attack Manipulation
//
int rsAddAttackClass(int playerId = -1, int unitId = -1, int damageClass = -1) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        rsEffect(playerId, unitId, cSetAttribute, cAddAttackType, damageClass);
    }
    return(unitId);
}

int rsRemoveAttackClass(int playerId = -1, int unitId = -1, int damageClass = -1) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        rsEffect(playerId, unitId, cSetAttribute, cRemoveAttackType, damageClass);
    }
    return(unitId);
}

int rsAddArmorClass(int playerId = -1, int unitId = -1, int damageClass = -1) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        rsEffect(playerId, unitId, cSetAttribute, cAddArmorType, damageClass);
    }
    return(unitId);
}

int rsRemoveArmorClass(int playerId = -1, int unitId = -1, int damageClass = -1) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        rsEffect(playerId, unitId, cSetAttribute, cRemoveArmorType, damageClass);
    }
    return(unitId);
}

int rsObjectModifyAttack(int playerId = -1, int unitId = -1, string operation = "set", int damageClass = -1, float value = 0, bool setDisplay = false) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        int magicNumber = 256 * damageClass;
        float result = magicNumber + value;
        int operationId = cSetAttribute;

        if(operation == "add") {
            operationId = cAddAttribute;
            result = magicNumber + value;
        } else if(operation == "subtract") {
            operationId = cAddAttribute;
            result = 0 - (magicNumber + value);
        } else if(operation == "multiply") {
            operationId = cMulAttribute;
            result = magicNumber + value;
        }

        if(setDisplay) {
            if(damageClass == cDamageClassMelee || damageClass == cDamageClassPierce) {
                if(operation == "subtract") {
                    rsEffect(playerId, unitId, cAddAttribute, cShownAttack, 0 - value);
                } else {
                    rsEffect(playerId, unitId, operationId, cShownAttack, value);
                }
            }
        }

        rsEffect(playerId, unitId, operationId, cAttack, result);
    }
    return(unitId);
}

int rsObjectModifyArmor(int playerId = -1, int unitId = -1, string operation = "set", int damageClass = -1, float value = 0, bool setDisplay = false) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        int magicNumber = 256 * damageClass;
        float result = magicNumber + value;
        int operationId = cSetAttribute;

        if(operation == "add") {
            operationId = cAddAttribute;
            result = magicNumber + value;
        } else if(operation == "subtract") {
            operationId = cAddAttribute;
            result = 0 - (magicNumber + value);
        } else if(operation == "multiply") {
            operationId = cMulAttribute;
            result = magicNumber + value;
        }

        if(setDisplay) {
            if(operation == "subtract") {
                if(damageClass == cDamageClassMelee) {
                    rsEffect(playerId, unitId, cAddAttribute, cShownMeleeArmor, 0 - value);
                } else if(damageClass == cDamageClassPierce) {
                    rsEffect(playerId, unitId, cAddAttribute, cShownPierceArmor, 0 - value);
                }      
            } else {
                if(damageClass == cDamageClassMelee) {
                    rsEffect(playerId, unitId, operationId, cShownMeleeArmor, value);
                } else if(damageClass == cDamageClassPierce) {
                    rsEffect(playerId, unitId, operationId, cShownPierceArmor,value);
                }
            }
        }

        rsEffect(playerId, unitId, operationId, cArmor, result);
    }
    return(unitId);
}

//
//  Modify Range
//
int rsObjectModifyMaxRange(int playerId = -1, int unitId = -1, string operation = "", float value = -1, bool setDisplay = false) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        float result = value;
        int operationId = cSetAttribute;

        if(operation == "add" || operation == "subtract") {
            operationId = cAddAttribute;
            if(operation == "subtract") {
                result = 0 - value;
            }
        } else if(operation == "multiply") {
            operationId = cMulAttribute;
        }
        rsEffect(playerId, unitId, operationId, cMaxRange, result);
        rsEffect(playerId, unitId, operationId, cSearchRadius, result);
        rsEffect(playerId, unitId, operationId, cLineOfSight, result);

        if(setDisplay) {
            if(operation == "subtract") {
                rsEffect(playerId, unitId, operationId, cShownRange, ( 0 - result ));
            } else {
                rsEffect(playerId, unitId, operationId, cShownRange, result);
            }
            
        }
    }
    return(unitId);
}

int rsObjectModifyMinRange(int playerId = -1, int unitId = -1, string operation = "", float value = -1) {
    if(rsPlayerInRange(playerId) && rsUnitInRange(unitId)) {
        float result = value;
        int operationId = cSetAttribute;

        if(operation == "add" || operation == "subtract") {
            operationId = cAddAttribute;
            if(operation == "subtract") {
                result = 0 - value;
            }
        } else if(operation == "multiply") {
            operationId = cMulAttribute;
        }
        rsEffect(playerId, unitId, operationId, cMinimumRange, result);
    }
    return(unitId);
}

int rsObjectModifyHitPoints(int playerId = -1, int unitId = -1, string operation = "set", float value = 0) {
    rsObjectModifyProperty(playerId, unitId, cHitpoints, operation, value);
    return(unitId);
}

int rsObjectModifyMovementSpeed(int playerId = -1, int unitId = -1, string operation = "set", float value = 0) {
    rsObjectModifyProperty(playerId, unitId, cMovementSpeed, operation, value);
    return(unitId);
}

int rsObjectModifyAttackReloadTime(int playerId = -1, int unitId = -1, string operation = "set", float value = 0) {
    rsObjectModifyProperty(playerId, unitId, cAttackReloadTime, operation, value);
    return(unitId);
}

int rsObjectModifyLineOfSight(int playerId = -1, int unitId = -1, string operation = "set", float value = 0) {
    rsObjectModifyProperty(playerId, unitId, cLineOfSight, operation, value);
    return(unitId);
}

//
//  Resource Modifiers
//
int rsObjectSetResourceCost(int playerId = -1, int unitId = -1, int resourceIndex = -1, string resourceName = "food", float amounts = 0, int deductFlag = 1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, rsGetResourceOperationId(resourceIndex, "unit", "resource"), rsGetResourceId(resourceName));
        rsEffect(playerId, unitId, cSetAttribute, rsGetResourceOperationId(resourceIndex, "unit", "amount"), amounts);
        rsEffect(playerId, unitId, cSetAttribute, rsGetResourceOperationId(resourceIndex, "unit", "deduct"), deductFlag);
    }
    return(unitId);
}

int rsObjectSetResourceCostType(int playerId = -1, int unitId = -1, int resourceIndex = -1, string resourceName = "food") {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, rsGetResourceOperationId(resourceIndex, "unit", "resource"), rsGetResourceId(resourceName));
    }
    return(unitId);
}

int rsObjectModifyResourceCostAmount(int playerId = -1, int unitId = -1, int resourceIndex = -1, string operation = "set", float amounts = 0) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId) && (resourceIndex > 0 && resourceIndex < 4) == true) {
        int index = cAmountFirstCost;
        float result = amounts;

        if(resourceIndex == 2) {
            index = cAmountSecondCost;
        } else if(resourceIndex == 3) {
            index = cAmountThirdCost;
        }

        float getResourceCost = xsGetObjectAttribute(playerId, unitId, index);
        result = rsMath(operation, getResourceCost, amounts);

        rsEffect(playerId, unitId, cSetAttribute, index, result);
    }
    return(unitId);
}

int rsObjectSetResourceCostDeduct(int playerId = -1, int unitId = -1, int resourceIndex = -1, int deductFlag = 1) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, unitId, cSetAttribute, rsGetResourceOperationId(resourceIndex, "unit", "deduct"), deductFlag);
    }
    return(unitId);
}
//
//  Charge Attack Modifiers
//
int rsObjectAbility(int playerId = -1, int unitId = -1, int maxCharge = NULL, float rechargeRate = NULL, int chargeEvent = NULL, int chargeTarget = NULL, int chargeProjectile = NULL) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        if(maxCharge != NULL) { rsEffect(playerId, unitId, cSetAttribute, cMaxCharge, maxCharge); }
        if(rechargeRate != NULL) { rsEffect(playerId, unitId, cSetAttribute, cRechargeRate, rechargeRate); }
        if(chargeEvent != NULL) { rsEffect(playerId, unitId, cSetAttribute, cChargeEvent, chargeEvent); }
        if(chargeTarget != NULL) { rsEffect(playerId, unitId, cSetAttribute, cChargeTarget, chargeTarget); }
        if(chargeProjectile != NULL) { rsEffect(playerId, unitId, cSetAttribute, cChargeProjectileUnit, chargeProjectile); }
    }
    return(unitId);
}

int rsObjectMaxCharge(int playerId = -1, int unitId = -1, string operation = "set", int value = 0) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        int getValue = xsGetObjectAttribute(playerId, unitId, cMaxCharge);
        int result = rsMath(operation, getValue, value);
        rsEffect(playerId, unitId, cSetAttribute, cMaxCharge, result);
    }
    return(unitId);
}

int rsObjectRechargeRate(int playerId = -1, int unitId = -1, string operation = "set", float value = 0) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        float getValue = xsGetObjectAttribute(playerId, unitId, cRechargeRate);
        float result = rsMath(operation, getValue, value);
        rsEffect(playerId, unitId, cSetAttribute, cRechargeRate, result);
    }
    return(unitId);
}

int rsObjectChargeEvent(int playerId = -1, int unitId = -1, string operation = "set", int value = 0) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        int getValue = xsGetObjectAttribute(playerId, unitId, cChargeEvent);
        int result = rsMath(operation, getValue, value);
        rsEffect(playerId, unitId, cSetAttribute, cChargeEvent, result);
    }
    return(unitId);
}

int rsObjectChargeTarget(int playerId = -1, int unitId = -1, string operation = "set", int value = 0) {
    if(rsUnitInRange(unitId) && rsPlayerInRange(playerId)) {
        int getValue = xsGetObjectAttribute(playerId, unitId, cChargeTarget);
        int result = rsMath(operation, getValue, value);
        rsEffect(playerId, unitId, cSetAttribute, cChargeTarget, result);
    }
    return(unitId);
}

int rsUpgradeUnit(int playerId = -1, int from = -1, int to = -1, int flags = -1) {
    if(rsUnitInRange(from) && rsUnitInRange(to) && rsPlayerInRange(playerId)) {
        rsEffect(playerId, from, cUpgradeUnit, to, flags);
    }
    return(to);
}

int rsSpawnUnits(int playerId = -1, int targetBuilding = -1, int unit = -1, int quantity = 1, int cap = 1) {
    if(rsUnitInRange(from) && rsUnitInRange(to) && rsPlayerInRange(playerId)) {
        xsEffectAmount(cModResource, cAttributeSpawnCap, cAttributeSet, cap, playerId);
        rsEffect(playerId, unit, cSpawnUnit, targetUnit, count);
    }
    return(to);
}
