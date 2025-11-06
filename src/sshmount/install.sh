#!/bin/bash

echo "Installing sshmount"

echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

chown -R $_REMOTE_USER:$_REMOTE_USER /mnt/.ssh
ln -s /mnt/.ssh $_REMOTE_USER_HOME/.ssh

# Mount .aws directory
chown -R $_REMOTE_USER:$_REMOTE_USER /mnt/.aws
ln -s /mnt/.aws $_REMOTE_USER_HOME/.aws

# Mount .claude config
chown -R $_REMOTE_USER:$_REMOTE_USER /mnt/.claude
ln -s /mnt/.claude $_REMOTE_USER_HOME/.claude
chown $_REMOTE_USER:$_REMOTE_USER /mnt/.claude.json
ln -s /mnt/.claude.json $_REMOTE_USER_HOME/.claude.json


# Mount .config/fish directory
mkdir -p $_REMOTE_USER_HOME/.config
chown -R $_REMOTE_USER:$_REMOTE_USER /mnt/.config/fish
ln -s /mnt/.config/fish $_REMOTE_USER_HOME/.config/fish