#!/bin/bash

echo "needs a bit of fixing!"
exit


SCRIPT=$(basename $0)
EXCLUDE_PATTERN="^(\.+|${SCRIPT}|\.${SCRIPT}.*|README.md|.git|.gitignore)$"
LINK_DIR=${HOME}
LINK_TRGTS=$(ls -a | grep -v -E $EXCLUDE_PATTERN)

if [ "$1" == "--go" ]
then
	PROMPT="no"
else
	PROMPT="yes"
fi

if [ "$PROMPT" == "yes" ]
then
	echo "This will forcefully overwrite any existing dotfiles in $LINK_DIR"
	echo "Do you wish to continue? [y/n]"
	read answer

	if [ "$answer" != "y" ]
	then
		echo "Aborting!"
		exit 0
	fi
fi

linkem() {

	if ! [ $# -eq 2 ]
	then 
		echo "linkit(): Missing args."
		exit 1
	fi

	SRC="$1"
	TRG="$2"
	if [ "$PROMPT" == "yes" -a -e "$TRG" ]
	then
		echo "$TRG already exists. Overwrite? [y/n]"
		read ans
		if [ "$ans" == "y" ]
		then
			ln -sfn $SRC $TRG && \
			echo "Linked $TRG to $SRC"	
		else
			echo "Skipped $TRG"
		fi
	else
		ln -sfn $SRC $TRG && \
		echo "Linked $TRG to $SRC"
	fi
}

for L in $LINK_TRGTS
do
	if [ -d "$L" -a "$L" == ".config" ]
	then
		[ -d "$LINK_DIR/$L" ] || mkdir $LINK_DIR/$L
		DOT_CONFIGS=$(find $L -maxdepth 1 -type d)
		for I in $DOT_CONFIGS
		do
			if [[ "$I" =~ \/ ]]
			then
				linkem $PWD/$I $LINK_DIR/$I
			fi
		done
	else
		linkem $PWD/$L $LINK_DIR/$L
	fi
done
