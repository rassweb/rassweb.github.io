# Constants and Variables
In addition to the built-in constants, the library provides its own constants and variables that are globally accessible. Most trainable unit lines have their own dedicated variables. It is also possible to manipulate how the library operates by assigning specific values. For unit and technology lines, the IDs of unique units are included as well. For example, the Knight-line also includes the Persian Savar unit ID.

## Table of Contents
<div class="toc">

- [Settings and Checkings](#settings)
- [Units lines](#units)
    - [Archery Range](#unitarchery)
    - [Barracks](#unitbarracks)
    - [Stable](#unitstable)
    - [Siege Workshop](#unitsiegeworkshop)
    - [Dock](#unitdock)
    - [Unique Units](#unitunique)
- [Unit Upgrades and Technologies](#upgradesandtechs)
    - [Barracks](#techbarracks)
    - [Archery Range](#techarchery)
    - [Stable](#techstable)
    - [Siege Workshop](#techsiegeworkshop)
    - [Blacksmith](#techblacksmith)
    - [Dock](#techdock)
    - [University](#techuniversity)
    - [Castle](#techcastle)
    - [Monastery](#techmonastery)
    - [Town Center](#techtowncenter)
    - [Mining Camp](#techminingcamp)
    - [Lumber Camp](#techlumbercamp)
    - [Market](#techmarket)
    - [Mill](#techmill)

</div>

### Settings and Checkings<a name="settings"></a>
| Variable | Type and value | Description |
| -------- | ----- | ----- |
| NULL | **constant** int: -9999999 | "Fake NULL". Used during checkings or when parameters are omitted |
| RS\_MAX\_TECHNOLOGY\_ID | **constant** int: 1509 | Number of technologies |
| RS\_MAX\_UNIT\_ID | **constant** int: 2749 | Number of units |
| RS\_EVENT\_DELAY | int: 200 | Controlling the frequency of the Event Listener |
| RS\_SHOW\_ERROR\_LOG | bool: false | If an error occurs, a message will appear in the game if true |
| RS\_INTERACTIVITY | bool: true | Terminates the event listener if false |
| RS\_REMOVE\_TECH\_IF\_DONE | bool: false | Removes technology from the listener if researched |
| TECH\_BLANK\_TECHNOLOGIES | int: array[int] | IDs for editable technologies (Blank Technology xxx) |

\[ [Top](#top) \]

### Unit lines<a name="units"></a>
###### 1. Archery Range<a name="unitarchery"></a>
| Variable | Type and value |
| -------- | ----- |
| UNITLINE\_ARCHER | int: array[int] |
| UNITLINE\_SKIRMISHER | int: array[int] |
| UNITLINE\_CAVALRY\_ARCHER | int: array[int] |
| UNITLINE\_ELEPHANT\_ARCHER | int: array[int] |
| UNITLINE\_MOUNTED\_CROSSBOWMAN | int: array[int] |
| UNITLINE\_GENITOUR | int: array[int] |
| UNITLINE\_MOUNTED\_CROSSBOWMAN | int: array[int] |

\[ [Top](#top) \]

###### 2. Barracks<a name="unitbarracks"></a>
| Variable | Type and value |
| -------- | ----- |
| UNITLINE\_MILITIA | int: array[int] |
| UNITLINE\_CHAMPI\_SCOUT | int: array[int] |
| UNITLINE\_SPEARMAN | int: array[int] |
| UNITLINE\_EAGLE\_WARRIOR | int: array[int] |
| UNITLINE\_FIRE\_LANCER | int: array[int] |
| UNITLINE\_VARANGIAN\_GUARD | int: array[int] |

\[ [Top](#top) \]

###### 3. Stable<a name="unitstable"></a>
| Variable | Type and value |
| -------- | ----- |
| UNITLINE\_SCOUT\_CAVALRY | int: array[int] |
| UNITLINE\_KNIGHT | int: array[int] |
| UNITLINE\_HEI\_GUANG\_CAVALRY | int: array[int] |
| UNITLINE\_CAMEL\_SCOUT | int: array[int] |
| UNITLINE\_STEPPE\_LANCER | int: array[int] |
| UNITLINE\_BATTLE\_ELEPHANT | int: array[int] |

\[ [Top](#top) \]

###### 4. Siege Workshop<a name="unitsiegeworkshop"></a>
| Variable | Type and value |
| -------- | ----- |
| UNITLINE\_BATTERING\_RAM | int: array[int] |
| UNITLINE\_ARMORED\_ELEPHANT | int: array[int] |
| UNITLINE\_MANGONEL | int: array[int] |
| UNITLINE\_ROCKET\_CART | int: array[int] |
| UNITLINE\_SCORPION | int: array[int] |

\[ [Top](#top) \]

###### 5. Dock<a name="unitdock"></a>
| Variable | Type and value |
| -------- | ----- |
| UNITLINE\_FIRE\_GALLEY | int: array[int] |
| UNITLINE\_DEMOLITION\_RAFT | int: array[int] |
| UNITLINE\_GALLEY | int: array[int] |
| UNITLINE\_HULK | int: array[int] |
| UNITLINE\_CANNON\_GALLEON | int: array[int] |
| UNITLINE\_LONGSHIP | int: array[int] |

\[ [Top](#top) \]

###### 6. Unique Unit Lines<a name="unitunique"></a>
| Variable | Type and value |
| -------- | ----- |
| UNITLINE\_COMPOSITE\_BOWMAN | int: array[int] |
| UNITLINE\_JAGUAR\_WARRIOR | int: array[int] |
| UNITLINE\_RATHA | int: array[int] |
| UNITLINE\_RATHA\_MELEE | int: array[int] |
| UNITLINE\_RATHA\_RANGED | int: array[int] |
| UNITLINE\_CAMEL\_ARCHER | int: array[int] |
| UNITLINE\_HUSSITE\_WAGON | int: array[int] |
| UNITLINE\_LONGBOWMAN | int: array[int] |
| UNITLINE\_KONNIK | int: array[int] |
| UNITLINE\_KONNIK\_MOUNTED | int: array[int] |
| UNITLINE\_KREPOST\_KONNIK\_MOUNTED | int: array[int] |
| UNITLINE\_KONNIK\_INFANTRY | int: array[int] |
| UNITLINE\_COUSTILLIER | int: array[int] |
| UNITLINE\_ARAMBAI | int: array[int] |
| UNITLINE\_CATAPHRACT | int: array[int] |
| UNITLINE\_WOAD\_RAIDER | int: array[int] |
| UNITLINE\_CHU\_KO\_NU | int: array[int] |
| UNITLINE\_KIPCHAK | int: array[int] |
| UNITLINE\_JOMSVIKING | int: array[int] |
| UNITLINE\_URUMI\_SWORDSMAN | int: array[int] |
| UNITLINE\_SHOTEL\_WARRIOR | int: array[int] |
| UNITLINE\_THROWING\_AXEMAN | int: array[int] |
| UNITLINE\_MONASPA | int: array[int] |
| UNITLINE\_HUSKARL | int: array[int] |
| UNITLINE\_CASTLE\_HUSKARL | int: array[int] |
| UNITLINE\_BARRACKS\_HUSKARL | int: array[int] |
| UNITLINE\_CHAKRAM\_THROWER | int: array[int] |
| UNITLINE\_SHRIVAMSHA\_RIDER | int: array[int] |
| UNITLINE\_GHULAM | int: array[int] |
| UNITLINE\_TARKAN | int: array[int] |
| UNITLINE\_STABLE\_TARKAN | int: array[int] |
| UNITLINE\_CASTLE\_TARKAN | int: array[int] |
| UNITLINE\_KAMAYUK | int: array[int] |
| UNITLINE\_GENOESE\_CROSSBOWMAN | int: array[int] |
| UNITLINE\_SAMURAI | int: array[int] |
| UNITLINE\_IRON\_PAGODA | int: array[int] |
| UNITLINE\_LIAO\_DAO | int: array[int] |
| UNITLINE\_BALLISTA\_ELEPHANT | int: array[int] |
| UNITLINE\_WAR\_WAGON | int: array[int] |
| UNITLINE\_TURTLE\_SHIP | int: array[int] |
| UNITLINE\_LEITIS | int: array[int] |
| UNITLINE\_MAGYAR\_HUSZAR | int: array[int] |
| UNITLINE\_KARAMBIT\_WARRIOR | int: array[int] |
| UNITLINE\_GBETO | int: array[int] |
| UNITLINE\_KONA | int: array[int] |
| UNITLINE\_BOLAS\_RIDER | int: array[int] |
| UNITLINE\_PLUMED\_ARCHER | int: array[int] |
| UNITLINE\_MANGUDAI | int: array[int] |
| UNITLINE\_GUECHA\_WARRIOR | int: array[int] |
| UNITLINE\_TEMPLE\_GUARD | int: array[int] |
| UNITLINE\_WAR\_ELEPHANT | int: array[int] |
| UNITLINE\_OBUCH | int: array[int] |
| UNITLINE\_ORGAN\_GUN | int: array[int] |
| UNITLINE\_CARAVEL | int: array[int] |
| UNITLINE\_CENTURION | int: array[int] |
| UNITLINE\_MAMELUKE | int: array[int] |
| UNITLINE\_HEARTH\_TROOP | int: array[int] |
| UNITLINE\_WHITE\_FEATHER\_GUARD | int: array[int] |
| UNITLINE\_SERJEANT | int: array[int] |
| UNITLINE\_CASTLE\_SERJEANT | int: array[int] |
| UNITLINE\_DONJON\_SERJEANT | int: array[int] |
| UNITLINE\_BOYAR | int: array[int] |
| UNITLINE\_CONQUISTADOR | int: array[int] |
| UNITLINE\_KESHIK | int: array[int] |
| UNITLINE\_TEUTONIC\_KNIGHT | int: array[int] |
| UNITLINE\_BLACKWOOD\_ARCHER | int: array[int] |
| UNITLINE\_JANISSARY | int: array[int] |
| UNITLINE\_JARL | int: array[int] |
| UNITLINE\_RATTAN\_ARCHER | int: array[int] |
| UNITLINE\_BERSERK | int: array[int] |
| UNITLINE\_TIGER\_CAVALRY | int: array[int] |
| UNITLINE\_FIRE\_ARCHER | int: array[int] |

\[ [Top](#top) \]

### Unit Upgrades and Technologies<a name="upgradesandtechs"></a>
###### 1. Barracks<a name="techbarracks"></a>
| Variable | Type and value |
| -------- | ----- |
| UPGRADE\_MILITIA\_LINE | int: array[int] |
| UPGRADE\_MAN\_AT\_ARMS | int: 222 |
| UPGRADE\_LONG\_SWORDSMAN | int: 207 |
| UPGRADE\_TWO\_HANDED\_SWORDSMAN | int: 1173 |
| UPGRADE\_CHAMPION | int: 1174 |
| UPGRADE\_LEGIONARY | int: 885 |
| UPGRADE\_CHAMPI\_SCOUT\_LINE | int: array[int] |
| UPGRADE\_CHAMPI\_RUNNER | int: 1402 |
| UPGRADE\_CHAMPI\_WARRIOR | int: 1351 |
| UPGRADE\_ELITE\_CHAMPI\_WARRIOR | int: 1352 |
| UPGRADE\_SPEARMAN\_LINE | int: array[int] |
| UPGRADE\_PIKEMAN | int: 197 |
| UPGRADE\_HALBERDIER | int: 429 |
| UPGRADE\_EAGLE\_SCOUT\_LINE | int: array[int] |
| UPGRADE\_EAGLE\_WARRIOR | int: 384 |
| UPGRADE\_ELITE\_EAGLE\_WARRIOR | int: 434 |
| UPGRADE\_ELITE\_FIRE\_LANCER | int: 982 |
| UPGRADE\_ELITE\_VARANGIAN\_GUARD | int: 1454 |
| UPGRADE\_ELITE\_TEMPLE\_GUARD | int: 1401 |
| UPGRADE\_ELITE\_IBIRAPEMA\_WARRIOR | int: 1391 |
| TECH\_ARSON | int: 602 |
| TECH\_GAMBESONS | int: 875 |
| TECH\_SQUIRES | int: 215 |

\[ [Top](#top) \]

###### 2. Archery Range<a name="techarchery"></a>
| Variable | Type and value |
| -------- | ----- |
| UPGRADE\_ARCHER\_LINE | int: array[int] |
| UPGRADE\_CROSSBOWMAN | int: 100 |
| UPGRADE\_ARBALESTER | int: 237 |
| UPGRADE\_SKIRMISHER\_LINE | int: array[int] |
| UPGRADE\_ELITE\_SKIRMISHER | int: 98 |
| UPGRADE\_IMPERIAL\_SKIRMISHER | int: 655 |
| UPGRADAE\_HEAVY\_CAVALRY\_ARCHER | int: 218 |
| UPGRADE\_ELITE\_ELEPHANT\_ARCHER | int: 481 |
| UPGRADE\_HEAVY\_MOUNTED\_CROSSBOWMAN | int: 1451 |
| UPGRADE\_ELITE\_GENITOUR | int: 599 |
| TECH\_THUMB\_RING | int: 437 |
| TECH\_PARTHIAN\_TACTICS | int: 436 |
| TECH\_CRANEQUINS | int: 1452 |

\[ [Top](#top) \]

###### 3. Stable<a name="techstable"></a>
| Variable | Type and value |
| -------- | ----- |
| UPGRADE\_SCOUT\_CAVALRY\_LINE | int: array[int] |
| UPGRADE\_LIGHT\_CAVALRY | int: 254 |
| UPGRADE\_HUSSAR | int: 428 |
| UPGRADE\_WINGED\_HUSSAR | int: 786 |
| UPGRADE\_KNIGHT\_LINE | int: array[int] |
| UPGRADE\_CAVALIER | int: 209 |
| UPGRADE\_PALADIN | int: 265 |
| UPGRADE\_SAVAR | int: 526 |
| UPGRADE\_CAMEL\_SCOUT\_LINE | int: array[int] |
| UPGRADE\_HEAVY\_CAMEL\_RIDER | int: 236 |
| UPGRADE\_IMERIAL\_CAMEL\_RIDER | int: 521 |
| UPGRADE\_HEAVY\_HEI\_GUANG\_CAVALRY | int: 1033 |
| UPGRADE\_ELITE\_SHRIVAMSHA\_RIDER | int: 843 |
| UPGRADE\_ELITE\_BATTLE\_ELEPHANT | int: 631 |
| UPGRADE\_ELITE\_STEPPE\_LANCER | int: 715 |
| TECH\_BLOODLINES | int: 435 |
| TECH\_HUSBANDRY | int: 39 |

\[ [Top](#top) \]

###### 4. Siege Workshop<a name="techsiegeworkshop"></a>
| Variable | Type and value |
| -------- | ----- |
| UPGRADE\_BATTERING\_RAM\_LINE | int: array[int] |
| UPGRADE\_CAPPED\_RAM | int: 96 |
| UPGRADE\_SIEGE\_RAM | int: 255 |
| UPGRADE\_MANGONEL\_LINE | int: array[int] |
| UPGRADE\_ONAGER | int: 257 |
| UPGRADE\_SIEGE\_ONAGER | int: 320 |
| UPGRADE\_HEAVY\_ROCKET\_CART | int: 980 |
| UPGRADE\_HEAVY\_SCORPION | int: 239 |
| UPGRADE\_SIEGE\_ELEPHANT | int: 838 |

\[ [Top](#top) \]

###### 5. Blacksmith<a name="techblacksmith"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_PADDED\_ARCHER\_ARMOR\_LINE | int: array[int] |
| TECH\_PADDED\_ARCHER\_ARMOR | int: 211 |
| TECH\_LEATHER\_ARCHER\_ARMOR | int: 212 |
| TECH\_RING\_ARCHER\_ARMOR | int: 219 |
| TECH\_FLETCHING\_LINE | int: array[int] |
| TECH\_FLETCHING | int: 199 |
| TECH\_BODKIN\_ARROW | int: 200 |
| TECH\_BRACER | int: 201 |
| TECH\_FORGING\_LINE | int: array[int] |
| TECH\_FORGING | int: 67 |
| TECH\_IRON\_CASTING | int: 68 |
| TECH\_BLAST\_FURNACE | int: 75 |
| TECH\_SCALE\_MAIL\_ARMOR\_LINE | int: array[int] |
| TECH\_SCALE\_MAIL\_ARMOR | int: 74 |
| TECH\_CHAIN\_MAIL\_ARMOR | int: 76 |
| TECH\_PLATE\_MAIL\_ARMOR | int: 77 |
| TECH\_SCALE\_BARDING\_ARMOR\_LINE | int: array[int] |
| TECH\_SCALE\_BARDING\_ARMOR | int: 81 |
| TECH\_CHAIN\_BARDING\_ARMOR | int: 82 |
| TECH\_PLATE\_BARDING\_ARMOR | int: 80 |

\[ [Top](#top) \]

###### 6. Dock<a name="techdock"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_FISHING\_LINES\_LINE | int: array[int] |
| TECH\_FISHING\_LINES | int: 906 |
| TECH\_GILLNETS | int: 65 |
| UPGRADE\_DEMOLITION\_RAFT\_LINE | int: array[int] |
| UPGRADE\_DEMOLITION\_SHIP | int: 905 |
| UPGRADE\_HEAVY\_DEMOLITION\_SHIP | int: 244 |
| UPGRADE\_WARSHIP\_LINE | int: array[int] |
| UPGRADE\_MEDIUM\_WARSHIP | int: 34 |
| UPGRADE\_HEAVY\_WARSHIP | int: 35 |
| UPGRADE\_ELITE\_CANNON\_GALLEON | int: 376 |
| UPGRADE\_ELITE\_LONGSHIP | int: 372 |
| UPGRADE\_ELITE\_TURTLE\_SHIP | int: 448 |
| UPGRADE\_ELITE\_CARAVEL | int: 597 |

\[ [Top](#top) \]

###### 7. University<a name="techuniversity"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_MASONRY\_LINE | int: array[int] |
| TECH\_MASONRY | int: 50 |
| TECH\_ARCHITECTURE | int: 51 |
| UPGRADE\_FORTIFIED\_WALL | int: 194 |
| TECH\_CHEMISTRY | int: 47 |
| TECH\_BALLISTICS | int: 93 |
| TECH\_SIEGE\_ENGINEERS | int: 377 |
| UPGRADE\_WATCH\_TOWER\_LINE | int: array[int] |
| UPGRADE\_GUARD\_TOWER | int: 140 |
| UPGRADE\_KEEP | int: 63 |
| TECH\_HEATED\_SHOT | int: 380 |
| TECH\_ARROWSLITS | int: 608 |
| TEXH\_MURDER\_HOLES | int: 322 |
| TECH\_CAREENING\_LINE | int: array[int] |
| TECH\_CAREENING | int: 374 |
| TECH\_DRY\_DOCK | int: 375 |
| TECH\_CLINKER\_CONSTRUCTION\_LINE | int: array[int] |
| TECH\_CLINKER\_CONSTRUCTION | int: 908 |
| TECH\_CARVEL\_HULL | int: 907 |
| TECH\_SIPHONS\_LINE | int: array[int] |
| TECH\_SIPHONS | int: 909 |
| TECH\_INCENDIARIES | int: 910 |
| TECH\_SHIPWRIGHT | int: 373 |
| TECH\_TREADMILL\_CRANE | int: 54 |

\[ [Top](#top) \]

###### 8. Castle<a name="techcastle"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_HOARDINGS | int: 379 |
| TECH\_SAPPERS | int: 321 |
| TECH\_CONSCRIPTION | int: 315 |

\[ [Top](#top) \]

###### 9. Monastery<a name="techmonastery"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_DEVOTION\_LINE | int: array[int] |
| TECH\_DEVOTION | int: 46 |
| TECH\_FAITH | int: 45 |
| TECH\_REDEMPTION | int: 316 |
| TECH\_ILLUMINATION | int: 233 |
| TECH\_ATONEMENT | int: 319 |
| TECH\_BLOCK\_PRINTING | int: 230 |
| TECH\_HERBAL\_MEDICINE | int: 441 |
| TECH\_THEOCRACY | int: 438 |
| TECH\_HERESY | int: 439 |
| TECH\_SANCTITY | int: 231 |
| TECH\_FERVOR | int: 252 |

\[ [Top](#top) \]

###### 10. Town Center<a name="techtowncenter"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_LOOM | int: 22 |
| TECH\_TOWN\_WATCH\_LINE | int: array[int] |
| TECH\_TOWN\_WATCH | int: 8 |
| TECH\_TOWN\_PATROL | int: 280 |
| TECH\_WHEELBARROW\_LINE | int: array[int] |
| TECH\_WHEELBARROW | int: 213 |
| TECH\_HAND\_CART | int: 249 |

\[ [Top](#top) \]

###### 11. Mining Camp<a name="techminingcamp"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_GOLD\_MINING\_LINE | int: array[int] |
| TECH\_GOLD\_MINING | int: 55 |
| TECH\_GOLD\_SHAFT\_MINING | int: 182 |
| TECH\_STONE\_MINING\_LINE | int: array[int] |
| TECH\_STONE\_MINING | int: 278 |
| TECH\_STONE\_SHAFT\_MINING | int: 279 |

\[ [Top](#top) \]

###### 12. Lumber Camp<a name="techlumbercamp"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_DOUBLE\_BIT\_AXE\_LINE | int: array[int] |
| TECH\_DOUBLE\_BIT\_AXE | int: 202 |
| TECH\_BOW\_SAW | int: 203 |
| TECH\_TWO\_MAN\_SAW | int: 221 |

\[ [Top](#top) \]

###### 13. Market<a name="techmarket"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_COINAGE\_LINE | int: array[int] |
| TECH\_COINAGE | int: 23 |
| TECH\_BANKING | int: 17 |
| TECH\_GUILDS | int: 15 |
| TECH\_CARAVAN | int: 48 |

\[ [Top](#top) \]

###### 14. Mill<a name="techmill"></a>
| Variable | Type and value |
| -------- | ----- |
| TECH\_HORSE\_COLLAR\_LINE | int: array[int] |
| TECH\_HORSE\_COLLAR | int: 14 |
| TECH\_HEAVY\_PLOW | int: 13 |
| TECH\_CROP\_ROTATION | int: 12 |
| TECH\_DOMESTICATION\_LINE | int: array[int] |
| TECH\_DOMESTICATION | int: 1014 |
| TECH\_PASTORALISM | int: 1013 |
| TECH\_TRANSHUMANCE | int: 1012 |

\[ [Top](#top) \]
