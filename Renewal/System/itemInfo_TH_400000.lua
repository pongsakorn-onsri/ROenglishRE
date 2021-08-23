-- Original translation works of pongsakorn
-- Continuated by llchrisll at https://github.com/pongsakorn-onsri/ROthaiRE
-- This file can be distributed, used and modified freely
-- This file shouldn't be claimed as part of your project, unless you fork it from https://github.com/pongsakorn-onsri/ROthaiRE
-- Last updated: 20210816

tbl = {
	[490118] = {
		unidentifiedDisplayName = "Unidentified Accessory",
		unidentifiedResourceName = "?",
		unidentifiedDescriptionName = { "" },
		identifiedDisplayName = "Adoration Ring",
		identifiedResourceName = "RingOfAdoramus",
		identifiedDescriptionName = {
			"คำอวยพรจากพระเจ้าที่สำแดงออกมาจากคำภาวนาอันบริสุทธิ์จะนำคำสอนของพระเจ้ามายังโลกใบนี้",
			"_______________________",
			"Int + 7",
			"_______________________",
			"สร้างความเสียหายจากการโจมตีด้วยเวทมนตร์แก่มอนสเตอร์ขนาดเล็ก กลาง และใหญ่เพิ่มขึ้น 10%",
			"_______________________",
			"เพิ่มความเสียหายให้สกิล  ^009900Adoramus^000000 และ  ^009900Judex^000000 1% ทุกๆ 3 BaseLv",
			"_______________________",
			"หากเรียนรู้สกิล ^009900Clearance^000000 Lv5",
			"สร้างความเสียหายจากการโจมตีด้วยเวทมนตร์ธาตุลม ศักดิ์สิทธิ์ และไร้ธาตุเพิ่มขึ้น 10%",
			"_______________________",
			"หากเรียนรู้สกิล ^009900Oratio^000000 Lv10",
			"ลดระยะเวลาร่ายแบบคงตัวของสกิล Oratio ลง 100%",
			"เมื่อใช้สกิลสายฟื้นฟู จะเพิ่มอัตราการฟื้นฟูขึ้น 30%",
			"ลด SP ค่าใช้สกิลลง 10%",
			"_______________________",
			"หากเรียนรู้สกิล ^009900Adoramus^000000 Lv10",
			"Aspd + 15%",
			"เมื่อปราบมอนสเตอร์จากการโจมตีด้วยเวทมนตร์ จะฟื้นฟู HP 100 และ SP 10",
			"_______________________",
			"หากเรียนรู้สกิล ^009900Offertorium^000000 Lv5",
			"ลดระยะเวลาร่ายสกิลลง 30%",
			"_______________________",
			"หาก Arch Bishop สวมใส่ไอเท็มนี้ร่วมกับ Release of Truth",
			"โจมตีโดยไม่สน Mdef 100% กับมอนสเตอร์ทุกเผ่า",
			"_______________________",
			"^0000CCประเภท^000000 : เครื่องประดับ",
			"^0000CCDef^000000 : 0 Mdef : 15",
			"^0000CCน้ำหนัก^000000 : 10",
			"^0000CCเลเวลที่ต้องการ^000000 : 100",
			"อาชีพที่ใช้ได้ : ทุกอาชีพ"
		},
		slotCount = 1,
		ClassNum = 0,
		costume = false
	},
}

function main()
	for ItemID, DESC in pairs(tbl) do
		result, msg = AddItem(ItemID, DESC.unidentifiedDisplayName, DESC.unidentifiedResourceName, DESC.identifiedDisplayName, DESC.identifiedResourceName, DESC.slotCount, DESC.ClassNum)
		if not result == true then
			return false, msg
		end
		for k, v in pairs(DESC.unidentifiedDescriptionName) do
			result, msg = AddItemUnidentifiedDesc(ItemID, v)
			if not result == true then
				return false, msg
			end
		end
		for k, v in pairs(DESC.identifiedDescriptionName) do
			result, msg = AddItemIdentifiedDesc(ItemID, v)
			if not result == true then
				return false, msg
			end
		end
		if nil ~= DESC.EffectID then
			result, msg = AddItemEffectInfo(ItemID, DESC.EffectID)
		end
		if not result == true then
			return false, msg
		end
		if nil ~= DESC.costume then
			result, msg = AddItemIsCostume(ItemID, DESC.costume)
		end
		if not result == true then
			return false, msg
		end
	end
	return true, "good"
end

function main_server()
	for ItemID, DESC in pairs(tbl) do
		result, msg = AddItem(ItemID, DESC.identifiedDisplayName, DESC.slotCount)
		if not result == true then
			return false, msg
		end
	end
	return true, "good"
end
