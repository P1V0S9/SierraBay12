/*************************************
* Stealthy and Inconspicuous Weapons *
*************************************/
/datum/uplink_item/item/stealthy_weapons
	category = /datum/uplink_category/stealthy_weapons

/datum/uplink_item/item/stealthy_weapons/soap
	name = "Диверсионное Мыло"


/datum/uplink_item/item/stealthy_weapons/cigarette_kit
	name = "Коробка Сигарет с Ньюансом"
	desc = "Коробка 'особых' пачек сигарет, которые поставляются в следующем порядке: 2x Ослепительных, 2x Дымовых, 1x С содержанием ЛСД, и 1x с Трикодразином. Постарайтесь не перепутать их!"


/datum/uplink_item/item/stealthy_weapons/concealed_cane
	name = "Скрытый Клинок в Трости"
	desc = "Трость, которая является атрибутом истинного джентельмена, особенно тех у кого коварные намерения."


/datum/uplink_item/item/stealthy_weapons/random_toxin
	name = "Колба со Случайным Токсином"
	desc = "Содержит один из множества опасных токсинов, в комплекте всего один шприц. Не волнуйтесь, колба подписана. "


/datum/uplink_item/item/stealthy_weapons/sleepy
	name = "Паралитическая Ручка"
	desc = "Обычная ручка, но укол кого-то примерно через 30 секунд парализует цель."


/datum/uplink_item/item/stealthy_weapons/syringegun
	name = "Замаскированный Дротикомет"
	desc = "Шприцемет, замаскированный под электронную сигарету. 4 Дротика включены в комплект. Наполнение не включено!"


/datum/uplink_item/item/stealthy_weapons/razor_hat
	name = "Шляпа-котелок с Острыми Полями"
	desc = "Эта элегантная шляпа скрывает в своих полях несколько микролезвий, а также обеспечивает некоторую защиту головы. Точный бросок наносит максимальный урон."


/datum/uplink_item/item/stealthy_weapons/carp_plush
	name = "Обезвоженый Космический Карп"
	desc = "Безобидный на вид плюшевый карп. Добавьте воды и сделайте шаг назад, чтобы не стать получателем неприятного подарка!"


/datum/uplink_item/item/stealthy_weapons/plush_bomb
	name = "Плюшевая Бомба"
	desc = "Приятная плюшевая игрушка, в которую вживлена бомба, активируемая голосом. Задайте ключевую фразу и ждите взрывной концовки!"


/datum/uplink_item/item/stealthy_weapons/plush_bomb/get_goods(obj/item/device/uplink/U, loc)
	var/plushtype = pick(typesof(path))
	var/obj/item/I = new plushtype(loc)
	return I

/datum/uplink_item/item/stealthy_weapons/guncane
	name = "Скрытое в Трости Ружье"
	desc = "Трость, которая является атрибутом истинного джентельмена, которая сделана для тех, кто любит погромче!"

