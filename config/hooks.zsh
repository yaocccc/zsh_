source ~/.profile
xset -b
if [[ -d $VIM_TEM_DIR ]] { cd $VIM_TEM_DIR && ~/scripts/edit-profile.sh VIM_TEM_DIR '' } else { cd $CURRENT_DIR }
print -n "\e]2;$(basename `pwd`)\a"
