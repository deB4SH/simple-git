#! /bin/sh
echo "configure git safe directory and starting git daemon in tmux session"
git config --system --add safe.directory '*' 
tmux new-session -d -s git 'git daemon --verbose --base-path=/data --enable=receive-pack'
echo "starting http"
tmux new-session -d -s http '/bin/sh -c /usr/local/bin/run-and-apache2.sh'
echo "showing tmux sessions"
tmux ls
echo "tailing /dev/null to keep container alive"
tail -f /dev/null

