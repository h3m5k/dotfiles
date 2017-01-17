function fish_prompt --description 'Write out the prompt'
	if test -z $WINDOW
   printf '%s%s@%s%s%s%s%s> ' (set_color red) (whoami) (set_color white) (hostname|cut -d . -f 1) (set_color yellow) (prompt_pwd) (set_color normal)
 else
   printf '%s%s@%s%s%s(%s)%s%s%s> ' (set_color yellow) (whoami) (set_color purple) (hostname|cut -d . -f 1) (set_color white) (echo $WINDOW) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
 end
end
