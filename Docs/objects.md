# Objects
It is possible to modify the properties of units, buildings, and other objects in the game more easily. There is no need to write separate, more complex mathematical operations, for example when editing armor values. These functions simplify certain operations so that less code needs to be written.

## Table of Contents
<div class="toc">

- [Property Manipulation](#prop)
    - [rsObjectSetMetadata](#propmeta)
    - [rsObjectSetLocation](#proplocation)
    - [rsObjectModifyTime](#proptraintime)
    - [rsObjectModifyProperty](#propmodbyobj)
    - [rsObjectModifyPropertyByClass](#propmodbyclass)
    - [rsAddAttackClass](#propaddattack)
    - [rsRemoveAttackClass](#propremoveattack)
    - [rsAddArmorClass](#propaddarmor)
    - [rsRemoveArmorClass](#propremovearmor)
    - [rsModifyAttack](#propmodifyattack)
    - [rsModifyArmor](#propmodifyarmor)
    - [rsModifyMaxRange](#propmodifymaxrange)
    - [rsModifyMinRange](#propmodifyminrange)
    - [rsModifyHitPoints](#propmodifyhp)
    - [rsModifyMovementSpeed](#propmodifyspeed)
    - [rsModifyAttackReloadTime](#propmodifyattackspeed)
    - [rsModifyLineOfSight](#propmodifylos)
    - [rsObjectSetResourceCost](#propmodifyres)
    - [rsObjectSetResourceCostType](#propmodifyrescosttype)
    - [rsObjectSetResourceCostAmount](#propmodifyrescostamount)
    - [rsObjectSetResourceCostDeduct](#propmodifyrescostdeduct)
    - [rsObjectAbility](#propability)
    - [rsObjectMaxCharge](#propabilitymaxcharge)
    - [rsObjectRechargeRate](#propabilityrecharge)
    - [rsObjectChargeEvent](#propabilityevent)
    - [rsObjectChargeTarget](#propabilitytarget)
    - [rsUpgradeUnit](#propupgrade)
    - [rsSpawnUnits](#propspawn)
    - [rsObjectSetGraphics](#propgraphic)

</div>

### Property Manipulation<a name="prop"></a>
##### rsObjectSetMetadata(int playerId, int objectId, int nameId, int descriptionId, int iconId)<a name="propmeta"></a>

This can change the selected object name, description, and icon by player.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | objectId | selected object ID | -1 | *required* |
| int | nameId | language string ID | NULL | *optional* |
| int | descriptionId | language description ID | NULL | *optional* |
| int | iconId | object icon ID | NULL | *optional* |

\[ [Top](#top) \]

##### rsObjectSetLocation(int playerId , int objectId, int buildingId, int buttonId, float trainTime, int hotkeyId, int locationIndex)<a name="proplocation"></a>

This allows you to change, add, or edit the location and train time of the specified object.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | objectId | selected object ID | -1 | *required* |
| int | buildingId | target building ID | -1 | *required* |
| int | buttonId | the button position | NULL | *optional* |
| float | trainTime | duration of train time | NULL | *optional* |
| int | hotkeyId | hotkey ID | NULL | *optional* |
| int | locationIndex | the train location index | NULL | *optional* |

\[ [Top](#top) \]

##### rsObjectModifyTime(int playerId, int objectId, string operation, float value)<a name="proptraintime"></a>

Add, subtract, multiply or set the selected object train time.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | objectId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyProperty(int playerId, int objectId, int property, string operation, float value)<a name="propmodbyobj"></a>

Changing the specified properties of a given object.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | objectId | selected object ID | -1 | *required* |
| int | property | the ID of the property to be changed: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/#11-object-attribute) | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyPropertyByClass(int playerId, int objectId, int property, string operation, float value)<a name="propmodbyclass"></a>

Changing the specified properties of a given unit class.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | classId | selected object class ID: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/#12-object-class) | -1 | *required* |
| int | property | the ID of the property to be changed: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/#11-object-attribute) | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsAddAttackClass(int playerId, int unitId, int damageClass)<a name="propaddattack"></a>

Add damage class of a given unit.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | damageClass | the ID of the damage class: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/?h=cdamageclass#14-damage-class) | -1 | *required* |

\[ [Top](#top) \]

##### rsRemoveAttackClass(int playerId, int unitId, int damageClass)<a name="propremoveattack"></a>

Remove damage class of a given unit.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | damageClass | the ID of the damage class: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/?h=cdamageclass#14-damage-class) | -1 | *required* |

\[ [Top](#top) \]

##### rsAddArmorkClass(int playerId, int unitId, int damageClass)<a name="propaddarmor"></a>

Add damage class of a given unit.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | damageClass | the ID of the damage class: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/?h=cdamageclass#14-damage-class) | -1 | *required* |

\[ [Top](#top) \]

##### rsRemoveArmorClass(int playerId, int unitId, int damageClass)<a name="propremovearmor"></a>

Remove damage class of a given unit.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | damageClass | the ID of the damage class: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/?h=cdamageclass#14-damage-class) | -1 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyAttack(int playerId, int unitId, string operation, int damageClass, float value, bool setDisplay)<a name="propmodifyattack"></a>

Add/remove/set/subtract attak of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| int | damageClass | the ID of the damage class: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/?h=cdamageclass#14-damage-class) | -1 | *required* |
| float | value | quantity | 0 | *required* |
| bool | setDisplay | It also changes the value to be shown attack. Only works when modify melee or pierce attack | false | optional |

\[ [Top](#top) \]

##### rsObjectModifyArmor(int playerId, int unitId, string operation, int damageClass, float value, bool setDisplay)<a name="propmodifyarmor"></a>

Add/remove/set/subtract armor of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| int | damageClass | the ID of the damage class: [See](https://ugc.aoe2.rocks/general/xs/constants/constants/?h=cdamageclass#14-damage-class) | -1 | *required* |
| float | value | quantity | 0 | *required* |
| bool | setDisplay | It also changes the value to be shown armor. Only works when modify melee or pierce armor | false | optional |

\[ [Top](#top) \]

##### rsObjectModifyMaxRange(int playerId, int unitId, string operation, float value, bool setDisplay)<a name="propmodifymaxrange"></a>

Add/remove/set/subtract maximum range of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |
| bool | setDisplay | It also changes the value to be shown range | false | optional |

\[ [Top](#top) \]

##### rsObjectModifyMinRange(int playerId, int unitId, string operation, float value)<a name="propmodifyminrange"></a>

Add/remove/set/subtract minimum range of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyHitPoints(int playerId, int unitId, string operation, float value)<a name="propmodifyhp"></a>

Add/remove/set/subtract hit points of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyMovementSpeed(int playerId, int unitId, string operation, float value)<a name="propmodifyspeed"></a>

Add/remove/set/subtract movement speed of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyAttackReloadTime(int playerId, int unitId, string operation, float value)<a name="propmodifyattackspeed"></a>

Add/remove/set/subtract attack reload time of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectModifyLineOfSight(int playerId, int unitId, string operation, float value)<a name="propmodifylos"></a>

Add/remove/set/subtract line of sight of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectSetResourceCost(int playerId, int unitId, int resourceIndex, string resourceName, float amounts, int deductFlag)<a name="propmodifyres"></a>

Set base resource of object

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | resourceIndex | the id of the resource row (1 to 3) | 1 | *required* |
| string | resourceName | the resource: food, wood, gold or stone | food | *required* |
| float | amounts | quantity | 0 | *required* |
| int | deductFlag | 0 = no, 1 = yes | 1 | *required* |


\[ [Top](#top) \]

##### rsObjectSetResourceCostType(int playerId, int unitId, int resourceIndex, string resourceName)<a name="propmodifyrescosttype"></a>

Set resource cost type

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | resourceIndex | the id of the resource row (1 to 3) | 1 | *required* |
| string | resourceName | the resource: food, wood, gold or stone | food | *required* |


\[ [Top](#top) \]

##### rsObjectModifyResourceCostAmount(int playerId, int unitId, int resourceIndex, string operation, float amounts)<a name="propmodifyrescostamount"></a>

Add/set/multiply or subtract resource cost amount

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | resourceIndex | the id of the resource row (1 to 3) | 1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | amounts | quantity | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectSetResourceCostDeduct(int playerId, int unitId, int resourceIndex, int deductFlag)<a name="propmodifyrescostdeduct"></a>

Set resource cost deduct flag

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | resourceIndex | the id of the resource row (1 to 3) | 1 | *required* |
| int | deductFlag | 0 = no, 1 = yes | 1 | *required* |

\[ [Top](#top) \]

##### rsObjectAbility(int playerId, int unitId, int maxCharge, float rechargeRate, int chargeEvent, int chargeTarget, int chargeProjectile)<a name="propability"></a>

Set charge ability for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | maxCharge | Maximum charge number | NULL | optional |
| float| rechargeCharge | Recharge rate | NULL | optional |
| int| chargeEvent | Charge event ID | NULL | optional |
| int| chargeTarget | Charge Target numbers | NULL | optional |
| int | chargeProjectile | The ID of projectile unit | NULL | *optional* |

\[ [Top](#top) \]

##### rsObjectMaxCharge(int playerId, int unitId, string operation, int value)<a name="propabilitymax"></a>

Set maximum charge for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| int | value | Maximum charge number | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectRechargeRate(int playerId, int unitId, string operation, float value)<a name="propabilityrecharge"></a>

Set maximum charge for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | Recharge rate number | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectChargeEvent(int playerId, int unitId, string operation, float value)<a name="propabilityevent"></a>

Set charge event ID for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| int | value | Charge event number | 0 | *required* |

\[ [Top](#top) \]

##### rsObjectChargeTarget(int playerId, int unitId, string operation, float value)<a name="propabilitytarget"></a>

Set charge targets for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| int | value | Charge target number | 0 | *required* |

\[ [Top](#top) \]

##### rsUpgradeUnit(int playerId, int from, int to, int flags)<a name="propupgrade"></a>

Set charge targets for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | from | object that want to upgrade | -1 | *required* |
| int | to | what the object changes to | -1 | *required* |
| int | flags | Upgrade mode: -1 all objects, 2 = selected, 3 = all including own master | -1 | *required* |

\[ [Top](#top) \]

##### rsSpawnUnits(int playerId, int targetBuilding, int unit, int quantity, int cap)<a name="propspawn"></a>

Set charge targets for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | targetBuilding | where the units are formed | -1 | *required* |
| int | unit | desired unit ID | -1 | *required* |
| int | quantity | how many units should be created | -1 | *required* |
| int | cap | This value caps how many buildings can spawn units when triggering a spawn effect | -1 | *required* |

\[ [Top](#top) \]


##### rsObjectSetGraphics(int playerId, int unitId int standingGraphic, int attackGraphic, int walkingGraphic, int dyingGraphic, int decayGraphic)<a name="propgraphic"></a>

Set charge targets for desired unit

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | unitId | selected object ID | -1 | *required* |
| int | standingGraphic | Idle graphic ID | NULL | *optional* |
| int | attackGraphic | Attack graphic ID | NULL | *optional* |
| int | walkingGraphic | Walking graphic ID | NULL | *optional* |
| int | dyingGraphic | Dying graphic ID | NULL | *optional* |
| int | decayGraphic | Decay graphic ID | NULL | *optional* |

\[ [Top](#top) \]
