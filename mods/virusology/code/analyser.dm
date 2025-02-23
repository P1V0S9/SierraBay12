/obj/machinery/disease2/diseaseanalyser
	name = "disease analyser"
	icon = 'mods/virusology/icons/virology.dmi'
	icon_state = "analyser"
	density = TRUE

	var/scanning = 0
	var/pause = 0

	var/obj/item/virusdish/dish = null

/obj/machinery/disease2/diseaseanalyser/use_tool(obj/item/O, mob/living/user, list/click_params)
	. = ..()
	if(!istype(O,/obj/item/virusdish)) return

	if(dish)
		to_chat(user, "\The [src] is already loaded.")
		return
	if(!user.unEquip(O, src))
		return
	dish = O
	operator_skill = user.get_skill_value(core_skill)

	user.visible_message("[user] adds \a [O] to \the [src]!", "You add \a [O] to \the [src]!")

/obj/machinery/disease2/diseaseanalyser/Process()
	if(stat & (MACHINE_STAT_NOPOWER|MACHINE_IS_BROKEN(src)))
		return

	if(scanning)
		scanning -= 1
		if(scanning == 0)
			if (dish.virus2.addToDB())
				ping("\The [src] pings, \"New pathogen added to data bank.\"")

			var/list/effects = get_fake_effects(dish.virus2)
			var/r = dish.virus2.get_info(operator_skill, 1, effects)
			var/title = "paper - [dish.virus2.name()]"
			var/info = {"
				[virology_letterhead("Post-Analysis Memo")]
				[r]
				<hr>
				<u>Additional Notes:</u>&nbsp;
		"}
			new /obj/item/paper(loc, info, title)

			dish.basic_info = dish.virus2.get_info(operator_skill, 0, effects)
			dish.info = r
			dish.SetName("[initial(dish.name)] ([dish.virus2.name()])")
			dish.analysed = 1
			dish.forceMove(loc)
			dish = null
			operator_skill = null

			icon_state = "analyser"
			src.state("\The [src] prints a sheet of paper.")

	else if(dish && !scanning && !pause)
		if(dish.virus2 && dish.growth > 50)
			dish.growth -= 10
			scanning = 5
			icon_state = "analyser_processing"
		else
			pause = 1
			addtimer(new Callback(src, PROC_REF(dishmove)), 25)

/obj/machinery/disease2/diseaseanalyser/proc/dishmove()
	dish.forceMove(loc)
	dish = null

	src.state("\The [src] buzzes, \"Insufficient growth density to complete analysis.\"")
	pause = 0

/obj/machinery/disease2/diseaseanalyser/proc/get_fake_effects()
	. = list()
	for(var/datum/disease2/effect/E in dish.virus2.effects)
		if(operator_skill >= HAS_PERK || prob(60))
			. += E //Passed skill check, use real effect
		else
			. += get_random_virus2_effect(E.stage, VIRUS_ENGINEERED) //Failed check, get a fake effect
