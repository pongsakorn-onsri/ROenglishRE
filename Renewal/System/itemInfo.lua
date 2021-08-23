----------------------------------------------------------
------ rathena
------ sader1992
------ https://rathena.org/board/profile/30766-sader1992/
----------------------------------------------------------
function add_item_id(v)
	local M = "^0000CCItem ID:^000000 " .. tostring(v) .. ""
	-- FOR FluxCP
	--local M = "<URL>ItemID:[" .. tostring(v) .. "](Click Me!)<INFO>https://MYSERVER/?module=item&action=view&id=" .. tostring(v) .. "</INFO></URL>"
	return M
end

function get_item_unidentifiedResourceName(id, infos)

	for key,ItemInfo in pairs(infos) do
		require(ItemInfo)
		if nil ~= tbl[id] then
			if nil ~= tbl[id].unidentifiedResourceName then
				return true, tbl[id].unidentifiedResourceName
			end
		end
	end

	return false, 'not found unidentifiedResourceName'
end

function get_item_identifiedResourceName(id, infos)

	for key,ItemInfo in pairs(infos) do
		require(ItemInfo)
		if nil ~= tbl[id] then
			if nil ~= tbl[id].identifiedResourceName then
				return true, tbl[id].identifiedResourceName
			end
		end
	end

	return false, 'not found identifiedResourceName'
end

function main()
	IInfo = {"System.itemInfo_TH_500-5000", "System.itemInfo_th", "System.itemInfo_en", "System.itemInfo_TH_400000", "System.itemInfo_kr"}
	-- Example!
	-- IInfo = {"System.import_iteminfo","System.kro_iteminfo5","System.kro_iteminfo4","System.kro_iteminfo3","System.kro_iteminfo2","System.kro_iteminfo1","System.kro_iteminfo"}
	ItemList = {}
	for key,ItemInfo in pairs(IInfo) do
		require(ItemInfo)
		for ItemID, DESCS in pairs(tbl) do
			if not ItemList[ItemID] then
				ItemList[ItemID] = true
				unidentifiedResourceName = DESCS.unidentifiedResourceName
				if nil == unidentifiedResourceName then
					result, value = get_item_unidentifiedResourceName(ItemID, IInfo)
					unidentifiedResourceName = value
				end

				identifiedResourceName = DESCS.identifiedResourceName
				if nil == identifiedResourceName then
					result, value = get_item_identifiedResourceName(ItemID, IInfo)
					identifiedResourceName = value
				end

				result, msg = AddItem(ItemID, DESCS.unidentifiedDisplayName, unidentifiedResourceName, DESCS.identifiedDisplayName, identifiedResourceName, DESCS.slotCount, DESCS.ClassNum)
				if not result == true then
					return false, msg
				end
				for k, v in pairs(DESCS.unidentifiedDescriptionName) do
					result, msg = AddItemUnidentifiedDesc(ItemID, v)
					if not result == true then
						return false, msg
					end
				end
				for k, v in pairs(DESCS.identifiedDescriptionName) do
					result, msg = AddItemIdentifiedDesc(ItemID, v)
					if not result == true then
						return false, msg
					end
				end
				AddItemIdentifiedDesc(ItemID, "_______________________")
				AddItemIdentifiedDesc(ItemID, add_item_id(ItemID))
				if nil ~= DESCS.EffectID then
					result, msg = AddItemEffectInfo(ItemID, DESCS.EffectID)
				end
				if not result == true then
					return false, msg
				end
				if nil ~= DESCS.costume then
					result, msg = AddItemIsCostume(ItemID, DESCS.costume)
				end
				if not result == true then
					return false, msg
				end
			end
		end
	end
	return true, "good"
end