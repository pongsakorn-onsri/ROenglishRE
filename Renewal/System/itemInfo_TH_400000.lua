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
			"����¾èҡ�����ҷ����ᴧ�͡�Ҩҡ����ǹ��ѹ����ط���йӤ��͹�ͧ���������ѧ�š㺹��",
			"_______________________",
			"Int + 7",
			"_______________________",
			"���ҧ����������¨ҡ������մ����Ƿ��������͹����좹Ҵ��� ��ҧ ����˭�������� 10%",
			"_______________________",
			"������������������ʡ��  ^009900Adoramus^000000 ���  ^009900Judex^000000 1% �ء� 3 BaseLv",
			"_______________________",
			"�ҡ���¹���ʡ�� ^009900Clearance^000000 Lv5",
			"���ҧ����������¨ҡ������մ����Ƿ�����ҵ��� �ѡ����Է��� ������ҵ�������� 10%",
			"_______________________",
			"�ҡ���¹���ʡ�� ^009900Oratio^000000 Lv10",
			"Ŵ������������Ẻ����Ǣͧʡ�� Oratio ŧ 100%",
			"�������ʡ����¿�鹿� �������ѵ�ҡ�ÿ�鹿٢�� 30%",
			"Ŵ SP �����ʡ��ŧ 10%",
			"_______________________",
			"�ҡ���¹���ʡ�� ^009900Adoramus^000000 Lv10",
			"Aspd + 15%",
			"����ͻ�Һ�͹�����ҡ������մ����Ƿ����� �п�鹿� HP 100 ��� SP 10",
			"_______________________",
			"�ҡ���¹���ʡ�� ^009900Offertorium^000000 Lv5",
			"Ŵ������������ʡ��ŧ 30%",
			"_______________________",
			"�ҡ Arch Bishop �������������������Ѻ Release of Truth",
			"���������ʹ Mdef 100% �Ѻ�͹�����ء���",
			"_______________________",
			"^0000CC������^000000 : ����ͧ��дѺ",
			"^0000CCDef^000000 : 0 Mdef : 15",
			"^0000CC���˹ѡ^000000 : 10",
			"^0000CC����ŷ���ͧ���^000000 : 100",
			"�Ҫվ������� : �ء�Ҫվ"
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
