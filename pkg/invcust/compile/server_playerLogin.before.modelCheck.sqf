	if (_model == "") then {
		_key = format["CHILD:999:select replace(cl.`inventory`, '""', '""""') inventory, replace(cl.`backpack`, '""', '""""') backpack, replace(coalesce(cl.`model`, 'Survivor2_DZ'), '""', '""""') model from `cust_loadout` cl join `cust_loadout_profile` clp on clp.`cust_loadout_id` = cl.`id` where clp.`unique_id` = '?':[%1]:",str(_playerID)];
		_data = "HiveEXT" callExtension _key;
		//Process result
		_result = call compile format ["%1", _data];
		_status = _result select 0;
		if (_status == "CustomStreamStart") then {
			if ((_result select 1) > 0) then {
				_data = "HiveEXT" callExtension _key;
				_result = call compile format ["%1", _data];
				_inventory = call compile (_result select 0);
				_backpack = call compile (_result select 1);
				_model = call compile (_result select 2);
			};
		};
	};