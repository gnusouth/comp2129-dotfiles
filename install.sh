#!/bin/bash

files=(inputrc bashrc bash_profile nanorc nano)

for f in ${files[@]}
do
	if [ -e "$HOME/.$f" ]
	then
		rm -ir "$HOME/.$f"
	fi
	echo "Linking ~/.$f to $PWD/$f"
	ln -s "$PWD/$f" "$HOME/.$f"
done
