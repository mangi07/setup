## Terminal Colors
This directory is for customizing the colors of terminal output separately from that of tmux and vim.

In ~/.bashrc or elsewhere, the following script could be used to enable these colors:
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi

So copy .dircolors to ~/.dircolors to use this script.
