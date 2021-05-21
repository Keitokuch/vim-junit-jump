if exists('g:loaded_junit_jump')
    finish
endif
let g:loaded_junit_jump = 1

let s:proj_root = finddir('gradle/..', expand('%:p:h').';')

fun! JavaJUnitJump()
    let l:file_name = expand('%:t')
    let l:file_dir = expand('%:h')
    if stridx(l:file_dir, 'test') >= 0
        " Contains 'test' in path
        call s:to_class()
    elseif stridx(expand('%:h'), 'main') >= 0
        " Contains 'main' in path
        call s:to_test()
    else
        echo "[junit-jump] Unable to jump: Not in a test or main directory."
        return
    endif
endf

fun s:to_class()
    let l:file_name = expand('%:t')
    let l:file_dir = expand('%:h')
    if stridx(l:file_name, 'Test.java') >= 0
        let l:file_name = substitute(l:file_name, 'Test', '', '')
        let l:file_dir = substitute(l:file_dir, 'test', 'main', '')
        let l:file = l:file_dir.'/'.l:file_name
        if !filereadable(l:file)
            echo "[junit-jump] Couldn't open class file ".l:file
            return
        else
            exec 'edit '.l:file
        endif
    else
        echo '[junit-jump] Unable to jump: Not a test class.'
        return
    endif
endf

fun s:to_test()
    let l:file_name = expand('%:t')
    let l:file_dir = expand('%:h')
    if expand('%:e') == 'java'
        let l:class_name = expand('%:t:r')
        let l:test_name = l:class_name . 'Test.java'
        let l:test_dir = substitute(l:file_dir, 'main', 'test', '')
        let l:test_file = l:test_dir.'/'.l:test_name
        if filereadable(l:test_file) != 1
            let l:create = input("Couldn't find test for ".l:file_name."\nCreate test file now? (Y/n):")
            redraw | echo
            if l:create == 'Y' || l:create == 'y' || l:create == ''
                if !isdirectory(l:test_dir)
                    call mkdir(l:test_dir, "p")
                endif
                exec 'edit '.l:test_file
            endif
        else
            exec 'edit '.l:test_file
        endif
    else
        echo '[junit-jump] Unable to jump: Not a java class'
        return
    endif
endf

command! -n=0 -bar JavaJUnitJump call JavaJUnitJump()
