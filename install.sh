#!/usr/bin/env bash

mkdir -p ~/.config/systemd/user
chmod +x ./.local/bin/*
stow --adopt .
