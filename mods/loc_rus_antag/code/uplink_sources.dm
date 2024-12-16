#define NO_GUARANTEE_NO_EXTRA_COST_DESC(X) "Installs an uplink into " + X + " if, and only if, found on your person. Has no TC cost."

#define SETUP_FAILED TRUE

/singleton/uplink_source/pda
	name = "КПК"
	desc = NO_GUARANTEE_NO_EXTRA_COST_DESC("КПК")

/singleton/uplink_source/pda/setup_uplink_source(mob/M, amount)
	var/obj/item/modular_computer/pda/P = find_in_mob(M, /obj/item/modular_computer/pda)
	if(!P || !P.hard_drive)
		return SETUP_FAILED

	var/pda_pass = "[rand(100,999)] [pick(GLOB.greek_letters)]"
	var/obj/item/device/uplink/T = new(P, M.mind, amount)
	P.hidden_uplink = T
	var/datum/computer_file/program/uplink/program = new(pda_pass)
	if(!P.hard_drive.save_file(program))
		return SETUP_FAILED	//Not enough space or other issues.
	to_chat(M, SPAN_NOTICE("Установлено портативное устройство для телепортации объектов в ваш [P.name]. Просто введите код \"[pda_pass]\" в программу TaxQuickly ,чтобы получить доступ к скрытым функциям."))
	M.StoreMemory("<B>Пароль от аплинка:</B> [pda_pass] ([P.name]).", /singleton/memory_options/system)
	T.program = program

/singleton/uplink_source/radio
	name = "Радио"
	desc = NO_GUARANTEE_NO_EXTRA_COST_DESC("радио")

/singleton/uplink_source/radio/setup_uplink_source(mob/M, amount)
	var/obj/item/device/radio/R = find_in_mob(M, /obj/item/device/radio)
	if(!R)
		return SETUP_FAILED

	var/freq = PUBLIC_LOW_FREQ
	var/list/freqlist = list()
	while (freq <= PUBLIC_HIGH_FREQ)
		if (freq < 1451 || freq > PUB_FREQ)
			freqlist += freq
		freq += 2
		if ((freq % 2) == 0)
			freq += 1

	freq = freqlist[rand(1, length(freqlist))]
	var/obj/item/device/uplink/T = new(R, M.mind, amount)
	R.hidden_uplink = T
	R.traitor_frequency = freq
	to_chat(M, SPAN_NOTICE("Установлено портативное устройство для телепортации объектов в ваш [R.name]. Установите частоту [format_frequency(freq)] ,чтобы получить доступ к скрытым функциям."))
	M.StoreMemory("<B>Radio Freq:</B> [format_frequency(freq)] ([R.name]).", /singleton/memory_options/system)

/singleton/uplink_source/implant
	name = "Имплант"
	desc = "Телепортирует имплант аплинка в вашу голову. Стоит 20% от выданного количества ТК."

/singleton/uplink_source/implant/setup_uplink_source(mob/living/carbon/human/H, amount)
	if(!istype(H))
		return SETUP_FAILED

	var/obj/item/organ/external/head = H.organs_by_name[BP_HEAD]
	if(!head)
		return SETUP_FAILED

	var/obj/item/implant/uplink/U = new(H, round(amount * 0.8))
	U.imp_in = H
	U.implanted = TRUE
	U.part = head
	head.implants += U

	U.implanted(H) // This proc handles the installation feedback

/singleton/uplink_source/unit
	name = "Аплинк-устройсто"
	desc = "Телепортирует аплинк-устройство на ваше местоположение. Имеет на 30% больше ТК."

/singleton/uplink_source/unit/setup_uplink_source(mob/M, amount)
	var/obj/item/device/radio/uplink/U = new(M, M.mind, round(amount * 1.3))
	put_on_mob(M, U, "\A [U]")

/singleton/uplink_source/telecrystals
	name = "Телекристаллы"
	desc = "Получите ваши телекристаллы в чистой форме без средств для торговли ими. Дает 150% от изначального количества ТК"

/singleton/uplink_source/telecrystals/setup_uplink_source(mob/M, amount)
	amount = round(amount * 1.5)
	var/obj/item/stack/telecrystal/TC = new(M, amount)
	put_on_mob(M, TC, "[amount] telecrystal\s")

/singleton/uplink_source/find_in_mob(mob/M, type)
	for(var/item in M.get_equipped_items(TRUE))
		if(!istype(item, type))
			continue
		var/obj/item/I = item
		if(!I.hidden_uplink)
			return I

/singleton/uplink_source/put_on_mob(mob/M, atom/movable/AM, text)
	var/obj/O = M.equip_to_storage(AM)
	if(O)
		to_chat(M, SPAN_NOTICE("[text] может быть найден в вашем [O.name]."))
	else if(M.put_in_hands(AM))
		to_chat(M, SPAN_NOTICE("[text] появляется в ваших руках."))
	else
		AM.dropInto(M.loc)
		to_chat(M, SPAN_NOTICE("[text] появляется на вашем местоположении."))

/setup_uplink_source(mob/M, amount = DEFAULT_TELECRYSTAL_AMOUNT)
	if(!istype(M) || !M.mind)
		return FALSE

	var/list/priority_order
	if(M.client && M.client.prefs)
		priority_order = M.client.prefs.uplink_sources

	if(!priority_order || !length(priority_order))
		priority_order = list()
		for(var/entry in GLOB.default_uplink_source_priority)
			priority_order += GET_SINGLETON(entry)

	for(var/entry in priority_order)
		var/singleton/uplink_source/US = entry
		if(US.setup_uplink_source(M, amount) != SETUP_FAILED)
			return TRUE

	to_chat(M, SPAN_WARNING("Либо по собственному желанию, либо в силу обстоятельств вы останетесь без аплинка."))
	return FALSE

#undef NO_GUARANTEE_NO_EXTRA_COST_DESC
#undef SETUP_FAILED