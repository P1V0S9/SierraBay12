/************
* Крутые Вещицы *
************/
/datum/uplink_item/item/badassery
	category = /datum/uplink_category/badassery

/datum/uplink_item/item/badassery/balloon
	name = "Чтобы показать, что ТЫ здесь БОСС (Бесполезный Шарик)"


/datum/uplink_item/item/badassery/balloon/corporate
	name = "Чтобы показать, что ты любишь компанию ОЧЕНЬ сильно (Бесполезный Шарик)"


/datum/uplink_item/item/badassery/balloon/random
	name = "Чтобы показать 'Что бы там ни было~' (Бесполезный Шарик)"
	desc = "Случайно выбирает шарик для тебя!"


/datum/uplink_item/item/badassery/balloon/random/get_goods(obj/item/device/uplink/U, loc)
	var/balloon_type = pick(typesof(path))
	var/obj/item/I = new balloon_type(loc)
	return I

/datum/uplink_item/item/badassery/crayonmre
	name = "Мелковый ИРП"
	desc = "Исключительно робастный ИРП."


/datum/uplink_item/item/badassery/modded_foam_gun
	name = "Модифицированная пенная пушка"
	desc = "Это револьвер Джорф Бластер и 14 утяжеленных дротиков. Даже после модификации на вторичном рынке увеличивающей его дальность и начальную скорость это не сделало его эффективным оружием."


/datum/uplink_item/item/badassery/fortune
	name = "Печенье с предсказанием"
	desc = "Зачем ты это купил?"


/**************
* Random Item *
**************/
/datum/uplink_item/item/badassery/random_one
	name = "Случайный предмет"
	desc = "Покупает случайный предмет стоимостью не менее 1 ТК. Будьте осторожны, Это может потратить все телекристаллы!"


/datum/uplink_item/item/badassery/random_one/buy(obj/item/device/uplink/U, mob/user)
	var/datum/uplink_random_selection/uplink_selection = get_uplink_random_selection_by_type(/datum/uplink_random_selection/default)
	var/datum/uplink_item/item = uplink_selection.get_random_item(U.uses, U)
	return item && item.buy(U, user)

/datum/uplink_item/item/badassery/random_one/can_buy(obj/item/device/uplink/U)
	return U.uses

/****************
* Surplus Crate *
****************/
/datum/uplink_item/item/badassery/surplus
	name = "\improper Surplus Crate"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT * 4


/datum/uplink_item/item/badassery/surplus/New()
	..()
	antag_roles = list(MODE_MERCENARY)
	desc = "Ящик, содержащий излишки телекристаллов на сумму [item_worth]. Если вы сможете найти кого-нибудь, кто поможет вам оплатить это, вы, возможно, найдете золотую жилу."

/datum/uplink_item/item/badassery/surplus/get_goods(obj/item/device/uplink/U, loc)
	var/obj/structure/largecrate/C = new(loc)
	var/random_items = get_random_uplink_items(U, item_worth, C)
	for(var/datum/uplink_item/I in random_items)
		I.purchase_log(U)
		I.get_goods(U, C)

	return C

/datum/uplink_item/item/badassery/surplus/log_icon()
	if(!icon)
		var/obj/structure/largecrate/C = /obj/structure/largecrate
		icon = image(initial(C.icon), initial(C.icon_state))

	return "\icon[icon]"
