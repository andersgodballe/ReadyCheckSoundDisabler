SLASH_RCSD1 = '/ReadyCheckSoundDisabler';
SlashCmdList['RCSD'] = function(msg, editbox)
    args= {}
    index = 0
    for elem in string.gmatch(msg, '%S+') do
        args[index] = elem
        index = index + 1
    end


    if args[0] == 'config' then
        ReadyCheckDisablerFrame:Show()
    elseif args[0] == 'mute' then
        MuteReadycheckSound = true
        DisableReadyCheckSoundCheckbox:SetChecked(MuteReadycheckSound)
        DEFAULT_CHAT_FRAME:AddMessage("Readycheck sound is muted")
    elseif args[0] == 'unmute' then
        MuteReadycheckSound = false
        DisableReadyCheckSoundCheckbox:SetChecked(MuteReadycheckSound)
        DEFAULT_CHAT_FRAME:AddMessage("Readycheck sound is not muted")
    elseif args[0] == 'help' then
        printHelp()
    else
        printHelp()
    end
end

function printHelp()
    print('|cFF00FF00 /ReadyCheckSoundDisabler [config mute unmute help]|r')
end