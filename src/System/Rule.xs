//
//  Listener for interactive API-s
//
int tick = 0;
rule ___RS_SYSTEM_LISTENER___
    inactive
    group rsTechEvent
    highFrequency
    priority 1
{
    int time = xsGetWorldTime();
    if(tick < time) {
        tick = xsGetWorldTime() + RS_EVENT_DELAY;
        //
        //  Listener Functions
        //
        ___RS_API_TIMER_INSPECTOR___();
        ___RS_API_TECHNOLOGY_INSPECTOR___();

        if(RS_INTERACTIVITY == false) {
            xsDisableSelf();
        }
    }


}
