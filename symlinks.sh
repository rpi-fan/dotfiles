# demaya.de/wp/2014/02/dotfiles-mit-github-synchronisieren-und-aktuell-halten
# 2014-03-02 khs
#
#!/bin/bash
############################
#
# This script creates symlinks from the home directory to any desired  dotfiles in ~/.dotfiles
# ##########################
#
# ##########################
# Variables
#
dir=~/.dotfiles 		# dotfiles directory
files=`ls -1 $dir/__*`		# list of files/folders to symlink in homedir
#
# ##########################
#
# Change to the dotfiles directory
#
# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
#
for file in $files; do
	basename=`basename $file`
	targetname=`echo $basename | sed 's/__//'`
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$basename ~/.$targetname
done

#
