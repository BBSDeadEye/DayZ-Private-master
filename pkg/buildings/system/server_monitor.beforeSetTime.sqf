//Send the key
_key = format["CHILD:999:select b.class_name, ib.worldspace from instance_building ib join building b on ib.building_id = b.id where ib.instance_id = ?:[%1]:", dayZ_instance];
_data = "HiveEXT" callExtension _key;

diag_log("SERVER: Fetching buildings...");

//Process result
_result = call compile format ["%1", _data];
_status = _result select 0;

_bldList = [];
_bldCount = 0;
if (_status == "CustomStreamStart") then {
	_val = _result select 1;
	for "_i" from 1 to _val do {
		_data = "HiveEXT" callExtension _key;
		_result = call compile format ["%1",_data];

		_pos = call compile (_result select 1);
		_dir = _pos select 0;
		_pos = _pos select 1;

		_building = createVehicle [_result select 0, _pos, [], 0, "CAN_COLLIDE"];
		_building setDir _dir;
		_bldCount = _bldCount + 1;
	};
	diag_log ("SERVER: Spawned " + str(_bldCount) + " buildings!");
};