local handlerFrame = CreateFrame("Frame", "HandlerFrame")
handlerFrame:RegisterEvent("VARIABLES_LOADED")
handlerFrame:RegisterEvent("ADDON_LOADED")
handlerFrame:RegisterEvent("READY_CHECK")
handlerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
handlerFrame:SetScript("OnEvent", function(self, event)
    GlobalOnEventHandler(self, event)
end)

local configFrame = CreateFrame("Frame", "ConfigFrame", UIParent, "BasicFrameTemplate")
configFrame:SetSize(300, 200)
configFrame:SetPoint("CENTER")
configFrame:SetMovable(true)
configFrame:EnableMouse(true)
configFrame:EnableKeyboard(true)
configFrame:SetScript("OnMouseDown", function(self)
    self:StartMoving()
end)
configFrame:SetScript("OnMouseUp", function(self)
    self:StopMovingOrSizing()
end)
configFrame:SetShown(false)

local configFrameTitle = configFrame:CreateFontString("ConfigFrame_Title", "OVERLAY", "GameFontNormal")
configFrameTitle:SetPoint("TOP", configFrame, 0, -5)
configFrameTitle:SetText("Ready Check Sound Disabler Config")

local readyCheckSoundCheckButton = CreateFrame("CheckButton", "ReadyCheckSoundCheckButton", configFrame, "UICheckButtonTemplate")
readyCheckSoundCheckButton:SetText("Mute Readycheck Sound")
readyCheckSoundCheckButton:SetPoint("TOPLEFT", configFrame, 10, -30)
readyCheckSoundCheckButton:SetChecked(MuteReadycheckSound)
readyCheckSoundCheckButton:SetScript("OnClick", function(self)
    if (self:GetChecked()) then
        MuteReadyCheckSound()
    else
        UnMuteReadyCheckSound()
    end
end
)

local readyCheckSoundCheckButtonTitle = readyCheckSoundCheckButton:CreateFontString("ReadyCheckSoundCheckButton_Title", "OVERLAY", "GameFontNormal")
readyCheckSoundCheckButtonTitle:SetPoint("LEFT", readyCheckSoundCheckButton, "RIGHT")
readyCheckSoundCheckButtonTitle:SetText("Mute Ready Check Sound")


function ShowConfigFrame()
    configFrame:Show()
end

function SetReadyCheckSoundButtonState()
    readyCheckSoundCheckButton:SetChecked(MuteReadycheckSound)
end
