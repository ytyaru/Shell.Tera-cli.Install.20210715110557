#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# Tera-cliをインストールする。
# CreatedAt: 2021-07-15
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	IsExistCmd() { type "$1" > /dev/null 2>&1; }
	InstallRust() { curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh; }
	InstallTera() { cargo install --git https://github.com/chevdor/tera-cli; }
	IsExistCmd rustc || InstallRust
	IsExistCmd tera || InstallTera
	
	tera -t README.tpl -o README.md README.tpl.toml
}
Run "$@"
