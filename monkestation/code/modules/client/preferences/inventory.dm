/datum/preferences/proc/load_inventory(ckey)
	if(!ckey || !SSdbcore.IsConnected())
		return
	var/datum/db_query/query_gear = SSdbcore.NewQuery(
		"SELECT item_id,amount FROM [format_table_name("metacoin_item_purchases")] WHERE ckey = :ckey",
		list("ckey" = ckey)
	)
	if(!query_gear.Execute())
		qdel(query_gear)
		return
	while(query_gear.NextRow())
		var/key = query_gear.item[1]
		inventory += text2path(key)
	qdel(query_gear)
