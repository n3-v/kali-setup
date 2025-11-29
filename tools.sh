#!/bin/bash


sudo apt install pipx fzf -y 
pipx ensurepath


# pipx 
pipx install bloodyAD certipy-ad


# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh