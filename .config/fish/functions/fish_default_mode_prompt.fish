function fish_default_mode_prompt --description "Display the default mode for the prompt"
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
		set_color $fish_color_cwd
                echo '+'
            case insert
		set_color $fish_color_cwd
                echo '-'
            case replace_one
		set_color $fish_color_cwd
                echo '*'
            case replace
		set_color $fish_color_cwd
                echo '*'
            case visual
		set_color $fish_color_cwd
                echo '<>'
        end
        set_color normal
        echo -n ' '
    end
end

