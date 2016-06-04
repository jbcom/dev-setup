#!/usr/bin/env bash

echo "Setup Git for $USER"

echo -n "Enter your full name as you want it to appear on Git commit messages and press [ENTER]: "
read name

echo -n "Enter your email address as you want it to appear on Git commit messages and press [ENTER]: "
read email

echo

git config --global user.name "$name"
git config --global user.email $email
