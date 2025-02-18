if GetLocale() ~= "esES" then return end
local L

------------
-- Skeram --
------------
L = DBM:GetModLocalization("Skeram")

L:SetGeneralLocalization{
	name = "El profeta Skeram"
}

----------------
-- Three Bugs --
----------------
L = DBM:GetModLocalization("ThreeBugs")

L:SetGeneralLocalization{
	name = "Realeza silítida"
}
L:SetMiscLocalization{
	Yauj = "Princesa Yauj",
	Vem = "Vem",
	Kri = "Lord Kri"
}

-------------
-- Sartura --
-------------
L = DBM:GetModLocalization("Sartura")

L:SetGeneralLocalization{
	name = "Guardia de batalla Sartura"
}

--------------
-- Fankriss --
--------------
L = DBM:GetModLocalization("Fankriss")

L:SetGeneralLocalization{
	name = "Fankriss el Implacable"
}

--------------
-- Viscidus --
--------------
L = DBM:GetModLocalization("Viscidus")

L:SetGeneralLocalization{
	name = "Viscidus"
}
L:SetWarningLocalization{
	WarnFreeze	= "Congelación: %d/3",
	WarnShatter	= "Hacerse añicos: %d/3"
}
L:SetOptionLocalization{
	WarnFreeze	= "Anunciar congelación",
	WarnShatter	= "Anunciar hacerse añicos"
}
L:SetMiscLocalization{
	Slow	= "comienza a ir más despacio!",
	Freezing= "se está congelando!",
	Frozen	= "no se puede mover!",
	Phase4 	= "comienza a desmoronarse!",
	Phase5 	= "parece a punto de hacerse añicos!",
	Phase6 	= "explota!"--Might want to double check this, since no further messages appeared after the previous one.
}
-------------
-- Huhuran --
-------------
L = DBM:GetModLocalization("Huhuran")

L:SetGeneralLocalization{
	name = "Princesa Huhuran"
}
---------------
-- Twin Emps --
---------------
L = DBM:GetModLocalization("TwinEmpsAQ")

L:SetGeneralLocalization{
	name = "Los Emperadores Gemelos"
}
L:SetMiscLocalization{
	Veklor = "Emperor Vek'lor",
	Veknil = "Emperor Vek'nilash"
}

------------
-- C'Thun --
------------
L = DBM:GetModLocalization("CThun")

L:SetGeneralLocalization{
	name = "C'Thun"
}
L:SetWarningLocalization{
	WarnEyeTentacle			= "Tentáculo ocular",
	WarnClawTentacle2		= "Tentáculo Garral",
	WarnGiantEyeTentacle	= "Tentáculo ocular gigante",
	WarnGiantClawTentacle	= "Tentáculo garral gigante",
	WarnWeakened			= "C'Thun débil",
	SpecWarnWeakened		= "¡C'Thun está débil!"
}
L:SetTimerLocalization{
	TimerEyeTentacle		= "Siguiente Tentáculo ocular",
	TimerClawTentacle		= "Siguiente Tentáculo Garral",
	TimerGiantEyeTentacle	= "Siguiente Tentáculo ocular gigante",
	TimerGiantClawTentacle	= "Siguiente Tentáculo garral gigante",
	TimerWeakened			= "Debilidad termina"
}
L:SetOptionLocalization{
	WarnEyeTentacle			= "Mostrar aviso cuando aparezca un Tentáculo ocular",
	WarnClawTentacle2		= "Mostrar aviso cuando aparezca un Tentáculo Garral",
	WarnGiantEyeTentacle	= "Mostrar aviso cuando aparezca un Tentáculo ocular gigante",
	WarnGiantClawTentacle	= "Mostrar aviso cuando aparezca un Tentáculo garral gigante",
	WarnWeakened			= "Mostrar aviso cuando C'Thun se vuelva débil",
	SpecWarnWeakened		= "Mostrar aviso especial cuando C'Thun se vuelva débil",
	TimerEyeTentacle		= "Mostrar temporizador para el siguiente Tentáculo ocular",
	TimerClawTentacle		= "Mostrar temporizador para el siguiente Tentáculo Garral",
	TimerGiantEyeTentacle	= "Mostrar temporizador para el siguiente Tentáculo ocular gigante",
	TimerGiantClawTentacle	= "Mostrar temporizador para el siguiente Tentáculo garral gigante",
	TimerWeakened			= "Mostrar temporizador para la duración de la debilidad de C'Thun",
	RangeFrame				= "Mostrar marco de distancia (10 m)"
}
L:SetMiscLocalization{
	Stomach		= "Estómago de C'Thun",
	Eye			= "Ojo de C'Thun",
	FleshTent	= "Tentáculo de carne",
	Weakened 	= "está débil!",
	NotValid	= "AQ40 parcialmente limpiado. Quedan %s jefes opcionales."
}
----------------
-- Ouro --
----------------
L = DBM:GetModLocalization("Ouro")

L:SetGeneralLocalization{
	name = "Ouro"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Ouro ha regresado",
	WarnEmerge			= "Ouro se sumerge"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Sumersión",
	TimerEmerge			= "Emersión"
}
L:SetOptionLocalization{
	WarnSubmerge		= "Mostrar aviso cuando Ouro se sumerja",
	TimerSubmerge		= "Mostrar temporizador para cuando Ouro se sumerja",
	WarnEmerge			= "Mostrar aviso cuando Ouro regrese a la superficie",
	TimerEmerge			= "Mostrar temporizador para cuando Ouro regrese a la superficie"
}

---------------
-- Kurinnaxx --
---------------
L = DBM:GetModLocalization("Kurinnaxx")

L:SetGeneralLocalization{
	name 		= "Kurinnaxx"
}
------------
-- Rajaxx --
------------
L = DBM:GetModLocalization("Rajaxx")

L:SetGeneralLocalization{
	name 		= "General Rajaxx"
}
L:SetWarningLocalization{
	WarnWave	= "Oleada %s"
}
L:SetOptionLocalization{
	WarnWave	= "Mostrar aviso previo para la siguiente oleada"
}
L:SetMiscLocalization{
	Wave12		= "Ahí vienen. Intenta que no te maten,",--Followed by 'chico' or 'chica'
	Wave12Alt	= "Rajaxx, ¿recuerdas que te dije que serías el último en morir?",
	Wave3		= "¡Se acerca la hora de imponer nuestro castigo!	¡Que la oscuridad reine en los corazones de nuestros enemigos!",
	Wave4		= "¡No nos quedaremos esperando por más tiempo tras puertas con barrotes ni muros de piedra! ¡Ya no nos negarán nuestra venganza! ¡Hasta los propios dragones temblarán antes nuestra ira!",
	Wave5		= "¡El miedo es para el enemigo! ¡El miedo y la muerte!",
	Wave6		= "¡Corzocelada lloriqueará y suplicará por su vida, al igual que hizo el mocoso de su cría! ¡Hoy se pondrá fin a mil años de injusticia!",
	Wave7		= "¡Fandral! ¡Tu hora ha llegado! ¡Ve y escóndete en el Sueño Esmeralda y reza para que nunca te encontremos!",
	Wave8		= "¡Idiota insolente! ¡Te mataré yo mismo!"
}

----------
-- Moam --
----------
L = DBM:GetModLocalization("Moam")

L:SetGeneralLocalization{
	name 		= "Moam"
}

----------
-- Buru --
----------
L = DBM:GetModLocalization("Buru")

L:SetGeneralLocalization{
	name 		= "Buru el Manducador"
}
L:SetWarningLocalization{
	WarnPursue		= "Persiguiendo a >%s<",
	SpecWarnPursue	= "Buru te está persiguiendo",
	WarnDismember	= "%s en >%s< (%s)"
}
L:SetOptionLocalization{
	WarnPursue		= "Anunciar objetivos de la persecución de Buru",
	SpecWarnPursue	= "Mostrar aviso especial cuando te persiga el jefe",
	WarnDismember	= DBM_CORE_L.AUTO_ANNOUNCE_OPTIONS.spell:format(96)
}
L:SetMiscLocalization{
	PursueEmote 	= "¡%s fija su mirada en %s!"
}

-------------
-- Ayamiss --
-------------
L = DBM:GetModLocalization("Ayamiss")

L:SetGeneralLocalization{
	name 		= "Ayamiss el Cazador"
}

--------------
-- Ossirian --
--------------
L = DBM:GetModLocalization("Ossirian")

L:SetGeneralLocalization{
	name 		= "Osirio el Sinmarcas"
}
L:SetWarningLocalization{
	WarnVulnerable	= "%s"
}
L:SetTimerLocalization{
	TimerVulnerable	= "%s"
}
L:SetOptionLocalization{
	WarnVulnerable	= "Anunciar debilidades",
	TimerVulnerable	= "Mostrar temporizador para la duración de las debilidades"
}

----------------
-- AQ20 Trash --
----------------
L = DBM:GetModLocalization("AQ20Trash")

L:SetGeneralLocalization{
	name = "AQ20: Bichos"
}

-----------------
--  Razorgore  --
-----------------
L = DBM:GetModLocalization("Razorgore")

L:SetGeneralLocalization{
	name = "Sangrevaja el Indomable"
}
L:SetTimerLocalization{
	TimerAddsSpawn	= "Primeros esbirros"
}
L:SetOptionLocalization{
	TimerAddsSpawn	= "Mostrar temporizador para cuando aparezcan los primeros esbirros"
}
L:SetMiscLocalization{
	Phase2Emote	= "huyen mientras se consume el poder del orbe.",
	YellPull	= "¡Tenemos intrusos en El Criadero! ¡Haced sonar la alarma! ¡Proteged los huevos a toda costa!"
}
-------------------
--  Vaelastrasz  --
-------------------
L = DBM:GetModLocalization("Vaelastrasz")

L:SetGeneralLocalization{
	name				= "Vaelastrasz el Corrupto"
}

L:SetMiscLocalization{
	Event				= "¡Demasiado tarde, amigos! Ahora estoy poseído por la corrupción de Nefarius... No puedo... controlarme."
}
-----------------
--  Broodlord  --
-----------------
L = DBM:GetModLocalization("Broodlord")

L:SetGeneralLocalization{
    name    = "Señor de prole Capazote"
}

L:SetMiscLocalization{
    Pull    = "¡Ninguno de los vuestros debería estar aquí! ¡Os habéis condenado vosotros mismos!"
}

---------------
--  Firemaw  --
---------------
L = DBM:GetModLocalization("Firemaw")

L:SetGeneralLocalization{
	name = "Faucefogo"
}

---------------
--  Ebonroc  --
---------------
L = DBM:GetModLocalization("Ebonroc")

L:SetGeneralLocalization{
	name = "Ebonorroca"
}

----------------
--  Flamegor  --
----------------
L = DBM:GetModLocalization("Flamegor")

L:SetGeneralLocalization{
	name = "Flamagor"
}

-----------------------
--  Vulnerabilities  --
-----------------------
-- Chromaggus, Death Talon Overseer and Death Talon Wyrmguard
L = DBM:GetModLocalization("TalonGuards")

L:SetGeneralLocalization{
	name = "Guardias Garramortal"
}
L:SetWarningLocalization{
	WarnVulnerable		= "Vulnerabilidad: %s"
}
L:SetOptionLocalization{
	WarnVulnerable		= "Mostrar aviso de vulnerabilidades de hechizo"
}
L:SetMiscLocalization{
	Fire		= "Fuego",
	Nature		= "Naturaleza",
	Frost		= "Escarcha",
	Shadow		= "Sombras",
	Arcane		= "Arcano",
	Holy		= "Sagrado"
}

------------------
--  Chromaggus  --
------------------
L = DBM:GetModLocalization("Chromaggus")

L:SetGeneralLocalization{
	name = "Chromaggus"
}
L:SetWarningLocalization{
	WarnBreath		= "%s",
	WarnVulnerable	= "Vulnerabilidad: %s"
}
L:SetTimerLocalization{
	TimerBreathCD	= "%s TdR",
	TimerBreath		= "%s lanzamiento",
	TimerVulnCD		= "TdR de Vulnerabilidad"
}
L:SetOptionLocalization{
	WarnBreath		= "Mostrar aviso cuando Chromaggus lance uno de sus alientos",
	WarnVulnerable	= "Mostrar temporizador para el tiempo de reutilización de los alientos",
	TimerBreathCD	= "Mostrar TdR de aliento",
	TimerBreath		= "Mostrar lanzamiento de aliento",
	TimerVulnCD		= "Mostrar TdR de Vulnerabilidad"
}
L:SetMiscLocalization{
	Breath1	= "Primer aliento",
	Breath2	= "Segundo aliento",
	VulnEmote	= "%s se estremece mientras su piel empieza a brillar.",
	Vuln		= "Vulnerabilidad",
	Fire		= "Fuego",
	Nature		= "Naturaleza",
	Frost		= "Escarcha",
	Shadow		= "Sombras",
	Arcane		= "Arcano",
	Holy		= "Sagrado"
}

----------------
--  Nefarian  --
----------------
L = DBM:GetModLocalization("Nefarian-Classic")

L:SetGeneralLocalization{
	name = "Nefarian"
}
L:SetWarningLocalization{
	WarnAddsLeft		= "%d restante",
	WarnClassCall		= "Llamada de %s",
	specwarnClassCall	= "¡Llamada de tu clase!"
}
L:SetTimerLocalization{
	TimerClassCall		= "Llamada de %s termina"
}
L:SetOptionLocalization{
	TimerClassCall		= "Mostrar temporizador para la duración de las llamadas en cada clase",
	WarnAddsLeft		= "Anunciar muertes restante hasta Fase 2",
	WarnClassCall		= "Mostrar aviso para las llamadas de clase",
	specwarnClassCall	= "Mostrar aviso especial cuando se ve afectado por la llamada de clase"
}
L:SetMiscLocalization{
	YellP2		= "Bien hecho, mis esbirros. El coraje de los mortales empieza a mermar. ¡Veamos ahora cómo se enfrentan al verdadero Señor de la Cubre de Roca Negra!",
	YellP3		= "¡Imposible! ¡Erguíos, mis esbirros! ¡Servid a vuestro maestro una vez más!",
	YellShaman	= "¡Chamanes, mostradme lo que pueden hacer vuestros tótems!",
	YellPaladin	= "Paladines... He oído que tenéis muchas vidas. Demostrádmelo.",
	YellDruid	= "Los druidas y vuestro estúpido poder de cambiar de forma. ¡Veámoslo en acción!",
	YellPriest	= "¡Sacerdotes! Si vais a seguir curando de esa forma, ¡podríamos hacerlo más interesante!",
	YellWarrior	= "¡Vamos guerreros, sé que podéis golpear más fuerte que eso! ¡Veámoslo!",
	YellRogue	= "¿Pícaros? ¡Dejad de esconderos y enfrentaos a mí!",
	YellWarlock	= "Brujos... No deberíais estar jugando con magia que no comprendéis. ¿Veis lo que pasa?",
	YellHunter	= "¡Cazadores y vuestras molestas cerbatanas!",
	YellMage	= "¡Magos también? Deberíais tener más cuidado cuando jugáis con la magia...",
	YellDK		= "¡Caballeros de la Muerte... venid aquí!",
	YellMonk	= "Monjes, ¿no os mareáis con tanta vuelta?",
	YellDH		= "¿Cazadores de demonios? Qué raro eso de taparos los ojos así. ¿No os cuesta ver lo que tenéis alrededor?"--Demon Hunter call; I know this hasn't been implemented yet in DBM, but I added it just in case.
}

----------------
--  Lucifron  --
----------------
L = DBM:GetModLocalization("Lucifron")

L:SetGeneralLocalization{
	name = "Lucifron"
}

----------------
--  Magmadar  --
----------------
L = DBM:GetModLocalization("Magmadar")

L:SetGeneralLocalization{
	name = "Magmadar"
}

----------------
--  Gehennas  --
----------------
L = DBM:GetModLocalization("Gehennas")

L:SetGeneralLocalization{
	name = "Gehennas"
}

------------
--  Garr  --
------------
L = DBM:GetModLocalization("Garr-Classic")

L:SetGeneralLocalization{
	name = "Garr"
}

--------------
--  Geddon  --
--------------
L = DBM:GetModLocalization("Geddon")

L:SetGeneralLocalization{
	name = "Barón Geddon"
}

----------------
--  Shazzrah  --
----------------
L = DBM:GetModLocalization("Shazzrah")

L:SetGeneralLocalization{
	name = "Shazzrah"
}

----------------
--  Sulfuron  --
----------------
L = DBM:GetModLocalization("Sulfuron")

L:SetGeneralLocalization{
	name = "Presagista Sulfuron"
}

----------------
--  Golemagg  --
----------------
L = DBM:GetModLocalization("Golemagg")

L:SetGeneralLocalization{
	name = "Golemagg el Incinerador"
}

-----------------
--  Majordomo  --
-----------------
L = DBM:GetModLocalization("Majordomo")

L:SetGeneralLocalization{
	name = "Mayordomo Executus"
}

----------------
--  Ragnaros  --
----------------
L = DBM:GetModLocalization("Ragnaros-Classic")

L:SetGeneralLocalization{
	name = "Ragnaros"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Ragnaros se sumerge",
	WarnEmerge			= "Ragnaros ha regresado"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Sumersión",
	TimerEmerge			= "Emersión"
}
L:SetOptionLocalization{
	WarnSubmerge		= "Mostrar aviso cuando Ragnaros se sumerja",
	TimerSubmerge		= "Mostrar temporizador para cuando Ragnaros se sumerja",
	WarnEmerge			= "Mostrar aviso cuando Ragnaros regrese a la superficie",
	TimerEmerge			= "Mostrar temporizador para cuando Ragnaros regrese a la superficie"
}
L:SetMiscLocalization{
	Submerge	= "¡AVANZAD, MIS SIRVIENTES! ¡DEFENDED A VUESTRO MAESTRO!",
	Pull		= "¡Crías imprudentes! ¡Os habéis precipitado hasta vuestra propia muerte! ¡Ahora mirad, el maestro se agita!"
}

-------------------
--  Venoxis  --
-------------------
L = DBM:GetModLocalization("Venoxis")

L:SetGeneralLocalization{
	name = "Sumo Sacerdote Venoxis"
}

-------------------
--  Jeklik  --
-------------------
L = DBM:GetModLocalization("Jeklik")

L:SetGeneralLocalization{
	name = "Suma Sacerdotisa Jeklik"
}

-------------------
--  Marli  --
-------------------
L = DBM:GetModLocalization("Marli")

L:SetGeneralLocalization{
	name = "Suma Sacerdotisa Mar'li"
}

-------------------
--  Thekal  --
-------------------
L = DBM:GetModLocalization("Thekal")

L:SetGeneralLocalization{
	name = "Sumo Sacerdote Thekal"
}

L:SetWarningLocalization({
	WarnSimulKill	= "Primer esbirro muerto - Resurrección en ~15 segundos"
})

L:SetTimerLocalization({
	TimerSimulKill	= "Resurrección"
})

L:SetOptionLocalization({
	WarnSimulKill	= "Anunciar primer esbirro muerto",
	TimerSimulKill	= "Mostrar tiempo para resurrección de sacerdote"
})

L:SetMiscLocalization({
	PriestDied	= "%s muere.",
	YellPhase2	= "Shirvallah, ¡lléname de tu IRA!",
	YellKill	= "¡Estoy libre de Hakkar! ¡Por fin tengo paz!",
	Thekal		= "Sumo Sacerdote Thekal",
	Zath		= "Integrista Zath",
	LorKhan		= "Integrista Lor'Khan"
})

-------------------
--  Arlokk  --
-------------------
L = DBM:GetModLocalization("Arlokk")

L:SetGeneralLocalization{
	name = "Suma Sacerdotisa Arlokk"
}

-------------------
--  Hakkar  --
-------------------
L = DBM:GetModLocalization("Hakkar")

L:SetGeneralLocalization{
	name = "Hakkar"
}

-------------------
--  Bloodlord  --
-------------------
L = DBM:GetModLocalization("Bloodlord")

L:SetGeneralLocalization{
	name = "Señor sangriento Mandokir"
}
L:SetMiscLocalization{
	Bloodlord 	= "Señor sangriento Mandokir",
	Ohgan		= "Ohgan",
	GazeYell	= "Te estoy vigilando"
}

-------------------
--  Edge of Madness  --
-------------------
L = DBM:GetModLocalization("EdgeOfMadness")

L:SetGeneralLocalization{
	name = "Extremo de la Locura"
}
L:SetMiscLocalization{
	Hazzarah = "Hazza'rah",
	Renataki = "Renataki",
	Wushoolay = "Wushoolay",
	Grilek = "Gri'lek"
}

-------------------
--  Gahz'ranka  --
-------------------
L = DBM:GetModLocalization("Gahzranka")

L:SetGeneralLocalization{
	name = "Gahz'ranka"
}

-------------------
--  Jindo  --
-------------------
L = DBM:GetModLocalization("Jindo")

L:SetGeneralLocalization{
	name = "Jin'do el Malhechor"
}

--------------
--  Onyxia  --
--------------
L = DBM:GetModLocalization("Onyxia")

L:SetGeneralLocalization{
	name = "Onyxia"
}

L:SetWarningLocalization{
	WarnWhelpsSoon		= "Crías de Onyxia en breve"
}

L:SetTimerLocalization{
	TimerWhelps	= "Crías de Onyxia"
}

L:SetOptionLocalization{
	TimerWhelps				= "Mostrar temporizador para las siguientes Crías de Onyxia",
	WarnWhelpsSoon			= "Mostrar aviso previo para las siguientes Crías de Onyxia",
	SoundWTF3				= "Reproducir sonidos graciosos de cierta banda legendaria"
}

L:SetMiscLocalization{
	Breath = "%s toma aliento...",
	YellPull = "Qué casualidad. Generalmente, debo salir de mi guarida para poder comer.",
	YellP2 = "Este ejercicio sin sentido me aburre. ¡Os incineraré a todos desde arriba!",
	YellP3 = "¡Parece ser que vais a necesitar otra lección, mortales!"
}

-----------------
-- Anub'Rekhan --
-----------------
L = DBM:GetModLocalization("Anub'Rekhan")

L:SetGeneralLocalization({
	name = "Anub'Rekhan"
})

L:SetWarningLocalization({
	SpecialLocust		= "Enjambre de langostas",
	WarningLocustFaded	= "Enjambre de langostas ha terminado"
})

L:SetOptionLocalization({
	SpecialLocust		= "Mostrar aviso especial para $spell:28785",
	WarningLocustFaded	= "Mostrar aviso cuando termine $spell:28785",
	ArachnophobiaTimer	= "Mostrar temporizador para el logro 'Aracnofobia'"
})

L:SetMiscLocalization({
	ArachnophobiaTimer	= "Logro: Aracnofobia",
	Pull1				= "¡Eso, corred! ¡Así la sangre circula más rápido!",
	Pull2				= "Solo un bocado..."
})

-------------------------
-- Gran Viuda Faerlina --
-------------------------
L = DBM:GetModLocalization("Faerlina")

L:SetGeneralLocalization({
	name = "Gran Viuda Faerlina"
})

L:SetWarningLocalization({
	WarningEmbraceExpire	= "Abrazo de la viuda expirando en 5 s",
	WarningEmbraceExpired	= "Abrazo de la viuda ha expirado"
})

L:SetOptionLocalization({
	WarningEmbraceExpire	= "Mostrar aviso previo para cuando expire Abrazo de la viuda",
	WarningEmbraceExpired	= "Mostrar aviso cuando expire Abrazo de la viuda"
})

L:SetMiscLocalization({
	Pull					= "¡Arrodíllate ante mí, sabandija!"--Not actually pull trigger, but often said on pull
})

-------------
-- Maexxna --
-------------
L = DBM:GetModLocalization("Maexxna")

L:SetGeneralLocalization({
	name = "Maexxna"
})

L:SetWarningLocalization({
	WarningSpidersSoon	= "Arañitas de Maexxna en 5 s",
	WarningSpidersNow	= "Arañitas de Maexxna"
})

L:SetTimerLocalization({
	TimerSpider	= "Siguientes arañitas"
})

L:SetOptionLocalization({
	WarningSpidersSoon	= "Mostrar aviso previo para cuando aparezcan Arañitas de Maexxna",
	WarningSpidersNow	= "Mostrar aviso cuando aparezcan Arañitas de Maexxna",
	TimerSpider			= "Mostrar temporizador para las siguientes Arañitas de Maexxna"
})

L:SetMiscLocalization({
	ArachnophobiaTimer	= "Logro: Aracnofobia"
})

-----------------------
-- Noth el Pesteador --
-----------------------
L = DBM:GetModLocalization("Noth")

L:SetGeneralLocalization({
	name = "Noth el Pesteador"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "Teletransporte",
	WarningTeleportSoon	= "Teletransporte en 20 s"
})

L:SetTimerLocalization({
	TimerTeleport		= "Teletransporte: Balcón",
	TimerTeleportBack	= "Teletransporte: Suelo"
})

L:SetOptionLocalization({
	WarningTeleportNow	= "Mostrar aviso para Teletransporte",
	WarningTeleportSoon	= "Mostrar aviso previo para Teletransporte",
	TimerTeleport		= "Mostrar temporizador para el siguiente Teletransporte: Balcón",
	TimerTeleportBack	= "Mostrar temporizador para Teletransporte: Suelo"
})

L:SetMiscLocalization({
	Pull				= "¡Muere, intruso!",
	AddsYell			= "¡Levantaos, soldados míos! ¡Levantaos y luchad una vez más!",
	Adds				= "invoca a guerreros esqueletos!",
	AddsTwo				= "alza más esqueletos!"
})

----------------------
-- Heigan el Impuro --
----------------------
L = DBM:GetModLocalization("Heigan")

L:SetGeneralLocalization({
	name = "Heigan el Impuro"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "Teletransporte",
	WarningTeleportSoon	= "Teletransporte en %d s"
})

L:SetTimerLocalization({
	TimerTeleport	= "Teletransporte"
})

L:SetOptionLocalization({
	WarningTeleportNow	= "Mostrar aviso para Teletransporte",
	WarningTeleportSoon	= "Mostrar aviso previo para Teletransporte",
	TimerTeleport		= "Mostrar aviso para Teletransporte"
})

L:SetMiscLocalization({
	Pull				= "Ahora me perteneces."
})

-------------
-- Loatheb --
-------------
L = DBM:GetModLocalization("Loatheb")

L:SetGeneralLocalization({
	name = "Loatheb"
})

L:SetWarningLocalization({
	WarningHealSoon	= "Sanación posible en 3 s",
	WarningHealNow	= "¡Sanad ahora!"
})

L:SetOptionLocalization({
	WarningHealSoon		= "Mostrar aviso previo para la franja de sanación",
	WarningHealNow		= "Mostrar aviso para la franja de sanación"
})

---------------
-- Remendejo --
---------------
L = DBM:GetModLocalization("Patchwerk")

L:SetGeneralLocalization({
	name = "Remendejo"
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
	yell1 = "¡Remendejo quiere jugar!",
	yell2 = "¡Remendejo es la encarnación de guerra de Kel'Thuzad!"
})

---------------
-- Grobbulus --
---------------
L = DBM:GetModLocalization("Grobbulus")

L:SetGeneralLocalization({
	name = "Grobbulus"
})

-----------
-- Gluth --
-----------
L = DBM:GetModLocalization("Gluth")

L:SetGeneralLocalization({
	name = "Gluth"
})

--------------
-- Thaddius --
--------------
L = DBM:GetModLocalization("Thaddius")

L:SetGeneralLocalization({
	name = "Thaddius"
})

L:SetMiscLocalization({
	Yell	= "¡Stalagg aplasta!",
	Emote	= "¡%s se sobrecarga!",
	Emote2	= "¡Espiral Tesla se sobrecarga!",
	Boss1	= "Feugen",
	Boss2	= "Stalagg",
	Charge1 = "negativo",
	Charge2 = "positivo"
})

L:SetOptionLocalization({
	WarningChargeChanged	= "Mostrar aviso especial cuando tu polaridad cambie",
	WarningChargeNotChanged	= "Mostrar aviso especial cuando tu polaridad no cambie",
	AirowsEnabled			= "Mostrar flechas (estrategia típica de dos grupos)",
	ArrowsRightLeft			= "Mostrar flechas de izquierda y derecha (estrategia de cuatro grupos; muestra la flecha izquierda si cambia la polaridad, y la derecha si no cambia)",
	ArrowsInverse			= "Mostrar flechas de izquierda y derecha inversas (estrategia de cuatro grupos; muestra la flecha derecha si cambia la polaridad, y la izquierda si no cambia)"
})

L:SetWarningLocalization({
	WarningChargeChanged	= "Polaridad cambiada a %s",
	WarningChargeNotChanged	= "Tu polaridad no ha cambiado"
})

--------------------------
-- Instructor Razuvious --
--------------------------
L = DBM:GetModLocalization("Razuvious")

L:SetGeneralLocalization({
	name = "Instructor Razuvious"
})

L:SetMiscLocalization({
	Yell1 = "¡No tengáis piedad!",
	Yell2 = "¡El tiempo de practicar ha pasado! ¡Quiero ver lo que habéis aprendido!",
	Yell3 = "¡Poned en práctica lo que os he enseñado!",
	Yell4 = "Un barrido con pierna... ¿Tienes algún problema?"
})

L:SetOptionLocalization({
	WarningShieldWallSoon	= "Mostrar aviso previo para cuando termine $spell:29061"
})

L:SetWarningLocalization({
	WarningShieldWallSoon	= "Barrera de huesos termina en 5 s"
})

--------------------------
-- Gothik el Cosechador --
--------------------------
L = DBM:GetModLocalization("Gothik")

L:SetGeneralLocalization({
	name = "Gothik el Cosechador"
})

L:SetOptionLocalization({
	TimerWave			= "Mostrar temporizador para la siguiente oleada de esbirros",
	TimerPhase2			= "Mostrar temporizador para el cambio a Fase 2",
	WarningWaveSoon		= "Mostrar aviso previo para la siguiente oleada de esbirros",
	WarningWaveSpawned	= "Mostrar aviso cuando comience una oleada de esbirros",
	WarningRiderDown	= "Mostrar aviso cuando muera un Jinete inflexible",
	WarningKnightDown	= "Mostrar aviso cuando muera un Caballero de la Muerte inflexible"
})

L:SetTimerLocalization({
	TimerWave	= "Oleada %d",
	TimerPhase2	= "Fase 2"
})

L:SetWarningLocalization({
	WarningWaveSoon		= "Oleada %d: %s en 3 s",
	WarningWaveSpawned	= "Oleada %d: %s",
	WarningRiderDown	= "Jinete muerto",
	WarningKnightDown	= "Caballero muerto",
	WarningPhase2		= "Fase 2"
})

L:SetMiscLocalization({
	yell			= "Tú mismo has buscado tu final.",
	WarningWave1	= "%d %s",
	WarningWave2	= "%d %s y %d %s",
	WarningWave3	= "%d %s, %d %s y %d %s",
	Trainee			= "practicantes",
	Knight			= "caballeros",
	Rider			= "jinetes"
})

------------------------
-- Los Cuatro Jinetes --
------------------------
L = DBM:GetModLocalization("Horsemen")

L:SetGeneralLocalization({
	name = "Los Cuatro Jinetes"
})

L:SetOptionLocalization({
	WarningMarkSoon				= "Mostrar aviso previo para las marcas",
	SpecialWarningMarkOnPlayer	= "Mostrar aviso especial cuando estés afectado por más de cuatro marcas"
})

L:SetTimerLocalization({
})

L:SetWarningLocalization({
	WarningMarkSoon				= "Marca %d en 3 s",
	SpecialWarningMarkOnPlayer	= "%s: %s"
})

L:SetMiscLocalization({
	Korthazz	= "Señor feudal Korth'azz",
	Rivendare	= "Barón Osahendido",
	Blaumeux	= "Lady Blaumeux",
	Zeliek		= "Sir Zeliek"
})

---------------
-- Sapphiron --
---------------
L = DBM:GetModLocalization("Sapphiron")

L:SetGeneralLocalization({
	name = "Sapphiron"
})

L:SetOptionLocalization({
	WarningAirPhaseSoon	= "Mostrar aviso previo para el cambio a fase aérea",
	WarningAirPhaseNow	= "Anunciar cambio a fase aérea",
	WarningLanded		= "Anunciar cambio a fase en tierra",
	TimerAir			= "Mostrar temporizador para el cambio a fase aérea",
	TimerLanding		= "Mostrar temporizador para el cambio a fase en tierra",
	TimerIceBlast		= "Mostrar temporizador para $spell:28524",
	WarningDeepBreath	= "Mostrar aviso especial para $spell:28524",
	WarningIceblock		= "Gritar cuando te afecte $spell:28522"
})

L:SetMiscLocalization({
	EmoteBreath			= "%s respira hondo.",
	WarningYellIceblock	= "¡Soy un bloque de hielo!"
})

L:SetWarningLocalization({
	WarningAirPhaseSoon	= "Fase aérea en 10 s",
	WarningAirPhaseNow	= "Fase aérea",
	WarningLanded		= "Fase en tierra",
	WarningDeepBreath	= "Aliento de Escarcha"
})

L:SetTimerLocalization({
	TimerAir		= "Fase aérea",
	TimerLanding	= "Fase en tierra",
	TimerIceBlast	= "Aliento de Escarcha"
})

----------------
-- Kel'Thuzad --
----------------

L = DBM:GetModLocalization("Kel'Thuzad")

L:SetGeneralLocalization({
	name = "Kel'Thuzad"
})

L:SetOptionLocalization({
	TimerPhase2			= "Mostrar temporizador para el cambio a Fase 2",
	specwarnP2Soon		= "Mostrar aviso especial 10 s antes del cambio a Fase 2",
	warnAddsSoon		= "Mostrar aviso previo para cuando aparezcan los Guardianes de Corona de Hielo"
})

L:SetMiscLocalization({
	Yell = "¡Esbirros, sirvientes, soldados de la fría oscuridad! ¡Obedeced la llamada de Kel'Thuzad!"
})

L:SetWarningLocalization({
	specwarnP2Soon	= "Fase 2 en 10 s",
	warnAddsSoon	= "Guardianes de Corona de Hielo en breve"
})

L:SetTimerLocalization({
	TimerPhase2	= "Fase 2"
})

---------------------------
--  Season of Discovery  --
---------------------------

---------------------------
--  Blackfathom Deeps  --
---------------------------

------------------
--  Baron Aquanis  --
------------------
L = DBM:GetModLocalization("BaronAuanisSoD")

L:SetGeneralLocalization({
	name = "Barón Aquanis"
})

L:SetMiscLocalization({
	Water		= "Agua"
})

------------------
--  Ghamoo-ra  --
------------------
L = DBM:GetModLocalization("GhamooraSoD")

L:SetGeneralLocalization({
	name = "Ghamoo-Ra"
})

------------------
--  Lady Sarevess  --
------------------
L = DBM:GetModLocalization("LadySarevessSoD")

L:SetGeneralLocalization({
	name = "Lady Sarevess"
})

------------------
--  Gelihast  --
------------------
L = DBM:GetModLocalization("GelihastSoD")

L:SetGeneralLocalization({
	name = "Gelihast"
})

L:SetTimerLocalization{
	TimerImmune = "Se termina inmunidad"
}

L:SetOptionLocalization({
	TimerImmune	= "Mostrar temporizador para la duración de la inmunidad de Gelihast durante las transiciones de fase."
})
------------------
--  Lorgus Jett  --
------------------
L = DBM:GetModLocalization("LorgusJettSoD")

L:SetGeneralLocalization({
	name = "Lorgus Jett"
})

L:SetWarningLocalization({
	warnPriestRemaining		= "%s Sacerdotisas restantes"
})

L:SetOptionLocalization({
	warnPriestRemaining	= "Anunciar cuántas Sacerdotisas de las mareas Brazanegra están restantes."
})

------------------
--  Twilight Lord Kelris  --
------------------
L = DBM:GetModLocalization("TwilightLordKelrisSoD")

L:SetGeneralLocalization({
	name = "Señor Crepuscular Kelris"
})

------------------
--  Aku'mai  --
------------------
L = DBM:GetModLocalization("AkumaiSoD")

L:SetGeneralLocalization({
	name = "Aku'mai"
})

------------------
--  Gnomeregan  --
------------------

---------------------------
--  Crowd Pummeler 9-60  --
---------------------------
L = DBM:GetModLocalization("CrowdPummellerSoD")

L:SetGeneralLocalization({
	name = "Golpeamasa 9-60"
})

---------------
--  Grubbis  --
---------------
L = DBM:GetModLocalization("GrubbisSoD")

L:SetGeneralLocalization({
	name = "Grubbis"
})

L:SetMiscLocalization({
	FirstPull = "Aún quedan conductos de ventilación que expulsan material radiactivo por toda Gnomeregan.",
	Pull = "¡Oh, no! Unos temblores como estos solo pueden significar una cosa..."
})
----------------------------
--  Electrocutioner 6000  --
----------------------------
L = DBM:GetModLocalization("ElectrocutionerSoD")

L:SetGeneralLocalization({
	name = "Electrocutor 6000"
})

-----------------------
--  Viscous Fallout  --
-----------------------
L = DBM:GetModLocalization("ViscousFalloutSoD")

L:SetGeneralLocalization({
	name = "Radiactivo viscoso"
})

----------------------------
--  Mechanical Menagerie  --
----------------------------
L = DBM:GetModLocalization("MechanicalMenagerieSoD")

L:SetGeneralLocalization({
	name = "Animalario mecánico"
})

L:SetMiscLocalization{
	Sheep		= "Oveja",
	Whelp		= "Dragón",
	Squirrel	= "Ardilla",
	Chicken		= "Pollo"
}
-----------------------------
--  Mekgineer Thermaplugg  --
-----------------------------
L = DBM:GetModLocalization("ThermapluggSoD")

L:SetGeneralLocalization({
	name = "Mekigeniero Termochufe"
})

L:SetTimerLocalization{
	timerTankCD = "Habilidad de tanque"
}

L:SetOptionLocalization({
	timerTankCD	= "Mostrar temporizador para la reutilización aleatoria de habilidades de tanque en la etapa 4."
})

------------------
--  Sunken Temple  --
------------------

---------------------------
--  Atal'alarion  --
---------------------------
L = DBM:GetModLocalization("AtalalarionSoD")

L:SetGeneralLocalization({
	name = "Atal'alarion"
})

---------------------------
--  Festering Rotslime  --
---------------------------
L = DBM:GetModLocalization("FesteringRotslimeSoD")

L:SetGeneralLocalization({
	name = "Baba putrefacta purulenta"
})

---------------------------
--  Atal'ai Defenders  --
---------------------------
L = DBM:GetModLocalization("AtalaiDefendersSoD")

L:SetGeneralLocalization({
	name = "Defensores Atal'ai"
})
---------------------------
--  Dreamscythe and Weaver  --
---------------------------
L = DBM:GetModLocalization("DreamscytheAndWeaverSoD")

L:SetGeneralLocalization({
	name = "Guadañasueños y Sastrón"
})
---------------------------
--  Avatar of Hakkar  --
---------------------------
L = DBM:GetModLocalization("AvatarofHakkarSoD")

L:SetGeneralLocalization({
	name = "Avatar de Hakkar"
})
---------------------------
--  Jammal'an and Ogom  --
---------------------------
L = DBM:GetModLocalization("JammalanAndOgomSoD")

L:SetGeneralLocalization({
	name = "Jammal'an y Ogom"
})
---------------------------
--  Morphaz and Hazzas  --
---------------------------
L = DBM:GetModLocalization("MorphazandHazzasSoD")

L:SetGeneralLocalization({
	name = "Morphaz y Hazzas"
})
---------------------------
--  Shade of Eranikus  --
---------------------------
L = DBM:GetModLocalization("ShadeofEranikusSoD")

L:SetGeneralLocalization({
	name = "Sombra de Eranikus"
})
