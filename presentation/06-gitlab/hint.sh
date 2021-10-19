#!/bin/bash

mkdir -p ~/.config/systemd/user
cp gitlab-runner.service ~/.config/systemd/user/gitlab-runner.service

systemctl --user daemon-reload
systemctl --user start gitlab-runner