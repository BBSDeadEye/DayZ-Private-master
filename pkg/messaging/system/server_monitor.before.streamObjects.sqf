//Send the key
_key = format["CHILD:999:select payload, loop_interval, start_delay from message where instance_id = ?:[%1]:", dayZ_instance];
_data = "HiveEXT" callExtension _key;

diag_log("SERVER: Fetching messages...");

//Process result
_result = call compile format ["%1", _data];
_status = _result select 0;

msgList = [];
_msgCount = 0;
if (_status == "CustomStreamStart") then {
	_val = _result select 1;
	for "_i" from 1 to _val do {
		_data = "HiveEXT" callExtension _key;
		_result = call compile format ["%1",_data];

		_status = _result select 0;
		msgList set [count msgList, _result];
		_msgCount = _msgCount + 1;
	};
	diag_log ("SERVER: Added " + str(_msgCount) + " messages!");
};