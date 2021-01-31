## Tmux Configuration
# Installation:
Copy any of the *.conf files to ~/.tmux.conf (root of home directory)

# Activation
At the time of writing, if the tmux server is not started (no sessions currently running), it should source .tmux.conf

If there are current tmux sessions running, it may work to run:
tmux source ~/.tmux.conf

See:
https://unix.stackexchange.com/questions/66606/tmux-not-sourcing-my-tmux-conf

## Credits For Gruvbox:
The repo:
https://github.com/egel/tmux-gruvbox

The file:
https://github.com/egel/tmux-gruvbox/blob/master/tmux-gruvbox-dark.conf

Accessed on date:
Jan. 28, 2021
