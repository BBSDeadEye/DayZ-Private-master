//Add MPHit event handler
diag_log("Adding MPHit EH for " + str(_playerObj));
_playerObj addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];