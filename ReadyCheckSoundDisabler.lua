function GlobalOnEventHandler(self, event)
    if (event == "ADDON_LOADED") then
        if MuteReadycheckSound == nil then
            MuteReadycheckSound = false -- This is the first time this addon is loaded; initialize the count to false.
        end

        SetReadyCheckSoundButtonState()
    end

    if (event == "READY_CHECK") then
        if (MuteReadycheckSound) then
            MuteSoundFile(567478)
        end
    end

    if (event == "PLAYER_ENTERING_WORLD") then
        print("Ready Check sound addon loaded")
        if (MuteReadycheckSound) then
            print("Ready Check sound is muted")
        else
            print("Ready Check sound is unmuted")
        end
    end
end

function MuteReadyCheckSound()
    MuteReadycheckSound = true
    SetReadyCheckSoundButtonState()
    print("Readycheck sound is muted")
end

function UnMuteReadyCheckSound()
    MuteReadycheckSound = false
    SetReadyCheckSoundButtonState()
    print("Readycheck sound is unmuted")
end