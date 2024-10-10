#!/usr/bin/env fish

set cwd (pwd)

# Launch Neovide in a new process group
setsid neovide &

set neovide_pid $last_pid

# Close the current terminal (Fish shell with Alacritty)
if test "$TERM" = "xterm-kitty"
    # Get the parent process of the current Fish shell 
    # (this will be Alacritty's shell process)
    set parent_pid (ps -p $fish_pid -o ppid= | tail -n 1 | string trim)

    # Kill the parent process (Alacritty)
    kill -9 $parent_pid
end

# Wait for Neovide to exit
wait $last_pid

# After Neovide exits, reopen a new Alacritty terminal window
kitty &
