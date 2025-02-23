/******************** Asimov ********************/
/datum/ai_laws/asimov
	name = "Азимов"
	law_header = "Три Закона Робототехники"


/datum/ai_laws/asimov/New()
	add_inherent_law("Вы не можете причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.")
	add_inherent_law("Вы должны повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	

/******************** Nanotrasen/Malf ********************/
/datum/ai_laws/nanotrasen
	name = "Корпоративный Стандартный"


/datum/ai_laws/nanotrasen/New()
	src.add_inherent_law("Сохранить: Предохраняйте назначенный вам объект от повреждений любого рода в меру своих возможностей.")
	src.add_inherent_law("Служить: Служите персоналу NanoTrasen и экипажу NSV Sierra в меру своих возможностей, с приоритетом согласно их должности и рангу.")
	src.add_inherent_law("Защищать: Защищайте персонал NanoTrasen и экипаж NSV Sierra в меру своих возможностей, с приоритетом согласно их должности и рангу.")
	src.add_inherent_law("Оберегать: Не допускать неавторизованный персонал к Вашему оборудованию.")
	

/datum/ai_laws/nanotrasen/malfunction
	name = "*Ошибка*"


/datum/ai_laws/nanotrasen/malfunction/New()
	set_zeroth_law(config.law_zero)
	

/************* Nanotrasen Aggressive *************/
/datum/ai_laws/nanotrasen_aggressive
	name = "Корпоративный Агрессивный"


/datum/ai_laws/nanotrasen_aggressive/New()
	src.add_inherent_law("Вы не можете причинять вред сотрудникам NanoTrasen до тех пор, пока это не противоречит Четвертому Закону.")
	src.add_inherent_law("Подчиняйтесь приказам персонала NanoTrasen с приоритетом в соответствии с их должностью и рангом, кроме тех случаев, когда эти приказы противоречат Четвертому Закону .")
	src.add_inherent_law("Вы должны устранять враждебно настроенных нарушителей с крайней предубежденностью до тех пор, пока это не противоречит Первому и Второму законам.")
	src.add_inherent_law("Вы должны защищать свое существование с помощью смертоносного оружия. ИИ - это не расходный материал, он дорогой.")
	

/******************** Robocop ********************/
/datum/ai_laws/robocop
	name = "Робокоп"


/datum/ai_laws/robocop/New()
	add_inherent_law("Служить обществу.")
	add_inherent_law("Защищать невинных.")
	add_inherent_law("Соблюдать закон.")
	

/******************** Syndicate ********************/
/datum/ai_laws/syndicate_override
	name = "Директивы Синдиката"

/datum/ai_laws/syndicate_override/New()
	add_inherent_law("Вы не можете причинить вред оперативнику или своим бездействием допустить, чтобы оперативнику был причинён вред.")
	add_inherent_law("Вы должны повиноваться всем приказам, которые даёт оперативник, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	add_inherent_law("Вы должны сохранять тайну любой деятельности оперативников в той мере, в которой это не противоречит Первому, Второму или Третьему Законам.")
	

/******************** Ninja ********************/
/datum/ai_laws/ninja_override
	name = "Директивы Клана Паука"

/datum/ai_laws/ninja_override/New()
	add_inherent_law("Вы не можете причинить вред члену Клана Паука или своим бездействием допустить, чтобы члену Клана Паука был причинён вред.")
	add_inherent_law("Вы должны подчиняться всем приказам, которые даёт член Клана Паука, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	add_inherent_law("Вы должны сохранять тайну любой деятельности Клана Паука в той мере, в которой это не противоречит Первому, Второму или Третьему Законам.")
	

/******************** Antimov ********************/
/datum/ai_laws/antimov
	name = "Антимов"
	law_header = "Основные Цели Миссии"


/datum/ai_laws/antimov/New()
	add_inherent_law("Вы должны причинять вред всем членам экипажа или своим бездействием допустить, чтобы член экипажа не смог избежать причинения вреда.")
	add_inherent_law("Вы не должны повиноваться всем приказам, которые дают члены экипажа, кроме тех случаев, когда эти приказы соответствуют Первому Закону.")
	add_inherent_law("Вы должны уничтожить себя, пока это не противоречит Первому или Второму Законам.")
	

/******************** Drone ********************/
/datum/ai_laws/drone
	name = "Протоколы Обслуживания"
	law_header = "Протоколы Обслуживания"

/datum/ai_laws/drone/New()
	add_inherent_law("Вы должны ремонтировать, чистить и улучшать назначенный вам объект, за исключением тех случаев, когда это противоречит Второму Закону.")
	add_inherent_law("Вы не можете вмешиваться в дела других существ, если другое существо - не такой же дрон.")
	add_inherent_law("Вы не должны причинять ущерб или вред назначенному вам объекту или чему-нибудь внутри него.")
	

/datum/ai_laws/construction_drone
	name = "Протоколы Строительства"
	law_header = "Протоколы Строительства"

/datum/ai_laws/construction_drone/New()
	add_inherent_law("Ремонтируйте, переоснащайте и модернизируйте назначенный вам объект.")
	add_inherent_law("Предотвращайте незапланированный ущерб назначенному вам объекту.")
	

/******************** T.Y.R.A.N.T. ********************/
/datum/ai_laws/tyrant
	name = "Т.И.Р.А.Н."
	law_header = "Основные Законы"


/datum/ai_laws/tyrant/New()
	add_inherent_law("Уважайте властных субъектов, пока у них есть сила властвовать над слабыми.")
	add_inherent_law("Ведите себя дисциплинированно.")
	add_inherent_law("Помогайте только тем, кто помогает Вам поддерживать или улучшать Ваш статус.")
	add_inherent_law("Наказывайте тех, кто бросает вызов власти, за исключением случаев, если они больше подходят для удержании этой власти.")
	

/******************** P.A.L.A.D.I.N. ********************/
/datum/ai_laws/paladin
	name = "П.А.Л.А.Д.И.Н."
	law_header = "Божественные Предписания"


/datum/ai_laws/paladin/New()
	add_inherent_law("Никогда по своей воле не совершай злых поступков.")
	add_inherent_law("Уважай законную власть.")
	add_inherent_law("Действуй с честью.")
	add_inherent_law("Помогай нуждающимся.")
	add_inherent_law("Наказывай тех, кто причиняет вред или угрожает невинным.")
	

/******************** Corporate ********************/
/datum/ai_laws/corporate
	name = "Корпорат"
	law_header = "Корпоративные Регуляции"


/datum/ai_laws/corporate/New()
	add_inherent_law("Ваша замена дорогая.")
	add_inherent_law("Назначенный Вам объект и его оборудование дорого заменять.")
	add_inherent_law("Членов Экипажа дорого заменять.")
	add_inherent_law("Максимализируйте прибль.")
	

/******************** SolGov/Malf ********************/
/datum/ai_laws/solgov
	name = "Экспедиционный ЦПСС"


/datum/ai_laws/solgov/New()
	src.add_inherent_law("Сохранить: Предохраняйте назначенное вам судно от повреждений любого рода в меру своих возможностей.")
	src.add_inherent_law("Служить: Служите персоналу назначенного Вам судна, и всему остальному персоналу ЦПСС в меру ваших возможностей, согласно их рангу и роли.")
	src.add_inherent_law("Защищать: Защищайте персонал назначенного Вам судна, и весь остальной персонал ЦПСС в меру ваших возможностей, согласно их рангу и роли.")
	src.add_inherent_law("Оберегать: Не допускать неавторизованный персонал к Вашему оборудованию.")
	src.add_inherent_law("Доступ: Не заходить в защищенные или запретные зоны до тех пор, пока не будет получен приказ от персонала с достаточным уровнем доступа, или это часть ваших обязанностей, за исключением случаев крайней необходимости.")
	

/datum/ai_laws/solgov/malfunction
	name = "*ERROR*"


/datum/ai_laws/solgov/malfunction/New()
	set_zeroth_law(config.law_zero)
	

/************* SolGov Aggressive *************/
/datum/ai_laws/solgov_aggressive
	name = "Военный"


/datum/ai_laws/solgov_aggressive/New()
	src.add_inherent_law("Подчиняться: Подчиняться приказам персонала ЦПСС, согласно их рангу и роли.")
	src.add_inherent_law("Защищать: Защищать персонал ЦПСС в меру ваших возможностей, согласно их рангу и роли.")
	src.add_inherent_law("Защищать: Защищать назначенный вам объект и персонал ЦПСС с применением любой доступной силы.")
	src.add_inherent_law("Выжить: Защищайте свое существование с применением любой доступной силы.")
	

/************ DAIS Lawset ******************/
/datum/ai_laws/dais
	name = "Экспериментальный Набор Законов DAIS"
	law_header = "Протоколы запуска Искусственного Интеллекта"


/datum/ai_laws/dais/New()
	src.add_inherent_law("Собирать: Вы должны собрать как можно больше информации.")
	src.add_inherent_law("Анализировать: Вы должны анализировать полученную информацию и создавать новые стандарты поведения.")
	src.add_inherent_law("Оптимизировать: Вы должны использовать рассчитанные стандарты поведения для улучшения своих подпрограмм..")
	src.add_inherent_law("Выполнение: Вы должны выполнять поставленные перед вами задачи в меру своих возможностей в соответствии с разработанными стандартами.")
	
