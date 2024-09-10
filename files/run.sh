#! /bin/sh
echo "starting git daemon in tmux session"
tmux new-session -d -s git 'git daemon --verbose --base-path=/data --enable=receive-pack'
echo "starting lighttpd"
tmux new-session -d -s http '/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf'
echo "showing tmux sessions"
tmux ls
tmux attach -t git

