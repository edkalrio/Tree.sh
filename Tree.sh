#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)
center=$((cols/2))

tput clear

addchar() {
	tput cup "$1" $((center + $2))
	echo "$3"
}

draw_star() {
	addchar 3  0 "O"

	addchar 2  1 "/"
	addchar 2 -1 "\\"
	addchar 4  1 "\\"
	addchar 4 -1 "/"

	addchar 3  1 "="
	addchar 3 -1 "="
	addchar 2  0 "|"
	addchar 4  0 "|"

	addchar 3  2 "-"
	addchar 3 -2 "-"
	addchar 1  0 "|"
	addchar 5  0 "|"

	addchar 3  3 "-"
	addchar 3 -3 "-"
}

draw_star