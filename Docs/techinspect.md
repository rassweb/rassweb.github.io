# Technology Inspect API
This is the main reason this library exists. It provides a way to track the status of the desired technologies in real time.  You don't need to write separate rules; just use the functions listed below.

<div class="toc">

- [Events](#techevents)
    - [RsEventTechnology](#techstate)
- [Functions](#techfunc)
    - [rsTechnologyInspectAdd](#techinspadd)
    - [rsTechnologyInspectAddAll](#techinspaddall)
    - [rsTechnologyInspectRemove](#techinsprm)
    - [rsTechnologyInspectRemoveAll](#techinsprmall)

</div>

### Events<a name="techevents"></a>

##### RsEventTechnology(string eventName, int playerId, int techId, int techState, int params, bool fromQueue)<a name="techstate"></a>

This function allows you to monitor the status of selected technologies. You don't need to call this function; you need to edit it.

##### Example

```c++
void RsEventTechnology(string eventName = "", int playerId = -1, int techId = -1, int techState = -1, int params = NULL, bool fromQueue = false) {
    if(eventName == "done") {
        // Runs when any player successfully researches a technology.
        if(techId == 102) {
            // Runs when a player reaches the Castle Age.
        }

        if(playerId == 1 && techId == 103) {
            // If Player 1 reaches the Imperial Age, the Militia line gains +2 attack.
            for(index = 0; < rsTotal(UNITLINE_MILITIA)) {
                rsObjectModifyAttack(playerId, rsArrayIntGet(UNITLINE_MILITIA, index), "add", cDamageClassMelee, 2);
            }

        }
    }
}
```

**Parameters:**
| Type | Name | Description |
| -------- | ----- | ----- |
| string | eventName | The event name. Possible values: disabled, notready, ready, inprogress, done, queued |
| int | playerId | The player ID for whom the technology status has changed  |
| int | technologyId | The technology id |
| int | params | Other parameters defined during the addition |
| bool | fromQueue | This will be true if the technology was in a queue before the state change |

\[ [Top](#top) \]

### Functions<a name="techfunc"></a>

##### rsTechnologyInspectAdd(int playerId, int techId, int params)<a name="techinspadd"></a>

Add a technology to the inspector for a specific player.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |
| int | params | additional parameter | NULL | optional |

\[ [Top](#top) \]

##### rsTechnologyInspectAddAll(int techId, int params)<a name="techinspaddall"></a>

Add a technology to the inspector for all palyers.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | techId | selected technology ID | -1 | *required* |
| int | params | additional parameter | NULL | optional |

\[ [Top](#top) \]

##### rsTechnologyInspectRemove(int playerId, int techId)<a name="techinsprm"></a>

Add a technology to the inspector for a specific player.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | playerId | selected player ID | -1 | *required* |
| int | techId | selected technology ID | -1 | *required* |

\[ [Top](#top) \]

##### rsTechnologyInspectRemoveAll(int techId)<a name="techinsprmall"></a>

Add a technology to the inspector for all palyers.

**Parameters:**
| Type | Name | Description | Default value | Required |
| -------- | ----- | ----- | ----- | ----- |
| int | techId | selected technology ID | -1 | *required* |

\[ [Top](#top) \]

