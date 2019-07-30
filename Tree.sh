#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)
center=$((cols/2))

tput clear

draw_star() {
	tput cup 3 $center
	echo "O"

	tput cup 2 $((center + 1))
	echo "/"
	tput cup 2 $((center - 1))
	echo "\\"
	tput cup 4 $((center + 1))
	echo "\\"
	tput cup 4 $((center - 1))
	echo "/"

	tput cup 3 $((center + 1))
	echo "="
	tput cup 3 $((center - 1))
	echo "="
	tput cup 2 $center
	echo "|"
	tput cup 4 $center
	echo "|"

	tput cup 3 $((center + 2))
	echo "-"
	tput cup 3 $((center - 2))
	echo "-"
	tput cup 1 $center
	echo "|"
	tput cup 5 $center
	echo "|"

	tput cup 3 $((center + 3))
	echo "-"
	tput cup 3 $((center - 3))
	echo "-"
}
