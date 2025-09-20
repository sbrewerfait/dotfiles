#!/bin/bash

tmux new-session -d -s 'php'

tmux split-window -h

tmux split-window -v

tmux split-window -v

tmux select-pane -L

tmux attach-session -t php
