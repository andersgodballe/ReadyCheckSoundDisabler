function DisableReadyCheckSoundCheckbox_OnClick(self)
    MuteReadycheckSound = self:GetChecked()
    if (MuteReadycheckSound) then
        DEFAULT_CHAT_FRAME:AddMessage("Ready Check sound is muted")
    else
        DEFAULT_CHAT_FRAME:AddMessage("Ready Check sound is not muted")
    end
end

function ConfigFrame_OnLoad(self)
    local title = self.title
    title:SetText("Ready Check Sound Disabler")
end

function onload(self)
    self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("READY_CHECK")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function onevent(self, event, ...)
    if (event == "ADDON_LOADED") then
        if MuteReadycheckSound == nil then
            MuteReadycheckSound = false -- This is the first time this addon is loaded; initialize the count to false.
        end

        DisableReadyCheckSoundCheckbox:SetChecked(MuteReadycheckSound)
    end

    if (event == "READY_CHECK") then
        if (MuteReadycheckSound) then
            MuteSoundFile(567478)
        end
    end

    if (event == "PLAYER_ENTERING_WORLD") then
        DEFAULT_CHAT_FRAME:AddMessage("Ready Check sound addon loaded")
        if (MuteReadycheckSound) then
            DEFAULT_CHAT_FRAME:AddMessage("Ready Check sound is muted")
        else
            DEFAULT_CHAT_FRAME:AddMessage("Ready Check sound is not muted")
        end
    end
end