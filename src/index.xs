void main() {
    ___RS_CONSTANTS_DEFINE_OBJECTS_TECHS___();
    RsReady();

    for(player = 1; <= xsGetNumPlayers()) {
        int getCivilizationId = xsGetPlayerCivilization(player);
        string currentAge = "Dark";
        int ageNumber = 0;

        if(xsGetTechState(103, player) == cTechStateDone) {
            if(xsGetTechState(636, player) == cTechStateDone) {
                currentAge = "Post-Imperial";
                ageNumber = 4;
            } else {
                currentAge = "Imperial";
                ageNumber = 3;
            }
        } else if(xsGetTechState(102, player) == cTechStateDone) {
            currentAge = "Castle";
            ageNumber = 2;
        } else if(xsGetTechState(101, player) == cTechStateDone) {
            currentAge = "Feudal";
            ageNumber = 1;
        }
        RsPlayer(player, getCivilizationId, currentAge, ageNumber);
    }


    if(RS_INTERACTIVITY) {
        // If Live Checker are enabled. Add Age and Blank Techs
        rsTechnologyInspectAddAll(101);
        rsTechnologyInspectAddAll(102);
        rsTechnologyInspectAddAll(103);
        for(blankTechs = 0; < xsArrayGetSize(TECH_BLANK_TECHNOLOGIES)) {
            rsTechnologyInspectAddAll(rsArrayIntGet(TECH_BLANK_TECHNOLOGIES, blankTechs));
        }
        xsEnableRule("___RS_SYSTEM_LISTENER___");
    }

}
