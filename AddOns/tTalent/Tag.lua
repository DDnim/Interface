local addon, ns = ...
local modeltable = {}
local MODEL_NUM_MAX = 20
ns.MODEL_NUM_MAX = MODEL_NUM_MAX

modeltable[0] = function(model)
model.model:Hide()
end


modeltable[99] = function(model)
model:tSetModel(false, "SPELLS/AcidBurn_Black.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 529, 150, "BACKGROUND", 856, 1000, 0, 0, 0, 0)
end

modeltable[1] = function(model)
model:tSetModel(false, "SPELLS/DiseaseCloud.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 629, 0, "BACKGROUND", 856, 1356, 0, 0, 0, 0)
end


modeltable[2] = function(model)
model:tSetModel(false, "SPELLS/Priest_PowerInfusion.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 629, 0, "HIGH", 856, 1356, 0, 0, 0, 0)
end

modeltable[3] = function(model)
model:tSetModel(false, "SPELLS/Metamorphosis.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 629, 0, "BACKGROUND", 1856, 1356, 0, 0, -6, 0)
end

modeltable[4] = function(model)
model:tSetModel(false, "SPELLS/Priest_PowerInfusion.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 629, 0, "DIALOG", 856, 1356, 0, 0, 0, 0)
end

modeltable[5] = function(model)
model:tSetModel(false, "SPELLS/ArcaneVolley_Missile.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 629, 0, "BACKGROUND", 856, 1356, 0.50, 0, 0, 0)
end

modeltable[6] = function(model)
model:tSetModel(false, "SPELLS/ArcaneSpirit_Impact_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 529, 150, "DIALOG", 600, 600, 0, -0.2, -1, 0)
end

modeltable[7] = function(model)
model:tSetModel(false, "SPELLS/Ritual_Arcane_PreCast_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, -280, "BACKGROUND", 1960, 1080, 0, -0.2, -0.4, 0)
end


modeltable[8] = function(model)
model:tSetModel( false, "SPELLS/Priest_PowerInfusion.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, 0, "DIALOG", 1960, 1080, 0, 0, -0.4, 0)
end

modeltable[9] = function(model)
model:tSetModel(false, "SPELLS/Ritual_Fire_PreCast_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, 0, "BACKGROUND", 1960, 1080, 0, -0.8, -0.4, 0)
end

modeltable[10] = function(model)
model:tSetModel( false, "SPELLS/ChristmasSnowRain.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, 0, "DIALOG", 1960, 1080, 0, 0, -0.4, 0)
end

modeltable[11] = function(model)
model:tSetModel( false, "SPELLS/Ritual_Frost_PreCast_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, -80, "BACKGROUND", 1960, 1080, 0, -0.2, -0.4, 0)
end
modeltable[12] = function(model)
model:tSetModel( false, "SPELLS/Impact_Light.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 680, 0, "BACKGROUND", 1960, 1080, -0.2, 0, -2, 0)
end
modeltable[13] = function(model)
model:tSetModel( false, "SPELLS/Holy_Precast_Uber_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, -150, "BACKGROUND", 1960, 1080, 0, -0.2, -0.4, 0)
end
modeltable[14] = function(model)
model:tSetModel( false, "SPELLS/FireShield_Impact_Head.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 680, 0, "DIALOG", 1960, 1080, 0, 0.5, -3, 0)
end
modeltable[15] = function(model)
model:tSetModel( false, "SPELLS/HolyShield_State.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, -150, "BACKGROUND", 1960, 1080, 0, 0, -1, 0)
end
modeltable[16] = function(model)
model:tSetModel( false, "SPELLS/BlessingofFreedom_Impact.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 680, 0, "DIALOG", 1960, 1080, 0, 0.5, -0.4, 0)
end
modeltable[17] = function(model)
model:tSetModel( false, "SPELLS/SPELLS/Victory_Rush_Impact.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 580, 0, "BACKGROUND", 1960, 1080, 0, -0.2, 1.5, 0)
end
modeltable[18] = function(model)
model:tSetModel( false, "SPELLS/ZulAman_FireDoor_Unit.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 0, 0	, "BACKGROUND", 1960, 1080, 0.5, 0.5, -2, 0)
end


modeltable[19] = function(model)
model:tSetModel( false, "SPELLS/AcidCloudBreath_GroundSmoke_Blue.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 0, -20	, "DIALOG", 1920, 650, 0, 0, 4, 0)
end

modeltable[20] = function(model)
model:tSetModel( false, "SPELLS/6FX_SmallFire.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER", 550, -250	, "DIALOG", 500, 500, 0, 0, 0, 2)
end


modeltable[101] = function(model)
model:tSetModel(false, "SPELLS/AmplifyMagic_Impact_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER",-629,-550, "DIALOG", 856, 1356, 0, 0, 0, 0)
end
modeltable[102] = function(model)
model:tSetModel(false, "SPELLS/Ice_Precast_Uber_Base.m2")
model:tShow("CENTER","PlayerTalentFrame","CENTER",-629,-400, "HIGH", 856, 1356, 0, 0, 0, 0)
end


ns.modeltable = modeltable