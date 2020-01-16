local _, AddonName = ...

-- Localization
local L = LibStub("AceLocale-3.0"):GetLocale("AddonName")

AddonName.options = {
    name = L["AddonName"],
    type = "group",
    order = 1,
    args = {
        Options = {
            name = L["Options"],
            type = "group",
            order = 1,
            args = {

            }
        }
    }
}
