/obj/item/mech_component/passenger_compartment
	var/list/back_passengers
	var/list/left_back_passengers
	var/list/right_back_passengers
	var/datum/gas_mixture/air_contents = new
	var/mob/living/exosuit/owner

/obj/item/mech_component/passenger_compartment/Initialize()
	. = ..()
	owner = loc

/mob/living/exosuit/proc/check_hardpoint_passengers(place,mob/user)// Данный прок проверяет, доступна ли часть тела для занятия её пассажиром в данный момент
	var/obj/item/mech_equipment/checker
	if(place == "Back" && hardpoints["back"] != null)
		checker = hardpoints["back"]
		if(checker.disturb_passengers == TRUE)
			to_chat(user,SPAN_NOTICE("[place] covered by [checker] and cant be taked."))
			return FALSE
	else if(place == "Left back" && hardpoints["left shoulder"] != null)
		checker = hardpoints["left shoulder"]
		if(checker.disturb_passengers == TRUE)
			to_chat(user,SPAN_NOTICE("[place] covered by [checker] and cant be taked."))
			return FALSE
	else if(place == "Right back" && hardpoints["right shoulder"] != null)
		checker = hardpoints["right shoulder"]
		if(checker.disturb_passengers == TRUE)
			to_chat(user,SPAN_NOTICE("[place] covered by [checker] and cant be taked."))
			return FALSE
	return TRUE

/mob/living/exosuit/proc/check_passenger(mob/user) // Выбираем желаемое место, проверяем можно ли его занять, стартуем прок занятия
	var/local_dir = get_dir(src, user)
	if(local_dir != turn(dir, 90) && local_dir != turn(dir, -90) && local_dir != turn(dir, -135) && local_dir != turn(dir, 135) && local_dir != turn(dir, 180))
	// G G G
	// G M G  ↓ (Mech dir, look on SOUTH)
	// B B B
	// M - mech, B - cant climb ON mech from this side, G - can climb ON mech from this side
		to_chat(user, SPAN_WARNING("You cant climb in passenger place of [src ] from this side."))
		return FALSE
	var/choose
	var/choosed_place = input(usr, "Choose passenger place which you want to take.", name, choose) as null|anything in passenger_places
	if(!user.Adjacent(src)) // <- Мех рядом?
		return FALSE
	if(user.r_hand != null || user.l_hand != null)
		to_chat(user,SPAN_NOTICE("You need two free hands to take [choosed_place]."))
		return
	if(user.mob_size > MOB_MEDIUM)
		to_chat(user,SPAN_NOTICE("Looks like you too big to take [choosed_place]."))
		return
	if(choosed_place == "Back")
		if(LAZYLEN(passenger_compartment.back_passengers) > 0)
			to_chat(user,SPAN_NOTICE("[choosed_place] is busy"))
			return 0
		else if(body.allow_passengers == FALSE)
			to_chat(user,SPAN_NOTICE("[choosed_place] not able with [body.name]"))
			return 0
	else if(choosed_place == "Left back")
		if(LAZYLEN(passenger_compartment.left_back_passengers) > 0)
			to_chat(user,SPAN_NOTICE("[choosed_place] is busy"))
			return 0
		else if(arms.allow_passengers == FALSE)
			to_chat(user,SPAN_NOTICE("[choosed_place] not able with [arms.name]"))
			return 0
	else if(choosed_place == "Right back")
		if(LAZYLEN(passenger_compartment.right_back_passengers) > 0)
			to_chat(user,SPAN_NOTICE("[choosed_place] is busy"))
			return 0
		else if(arms.allow_passengers == FALSE)
			to_chat(user,SPAN_NOTICE("[choosed_place] not able with [arms.name]"))
			return 0
	else if(!choosed_place)
		return 0
	if(check_hardpoint_passengers(choosed_place,user) == TRUE)
		enter_passenger(user,choosed_place)

/mob/living/exosuit/proc/enter_passenger(mob/user, place)// Пытается пихнуть на пассажирское место пассажира, перед этим ещё раз проверяя их
	//Проверка спины
	src.visible_message(SPAN_NOTICE(" [user] starts climb on the [place] of [src]!"))
	if(do_after(user, 2 SECONDS, get_turf(src),DO_SHOW_PROGRESS|DO_FAIL_FEEDBACK|DO_USER_CAN_TURN| DO_USER_UNIQUE_ACT | DO_PUBLIC_PROGRESS))
		if(!user.Adjacent(src)) // <- Мех рядом?
			return FALSE
		if(user.r_hand != null || user.l_hand != null)
			to_chat(user,SPAN_NOTICE("You need two free hands to clim on[place] of [src]."))
			return
		if(place == "Back" && LAZYLEN(passenger_compartment.back_passengers) == 0)
			user.forceMove(passenger_compartment)
			LAZYDISTINCTADD(passenger_compartment.back_passengers,user)
			have_back_passenger = TRUE
			user.pinned += src
		else if(place == "Left back" && LAZYLEN(passenger_compartment.left_back_passengers) == 0)
			user.forceMove(passenger_compartment)
			LAZYDISTINCTADD(passenger_compartment.left_back_passengers,user)
			have_left_passenger = TRUE
			user.pinned += src
		else if(place == "Right back" && LAZYLEN(passenger_compartment.right_back_passengers) == 0)
			user.forceMove(passenger_compartment)
			LAZYDISTINCTADD(passenger_compartment.right_back_passengers,user)
			have_right_passenger = TRUE
			user.pinned += src
		else
			to_chat(user,SPAN_NOTICE("Looks like [place] is busy!"))
			return 0
		src.visible_message(SPAN_NOTICE(" [user] climbed on [place] of [src]!"))
		passenger_compartment.count_passengers()
		update_passengers()

// будет использоваться Life() дабы исключить моменты, когда по какой-то причине пассажир слез с меха, лежа на полу. Life вызовется, обработается pinned, всем в кайф.
/mob/living/exosuit/proc/leave_passenger(mob/user)// Пассажир сам покидает меха
	src.visible_message(SPAN_NOTICE("[user] jump off [src]!"))
	user.dropInto(loc)
	user.pinned -= src
	user.Life()
	if(user in passenger_compartment.back_passengers)
		LAZYREMOVE(passenger_compartment.back_passengers,user)
		have_back_passenger = FALSE
	else if(user in passenger_compartment.left_back_passengers)
		LAZYREMOVE(passenger_compartment.left_back_passengers,user)
		have_left_passenger = FALSE
	else if(user in passenger_compartment.right_back_passengers)
		LAZYREMOVE(passenger_compartment.right_back_passengers,user)
		have_right_passenger = FALSE
	passenger_compartment.count_passengers()
	update_passengers()

/mob/living/exosuit/proc/forced_leave_passenger(place,mode,author)// Нечто внешнее насильно опустошает Одно/все места пассажиров
// mode 1 - полный выгруз, mode 2 - рандомного одного, mode 0(Отсутствие мода) - ручной скид пассажира мехводом
	if(mode == MECH_DROP_ALL_PASSENGER) // Полная разгрузка
		if(LAZYLEN(passenger_compartment.back_passengers)>0)
			for(var/mob/i in passenger_compartment.back_passengers)
				LAZYREMOVE(passenger_compartment.back_passengers,i)
				have_back_passenger = FALSE
				i.dropInto(loc)
				i.pinned -= src
				i.Life()
				passenger_compartment.count_passengers()
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
		if(LAZYLEN(passenger_compartment.left_back_passengers)>0)
			for(var/mob/i in passenger_compartment.left_back_passengers)
				LAZYREMOVE(passenger_compartment.left_back_passengers,i)
				have_left_passenger = FALSE
				i.dropInto(loc)
				i.pinned -= src
				i.Life()
				passenger_compartment.count_passengers()
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
		if(LAZYLEN(passenger_compartment.right_back_passengers) > 0)
			for(var/mob/i in passenger_compartment.right_back_passengers)
				LAZYREMOVE(passenger_compartment.right_back_passengers,i)
				have_right_passenger = FALSE
				i.dropInto(loc)
				i.pinned -= src
				i.Life()
				passenger_compartment.count_passengers()
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
		update_passengers()

	else if(mode == MECH_DROP_ANY_PASSENGER) // Сброс по приоритету спина - левый бок - правый бок.
		if(LAZYLEN(passenger_compartment.back_passengers) > 0)
			for(var/mob/i in passenger_compartment.back_passengers)
				LAZYREMOVE(passenger_compartment.back_passengers,i)
				have_back_passenger = FALSE
				i.dropInto(loc)
				i.pinned -= src
				i.Life()
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
				passenger_compartment.count_passengers()
				update_passengers()
				return
		else if(LAZYLEN(passenger_compartment.left_back_passengers)>0)
			for(var/mob/i in passenger_compartment.left_back_passengers)
				LAZYREMOVE(passenger_compartment.left_back_passengers,i)
				have_left_passenger = FALSE
				i.dropInto(loc)
				i.pinned -= src
				i.Life()
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
				passenger_compartment.count_passengers()
				update_passengers()
				return
		else if(LAZYLEN(passenger_compartment.right_back_passengers)>0)
			for(var/mob/i in passenger_compartment.right_back_passengers)
				LAZYREMOVE(passenger_compartment.right_back_passengers,i)
				have_right_passenger = FALSE
				i.dropInto(loc)
				i.pinned -= src
				i.Life()
				i.Life()
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
				passenger_compartment.count_passengers()
				update_passengers()
				return

	else // <- Опустошается определённое место
		if(place == "Back")
			for(var/mob/i in passenger_compartment.back_passengers)
				have_back_passenger = FALSE
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]"))
				i.dropInto(loc)
				i.pinned -= src
				LAZYREMOVE(passenger_compartment.back_passengers,i)
		else if(place == "Left back")
			for(var/mob/i in passenger_compartment.left_back_passengers)
				have_left_passenger = FALSE
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]!"))
				i.dropInto(loc)
				i.pinned -= src
				LAZYREMOVE(passenger_compartment.left_back_passengers,i)
		else if(place == "Right back")
			for(var/mob/i in passenger_compartment.right_back_passengers)
				have_right_passenger = FALSE
				src.visible_message(SPAN_WARNING("[i] was forcelly removed from [src] by [author]!"))
				i.dropInto(loc)
				i.pinned -= src
				LAZYREMOVE(passenger_compartment.right_back_passengers,i)
		passenger_compartment.count_passengers()
		update_passengers()

/obj/item/mech_component/passenger_compartment/proc/check_passengers_status()
	var/mob/living/passenger
	if(LAZYLEN(back_passengers) > 0)
		passenger = back_passengers[1]
		if(passenger.incapacitated(INCAPACITATION_UNRESISTING) == TRUE)
			to_chat(passenger,SPAN_WARNING("You cant hold anymore yourself on mech."))
			owner.leave_passenger(passenger)
	if(LAZYLEN(left_back_passengers) > 0)
		passenger = left_back_passengers[1]
		if(passenger.incapacitated(INCAPACITATION_UNRESISTING) == TRUE)
			to_chat(passenger,SPAN_WARNING("You cant hold anymore yourself on mech."))
			owner.leave_passenger(passenger)
	if(LAZYLEN(right_back_passengers > 0))
		passenger = right_back_passengers[1]
		if(passenger.incapacitated(INCAPACITATION_UNRESISTING) == TRUE)
			to_chat(passenger,SPAN_WARNING("You cant hold anymore yourself on mech."))
			owner.leave_passenger(passenger)

/obj/item/mech_component/passenger_compartment/return_air()
	var/turf/T = get_turf(loc)
	if(istype(T))
		return T.return_air()

/obj/item/mech_component/passenger_compartment/proc/count_passengers()
	owner.passengers_ammount = owner.passengers_ammount = LAZYLEN(back_passengers) + LAZYLEN(left_back_passengers) + LAZYLEN(right_back_passengers)
