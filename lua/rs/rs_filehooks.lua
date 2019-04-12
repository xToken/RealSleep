-- lua/rs/rs_filehooks.lua
-- - Dragon

-- Dont run from filehook calls on main menu.
if not string.find(Script.CallStack(), "Main.lua") then

	-- REPLACE
	ModLoader.SetupFileHook("lua/CatalystMixin.lua", "lua/rs/CatalystMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/CorrodeMixin.lua", "lua/rs/CorrodeMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/EnergizeMixin.lua", "lua/rs/EnergizeMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/FireMixin.lua", "lua/rs/FireMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/FlinchMixin.lua", "lua/rs/FlinchMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/GhostStructureMixin.lua", "lua/rs/GhostStructureMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/GorgeStructureMixin.lua", "lua/rs/GorgeStructureMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/IdleMixin.lua", "lua/rs/IdleMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/InfantryPortal.lua", "lua/rs/InfantryPortal.lua", "replace")
	ModLoader.SetupFileHook("lua/MinimapConnectionMixin.lua", "lua/rs/MinimapConnectionMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/NanoShieldMixin.lua", "lua/rs/NanoShieldMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/Observatory.lua", "lua/rs/Observatory.lua", "replace")
	ModLoader.SetupFileHook("lua/ParasiteMixin.lua", "lua/rs/ParasiteMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/PrototypeLab.lua", "lua/rs/PrototypeLab.lua", "replace")
	ModLoader.SetupFileHook("lua/RecycleMixin.lua", "lua/rs/RecycleMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/ResearchMixin.lua", "lua/rs/ResearchMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/StormCloudMixin.lua", "lua/rs/StormCloudMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/TechMixin.lua", "lua/rs/TechMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/TeleportMixin.lua", "lua/rs/TeleportMixin.lua", "replace")
	ModLoader.SetupFileHook("lua/UmbraMixin.lua", "lua/rs/UmbraMixin.lua", "replace")
	
	-- POST
	ModLoader.SetupFileHook("lua/Mixins/ClientModelMixin.lua", "lua/rs/ClientModelMixin.lua", "post")
	ModLoader.SetupFileHook("lua/ScoringMixin.lua", "lua/rs/ScoringMixin.lua", "post")
	ModLoader.SetupFileHook("lua/CloakableMixin.lua", "lua/rs/CloakableMixin.lua", "post")
	ModLoader.SetupFileHook("lua/LOSMixin.lua", "lua/rs/LOSMixin.lua", "post")
	ModLoader.SetupFileHook("lua/RepositioningMixin.lua", "lua/rs/RepositioningMixin.lua", "post")
	ModLoader.SetupFileHook("lua/Crag.lua", "lua/rs/Crag.lua", "post")
	ModLoader.SetupFileHook("lua/Shift.lua", "lua/rs/Shift.lua", "post")
	ModLoader.SetupFileHook("lua/Shade.lua", "lua/rs/Shade.lua", "post")

end