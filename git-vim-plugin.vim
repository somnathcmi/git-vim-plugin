function! s:gitpush()
    let s:filep = expand('%:p:h')
    let s:filet = expand('%:t')
    while !isdirectory(s:filep.'/.git') && (!(s:filep == '/'))
        let s:filep = fnamemodify(s:filep,':h') 
    endwhile
    let s:gitdir = s:filep.'/.git'
    let s:workdir = s:filep
    echo s:filep.';'.s:filet
    let s:gitc = 'git --git-dir='.s:gitdir.' --work-tree='.s:workdir.' ' 
    let s:thisrepo = trim(system(s:gitc.'remote'))
    let s:currentbranch = trim(system(s:gitc.'branch --show-current'))
"    let l:msg = '['.trim(strftime("%Y%m%d%H%M%S")).']: Uploaded from vim. File: '
    let l:msg = 'Uploaded from vim. File: '
    execute ':silent !'.s:gitc.'add '.s:filet | execute ':redraw!'
    execute ':silent !'.s:gitc.'commit -m "'.l:msg.s:filet.'"' | execute ':redraw!'
    execute ':silent !'.s:gitc.'push '.s:thisrepo.' '.s:currentbranch | execute ':redraw!'
endfunction

command! MyGitPush call s:gitpush()

"command! MyGitPush execute ''
"command! GitVimPluginStart execute ':silent !source git-vim-plugin.sh' | execute ':redraw!'
"command! -nargs=2 GitU execute ':silent !GitUpload'.<q-args> | execute ':redraw!'
