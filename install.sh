#!/usr/bin/env bash

mkdir -p ~/.config/systemd/user
stow --adopt .
