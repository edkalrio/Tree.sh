#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)
center=$(( cols/2 ))
max_H=$(( (rows - 4)/4 - 1 ))
max_W=$(( (cols - 15)/8 - 1 ))
tree_size=$(( max_H < max_W ? max_H : max_W ))

addchar() {
	tput cup "$1" $(( center + "$2" ))
	echo "$3"
}

tree_area() {
	for (( i = 0; i < tree_size; i++ )); do
		for (( j = 0; j < 4; j++ )); do
			k=$(( 4*i + j ))
			w[k]=$(( 8*i + 4*j + 1 ))
			area=$(( ${w[@]/%/+}0 ))
		done
	done
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

grow_tree() {
	for (( i = 0; i < tree_size; i++ )); do
		for (( j = 0; j < 4; j++ )); do
			addchar $(( 4*i + j + 4 )) $((   4*i + 2*j + 1 )) "\\"
			addchar $(( 4*i + j + 4 )) $(( - 4*i - 2*j - 1 )) "/"
		done
	done
}

lights() {
	for (( i = 0; i < area/10; i++ )); do
		tree_H=$(( ${#w[*]} ))
		random_pre_y=$(( RANDOM % tree_H ))
		random_pre_x=$(( RANDOM % cols ))
		if [[ $random_pre_x -lt ${w[random_pre_y]} ]]; then
			random_y=$(( random_pre_y + 4 ))
			random_x=$(( (random_pre_x - 1) / 2 ))
			if [[ $((RANDOM % 2)) -eq 1 ]]; then
				random_x=$(( - random_x ))			
			fi	
			addchar $random_y $random_x "o"
		fi
	done
}

tput clear

grow_tree
draw_star

tree_area
lights
