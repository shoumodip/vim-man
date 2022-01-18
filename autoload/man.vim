if exists('s:loaded_sigma_man')
    finish
endif

let s:loaded_sigma_man = 1

function! man#sigma(...)
    let fallback = substitute(expand('<cword>'), '\(\w\+\)\s*(\(\d*\).*', '\2 \1', 'g')

    let topic = trim(exists('a:1') && a:1 != '' ? a:1 : input('Man: ', trim(fallback), 'shellcmd'))
    if topic == ''
        return
    endif

    execute "edit SigmaMan:" . topic
    setlocal buftype=nofile
    setlocal filetype=man

    let readcmd = 'read !man ' . topic . ' | col -b'
    silent! execute readcmd
    silent! normal! gg"_dd

    if getline(".") =~? 'man: outdated mandoc\.db .* run makewhatis /usr/share/man'
        silent! normal! "_dG

        let updatecmd = 'sudo makewhatis /usr/share/man'
        echo 'Please wait. Updating man database'

        if system(updatecmd) =~? 'sudo: a terminal is required to read the password.*'
            let password = inputsecret('Sudo password: ')
            if password ==? ''
                mode
                echo 'No password provided'
                bd!
                return
            else
                if system('echo ' . password . ' | sudo -S makewhatis /usr/share/man') =~? 'Password: Sorry, try again.*'
                    mode
                    echo 'Incorrect password provided'
                    bd!
                    return
                end
            endif
        endif

        silent! execute readcmd
        silent! normal! gg"_dd
    endif

    if getline(".") =~? 'man:.* No .*'
        bd!

        try
            let [section, topic] = split(topic, ' ')
            echo 'No entry for ' . topic . ' in section ' . section . ' of the manual'
        catch
            echo 'No entry for ' . topic . ' in the manual'
        endtry

        return
    endif

    setlocal nomodifiable
endfunction
