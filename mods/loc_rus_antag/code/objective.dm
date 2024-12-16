//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31
/datum/objective
	//What that person is supposed to do.
	explanation_text = "Ничего"
	//If they are focused on a particular person.
	//If they are focused on a particular number. Steal objectives have their own counter.

// Assassinate //

/datum/objective/assassinate/find_target()
	..()
	if(target && target.current)
		explanation_text = "Ликвидируйте [target.current.real_name], [target.assigned_role]."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/assassinate/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Ликвидируйте [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target

// Execute //

/datum/objective/anti_revolution/execute/find_target()
	..()
	if(target && target.current)
		explanation_text = "[target.current.real_name], [target.assigned_role] неавторизовано извлек конфиденциальную информацию. Ликвидируйте данную цель."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/anti_revolution/execute/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "[target.current.real_name], [!role_type ? target.assigned_role : target.special_role] неавторизовано извлек конфиденциальную информацию. Ликвидируйте данную цель."
	else
		explanation_text = "Свободная Цель"
	return target

// Brig //
/datum/objective/anti_revolution/brig/find_target()
	..()
	if(target && target.current)
		explanation_text = "Посадите [target.current.real_name], [target.assigned_role] в камеру заключения на 20 минут или больше, чтобы преподать урок."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/anti_revolution/brig/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Посадите [target.current.real_name], [!role_type ? target.assigned_role : target.special_role] в камеру заключения на 20 минут или больше, чтобы преподать урок."
	else
		explanation_text = "Свободная Цель"
	return target

// Demote //

/datum/objective/anti_revolution/demote/find_target()
	..()
	if(target && target.current)
		explanation_text = "[target.current.real_name], [target.assigned_role] был классифицирован как вредный для выполнения целей НаноТрайзен. Понизьте его до ассистента"
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/anti_revolution/demote/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "[target.current.real_name], [!role_type ? target.assigned_role : target.special_role] был классифицирован как вредный для выполнения целей [GLOB.using_map.company_name] Понизьте его до ассистента"
	else
		explanation_text = "Свободная Цель"
	return target

// Debrain //

/datum/objective/debrain/find_target()
	..()
	if(target && target.current)
		explanation_text = "Украдите мозг [target.current.real_name]."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/debrain/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Украдите мозг [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target

// Protection, The opposite of killing a dude. //

/datum/objective/protect/find_target()
	..()
	if(target && target.current)
		explanation_text = "Защитите [target.current.real_name], [target.assigned_role]."
	else
		explanation_text = "Свободная Цель"
	return target


/datum/objective/protect/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Защитите [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target

// Hijack //

/datum/objective/hijack
	explanation_text = "Угоните шаттл."

// Shuttle Escape //

/datum/objective/escape
	explanation_text = "Сбегите на шаттле или эвакуационном поде живым и несвязанным."

// Survive //

/datum/objective/survive
	explanation_text = "Выживите до окончания смены."

// Brig, similar to the anti-rev objective, but for traitors //

/datum/objective/brig/find_target()
	..()
	if(target && target.current)
		explanation_text = "Посадите [target.current.real_name], [target.assigned_role] в камеру заключения на 10 минут."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/brig/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Посадите [target.current.real_name], [!role_type ? target.assigned_role : target.special_role] в камеру заключения на 10 минут."
	else
		explanation_text = "Свободная Цель"
	return target

// Harm a crew member, making an example of them //

/datum/objective/harm/find_target()
	..()
	if(target && target.current)
		explanation_text = "Преподайте урок [target.current.real_name], [target.assigned_role]. Сломайте кость, отрубите конечность или изуродуйте лицо. Убедитесь, что цель переживет это."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/harm/find_target_by_role(role, role_type = 0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Преподайте урок [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]. Сломайте кость, отрубите конечность или изуродуйте лицо. Убедитесь, что цель переживет это."
	else
		explanation_text = "Свободная Цель"
	return target

// Nuclear Explosion //

/datum/objective/nuclear
	explanation_text = "Вызовите массовое уничтожение с помощью ядерного устройства."


// RnD progress download //

/datum/objective/download/gen_amount_goal()
	target_amount = rand(10,20)
	explanation_text = "Скачайте [target_amount] научных уровней."
	return target_amount

// Capture //

/datum/objective/capture

/datum/objective/capture/gen_amount_goal()
	target_amount = rand(5,10)
	explanation_text = "Получите [target_amount] очков захвата."
	return target_amount

// Changeling Absorb //

/datum/objective/absorb/gen_amount_goal(lowbound = 4, highbound = 6)
	target_amount = rand (lowbound,highbound)
	var/n_p = 1 //autowin
	if (GAME_STATE == RUNLEVEL_SETUP)
		for(var/mob/new_player/P in GLOB.player_list)
			if(P.client && P.ready && P.mind!=owner)
				n_p ++
	else if (GAME_STATE == RUNLEVEL_GAME)
		for(var/mob/living/carbon/human/P in GLOB.player_list)
			if(P.client && !(P.mind.changeling) && P.mind!=owner)
				n_p ++
	target_amount = min(target_amount, n_p)

	explanation_text = "Поглотите [target_amount] совместимых геномов."
	return target_amount

// Heist objectives.
/datum/objective/heist/choose_target()
	return

/datum/objective/heist/kidnap/choose_target()
	var/list/possible_targets = list()
	var/list/priority_targets = list()

	for(var/datum/mind/possible_target in SSticker.minds)
		if(possible_target != owner && ishuman(possible_target.current) && (possible_target.current.stat != DEAD) && (!possible_target.special_role))
			possible_targets += possible_target
			for (var/path in roles)
				var/datum/job/role = SSjobs.get_by_path(path)
				if(possible_target.assigned_role == role.title)
					priority_targets += possible_target
					continue

	if(length(priority_targets) > 0)
		target = pick(priority_targets)
	else if(length(possible_targets) > 0)
		target = pick(possible_targets)

	if(target && target.current)
		explanation_text = "Мы можем получить хорошую цену за [target.current.real_name], [target.assigned_role]. Необходимо забрать цель живой."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/heist/loot/choose_target()
	var/loot = "an object"
	switch(rand(1,8))
		if(1)
			target = /obj/structure/particle_accelerator
			target_amount = 6
			loot = "полноценный ускоритель частиц"
		if(2)
			target = /obj/machinery/the_singularitygen
			target_amount = 1
			loot = "гравитационный генератор"
		if(3)
			target = /obj/machinery/power/emitter
			target_amount = 4
			loot = "четыре эмиттера"
		if(4)
			target = /obj/machinery/nuclearbomb
			target_amount = 1
			loot = "ядерную бомбу"
		if(5)
			target = /obj/item/gun
			target_amount = 6
			loot = "шесть пушек"
		if(6)
			target = /obj/item/gun/energy
			target_amount = 4
			loot = "четыре энергооружия"
		if(7)
			target = /obj/item/gun/energy/laser
			target_amount = 2
			loot = "два энергетических ружья"
		if(8)
			target = /obj/item/gun/energy/ionrifle
			target_amount = 1
			loot = "ионную винтовку"

	explanation_text = "В этой системе есть торговый хаб. Украдите [loot] для перепродажи."

/datum/objective/heist/salvage/choose_target()
	switch(rand(1,8))
		if(1)
			target = MATERIAL_STEEL
			target_amount = 300
		if(2)
			target = MATERIAL_GLASS
			target_amount = 200
		if(3)
			target = MATERIAL_PLASTEEL
			target_amount = 100
		if(4)
			target = MATERIAL_PHORON
			target_amount = 100
		if(5)
			target = MATERIAL_SILVER
			target_amount = 50
		if(6)
			target = MATERIAL_GOLD
			target_amount = 20
		if(7)
			target = MATERIAL_URANIUM
			target_amount = 20
		if(8)
			target = MATERIAL_DIAMOND
			target_amount = 20

	explanation_text = "Обворуйте [station_name()] и сбегите с [target_amount] [target]."

/datum/objective/heist/preserve_crew
	explanation_text = "Мы не бросаем своих. Ни живыми, ни мертвыми"

//Borer objective(s).
/datum/objective/borer_survive
	explanation_text = "Продержаться в хозяине до конца раунда"

/datum/objective/borer_reproduce
	explanation_text = "Репродуцироваться хотя бы раз."

/datum/objective/ninja_highlander
   explanation_text = "Ты стремишься стать великим мастером Клана Пауков. Убей всех своих товарищей-послушников."

/datum/objective/cult/survive
	explanation_text = "Наши знания должны жить"
	target_amount = 5

/datum/objective/cult/survive/New()
	..()
	explanation_text = "Наши знания должны жить. Убедитесь, что хотя бы [target_amount] аколитов сбежало, чтобы распространять нашу веру"

/datum/objective/cult/eldergod
	explanation_text = "Призовите Нар-Си, используя соответствующую руну (Hell join self). Это сработает, только если девять культистов встанут на нее и вокруг нее."

/datum/objective/cult/sacrifice
	explanation_text = "Совершите ритуал жертвоприношения во славу Нар-Си."

/datum/objective/cult/sacrifice/find_target()
	var/list/possible_targets = list()
	if(!length(possible_targets))
		for(var/mob/living/carbon/human/player in GLOB.player_list)
			if(player.mind && !(player.mind in GLOB.cult.current_antagonists))
				possible_targets += player.mind
	if(length(possible_targets) > 0)
		target = pick(possible_targets)
	if(target) explanation_text = "Принесите жертву [target.name], [target.assigned_role]. Для этого вам понадобится руна жертвоприношения (Hell blood join) и три аколита."

/datum/objective/rev/find_target()
	..()
	if(target && target.current)
		explanation_text = "Ликвидировать, захватить или завербовать [target.current.real_name], [target.assigned_role]."
	else
		explanation_text = "Свободная Цель"
	return target

/datum/objective/rev/find_target_by_role(role, role_type=0)
	..(role, role_type)
	if(target && target.current)
		explanation_text = "Ликвидировать, захватить или завербовать [target.current.real_name], [!role_type ? target.assigned_role : target.special_role]."
	else
		explanation_text = "Свободная Цель"
	return target
