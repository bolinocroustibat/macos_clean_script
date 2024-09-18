#!/bin/bash

if [[ $(command -v brew) ]]; then
	printf "\n\n🍺 Updating packages installed by Homebrew...\n"
	brew update
	brew upgrade
	brew autoremove
	brew cleanup -s
	printf "🍺 Diagnosing Homebrew status...\n"
	brew doctor
	brew missing
fi

if [[ $(command -v mas) ]]; then
	printf "\n\n🍎 Listing outdated MacOS AppStore apps...\n"
	mas outdated
	printf "🍎 You can upgrade those Mac apps from the AppStore with the command 'mas upgrade'."
fi

if [[ $(command -v npm) ]]; then
	printf "\n\n📜 Updating JS packages installed globally by npm...\n"
	npm update --location=global
fi

if [[ $(command -v pnpm) ]]; then
	printf "\n\n📜 Updating JS packages installed globally by pnpm...\n"
	pnpm update --global
fi

#if [[ $(command -v yarn) ]]; then
#	printf "\n\n📜 Updating JS packages installed globally by yarn...\n"
#	yarn global upgrade
#fi

if [[ $(command -v gem) ]]; then
	printf "\n\n💎 Updating Ruby gems...\n"
	gem update
fi

printf "\n\n🐍 Updating global pip...\n"
python3 -m pip install --upgrade pip

printf "\n\n🍎 Listing official MacOS pending upgrades...\n"
softwareupdate --list
