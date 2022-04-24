SLASH_RCSD1 = '/ReadyCheckSoundDisabler';
SlashCmdList['RCSD'] = function(msg, editbox)
    args= {}
    index = 0
    for elem in string.gmatch(msg, '%S+') do
        args[index] = elem
        index = index + 1
    end


    if args[0] == 'config' then
        ShowConfigFrame()
    elseif args[0] == 'mute' then
        MuteReadyCheckSound()
    elseif args[0] == 'unmute' then
        UnMuteReadyCheckSound()
    elseif args[0] == 'help' then
        PrintHelp()
    else
        PrintHelp()
    end
end

function PrintHelp()
    print('|cFF00FF00 /ReadyCheckSoundDisabler [config mute unmute help]|r')
end