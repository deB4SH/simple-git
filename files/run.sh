#! /bin/sh
echo "configure git safe directory and starting git daemon in tmux session"
git config --system --add safe.directory '*' 
tmux new-session -d -s git 'git daemon --verbose --base-path=/data --enable=receive-pack'
echo "starting lighttpd"
tmux new-session -d -s http '/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf'
echo "showing tmux sessions"
tmux ls
echo "tailing /dev/null to keep container alive"
tail -f /dev/null

