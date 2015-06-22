# Link tmux
TMUX_CONF="${HOME}/.tmux.conf"
rm $TMUX_CONF
ln -s "${PWD}/tmux/tmux.conf" $TMUX_CONF

# Link Emacs
EMACS_D="${HOME}/.emacs.d"
rm -f $EMACS_D
ln -s "${PWD}/emacs/local" $EMACS_D
rm "${EMACS_D}/init.el"
ln -s "${PWD}/emacs/init.el" "${EMACS_D}/init.el"

