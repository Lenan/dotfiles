function fish_prompt --description 'Write out the prompt'
    echo

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    # GIT
    __terlar_git_prompt
    fish_hg_prompt

    #CMD
    echo
    echo -n '➤ '
    set_color normal
end
