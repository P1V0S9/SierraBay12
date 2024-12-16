/***************
* Материализация Телекристаллов *
***************/
/datum/uplink_item/item/telecrystal
	category = /datum/uplink_category/telecrystals
	desc = "Приобретайте кристаллы аплинка в чистом виде."

/datum/uplink_item/item/telecrystal/get_goods(obj/item/device/uplink/U, loc)
	return new /obj/item/stack/telecrystal(loc, cost(U.uses, U))

/datum/uplink_item/item/telecrystal/one
	name = "1x Телекристалл"
	desc = "Извлечь 1 телекристалл из этого аплинка."
	item_cost = 1

/datum/uplink_item/item/telecrystal/five
	name = "5x Телекристаллов"
	desc = "Извлечь 5 телекристаллов из этого аплинка."
	item_cost = 5

/datum/uplink_item/item/telecrystal/ten
	name = "10x Телекристаллов"
	desc = "Извлечь 10 телекристаллов из этого аплинка."
	item_cost = 10

/datum/uplink_item/item/telecrystal/twentyfive
	name = "25x Телекристаллов"
	desc = "Извлечь 25 телекристаллов из этого аплинка."
	item_cost = 25

/datum/uplink_item/item/telecrystal/fifty
	name = "50x Телекристаллов"
	desc = "Извлечь 50 телекристаллов из этого аплинка."
	item_cost = 50

/datum/uplink_item/item/telecrystal/all
	name = "Опустошить Аплинк"
	desc = "Выдает все оставшиеся в аплинке телекристаллы."

/datum/uplink_item/item/telecrystal/all/cost(telecrystals, obj/item/device/uplink/U)
	return max(1, telecrystals)
