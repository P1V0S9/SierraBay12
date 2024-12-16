/***********
* Implants *
***********/
/datum/uplink_item/item/implants
	category = /datum/uplink_category/implants

/datum/uplink_item/item/implants/imp_freedom
	name = "Имплант Освобождения"
	desc = "Имплант с активацией от эмоции, который может развязать вас или снять наручники. Покажите Охране, что вас ничего не связывает по рука и ногам!"


/datum/uplink_item/item/implants/imp_compress
	name = "Имплант Сжатия Материи"
	desc = "Имплант с активацией от эмоции, который позволяет спрятать ручной предмет в вашем теле. \
	Его активация материализует предмет в вашей руке."


/datum/uplink_item/item/implants/imp_explosive
	name = "Имплант Взрыва (ОПАСНО!)"
	desc = "Взрывной имплант, активируемый голосом или радиосигналом. \
	Используйте настройщик из комплекта, чтобы настроить."


/datum/uplink_item/item/implants/imp_uplink
	name = "Имплант Аплинка"

/datum/uplink_item/item/implants/imp_uplink/New()
	..()
	item_cost = round(DEFAULT_TELECRYSTAL_AMOUNT / 2)
	desc = "Этот имплант содержит аплинк, в котором [IMPLANT_TELECRYSTAL_AMOUNT(DEFAULT_TELECRYSTAL_AMOUNT)] телекристаллов, \
	Имплант с активацией от эмоции. У вас имеется доступ к нему пока он имплантирован в вас."

/datum/uplink_item/item/implants/imp_imprinting
	name = "Имплант Нейронного Импритинга"
	desc = "Имплант, который необходимо имплантировать цели под действием ЛСД, чтобы дать ей набор инструкций, \
	похожий на законы синтетиков. Этот набор содержит дозу ЛСД."

