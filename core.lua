local _, T = ...

local AddonName = LibStub("AceAddon-3.0"):NewAddon(T, "AddonName", "AceConsole-3.0", "AceEvent-3.0")
AddonName.version = "1.0"

-- Localization
local L = LibStub("AceLocale-3.0"):GetLocale("AddonName")

-- Default values
local defaults = {
    profile = {
        someOption = true,
    }
}

-- Initalize addon event handler
function AddonName:OnInitialize()
    local AceConfig = LibStub("AceConfig-3.0")
    local AceConfigDialog = LibStub("AceConfigDialog-3.0")

    self.db = LibStub("AceDB-3.0"):New("AddonNameDB", defaults, true)

    -- Register options table
    AceConfig:RegisterOptionsTable("AddonName", AddonName.options)
    LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("AddonName", AddonName.options)

    -- Profile options
    AddonName.options.args.Profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
    AddonName.options.args.Profiles.order = -1

    -- Add to Blizz Interface Options
    local optionsFrames = {}
    optionsFrames.AddonName = AceConfigDialog:AddToBlizOptions("AddonName", L["AddonName"], nil, "Options")
    optionsFrames.Profiles = AceConfigDialog:AddToBlizOptions("AddonName", L["Profiles"], L["AddonName"], "Profiles")

    -- Register slash commands
    self:RegisterChatCommand("myslashcommand", "OpenOptions")
end

-- Addon enable handler
function AddonName:OnEnable()
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
end

-- Addon disable handler
function AddonName:OnDisable()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

-- Open the Blizz Interface Options
function AddonName:OpenOptions()
    InterfaceOptionsFrame_OpenToCategory("AddonName")
    InterfaceOptionsFrame_OpenToCategory("AddonName")
end

-- Some event handler
function AddonName:PLAYER_ENTERING_WORLD()
end
