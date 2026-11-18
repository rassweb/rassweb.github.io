# Technologies
Technologies can be manipulated more easily and with less code. For example, a technology's name, description, and icon can all be modified through a single function.
Currently XS Script does not provide a way to add or remove resource costs for a specific technology. Although this functionality does not work at the moment, the library includes a dedicated function for it in case the issue is fixed in the near future.

## Table of Contents
<div class="toc">

- [Basic](#techbasic)
    - [rsTechEnable](#techenable)
    - [rsTechSetMetadata](#techmeta)
    - [rsTechSetLocation](#techlocation)
    - [rsTechModifyBaseCost](#techbasecost)
    - [rsTechModifyTime](#techtime)
    - [rsTechSetResourceCost](#techsetres)

</div>

### Basic<a name="techbasic"></a>

##### rsTechEnable(int playerId, int techId, bool enabled)<a name="techenable"></a>

Enable or disable technology

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| bool | enabled | toggle tech state | true | *required* |

\[ [Top](#top) \]

##### rsTechSetMetadata(int playerId, int techId, int nameId, int descriptionId, int iconId)<a name="techmeta"></a>

Set name ID, description ID and icon ID

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| int | nameId | Name string language ID | NULL | optional |
| int | descriptionId | Description string language ID | NULL | optional |
| int | iconId | Technology icon ID | NULL | optional |

\[ [Top](#top) \]

##### rsTechSetLocation(int playerId, int techId, int buildingId, int buttonId, int trainTime, int hotkeyId, int trainLocationIndex)<a name="techlocation"></a>

Set technology location.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| int | buildingId | The building object ID | NULL | optional |
| int | buttonId |The button ID | NULL | optional |
| int | trainTime | Train time | NULL | optional |
| int | hotkeyTime | Hotkey ID | NULL | optional |
| int | trainLocationIndex | Train location index | 0 | optional |

\[ [Top](#top) \]

##### rsTechModifyBaseCost(int playerId, int techId, string operation, string costType, float amount)<a name="techbasecost"></a>

Modify technology base cost (food, wood, gold or stone if set)

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| string | costType | the resource: food, wood, gold or stone | food | *required* |
| float | amount | cost amount | 0 | *required* |

\[ [Top](#top) \]

##### rsTechModifyTime(int playerId, int techId, string operation, float value)<a name="techtime"></a>

Modify technology research time

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| string | operation | Mathematical operation: add, set, subtract or multiply | "set" | *required* |
| float | value | the time you want to add, subtract, multiply or set | 0 | *required* |

\[ [Top](#top) \]

### Currently not working<a name="techbasic"></a>
You can only change the quantity, and only where it has been set.

##### rsTechSetResourceCost(int playerId, int techId, int resourceIndex, string resourceName, float amounts, int deductFlag)<a name="techsetres"></a>

Perhaps in the near future you'll be able to set the resource type, quantity, and deduction for the selected technology and sequence. It's not working right now!

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| int | resourceIndex | The index of resoure field (1 to 3) | -1 | *required* |
| string | resourceName | the resource: food, wood, gold or stone | food | *required* |
| float | amounts | the cost you want to set | 0 | *required* |
| int | deductFlag | 0 = no, 1 = yes | 1 | *required* |

\[ [Top](#top) \]
