# demaya.de/wp/2014/02/dotfiles-mit-github-synchronisieren-und-aktuell-halten
# 2014-03-02 khs
#
#!/bin/bash
############################
# Init-Script
# This script creates symlinks from the home directory to any desired  dotfiles in ~/.dotfiles
# ##########################
#
# ##########################
# Variables
#
dir=~/.dotfiles				# dotfiles directory
olddir=~/.dotfiles_old		# old dotfiles backup directory
files=`ls -1 $dir/__*`		# list of files/folders to symlink in homedir
#
# ##########################
#
# Create dotfiles_old in homedir
#
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
#
# Change to the dotfiles directory
#
echo "Changing to the $dir directory"
cd $dir
echo "...done"
#
# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
#
for file in $files; do
	basename=`basename $file`
	targetname=`echo $basename | sed 's/__//'`
	echo "Moving any existing dotfiles from ~ to $oldir"
	mv ~/.$targetname $olddir/
	echo "Creating symlink to $file in homedirectory"
	ln -s $dir/$basename ~/.$targetname
done


