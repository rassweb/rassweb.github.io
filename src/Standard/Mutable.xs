//
//  Functions are runs once
//
mutable void RsReady() {}
mutable void RsPlayer(int playerId = 0, int civilizationId = 0, string startingAge = "Dark", int currentAge = 0) {}

//
//  Timer API Events
//
mutable void RsEventTimer(string eventName = "", string timerName = "", int expiresIn = 0, int params = 0) {}
mutable void RsEventTimerCreated(string timerName = "", int expiresIn = 0, int params = 0) {}
mutable void RsEventTimerDeleted(string timerName = "", int expiresIn = 0, int params = 0) {}
mutable void RsEventTimerExpired(string timerName = "", int expiresIn = 0, int params = 0) {}

//
//  Technology Inspector API
//
mutable void RsEventTechnology(string eventName = "", int playerId = -1, int techId = -1, int techState = -1, int params = NULL, bool fromQueue = false) {}
