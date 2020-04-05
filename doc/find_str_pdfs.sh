#!/bin/bash

# Locate and count occurrences of a given string str (quoted if contains space(s))
# in PDF file(s) given or recursively browsed through the target directory
# and open PDF(s) containing a match in the default system application 
#
# Usage : ./find_str_pdfs.sh str [target] [nopen] 

str=$1
target=$2
nopen=$3

if [ -z "$str" ]; then
    echo "Usage : ./find_str_pdfs.sh str [target] [nopen] where str not empty string to locate"
    exit 1
fi

shopt -s nocasematch # make string matching case insensitive

find_str (){
	i=0
	numline=0
	lines_nbrs=""
	while read line; do
		((numline++))
		if [[ ${line} == *${str}* ]]; then
			((i++))
			lines_nbrs+=" $numline"
		fi
	done < <(pdftotext ${1} -)
	echo $i $numline $lines_nbrs
}

select_files () {
    if [ -d $target ]; then # match when target not given -> cwd for find
	    find ${target} -name "*.pdf"
    elif [[ ${target} == *.pdf ]]; then
        echo $target
    fi
}


files=( $( select_files ) )

for file in ${files[@]}; do
	res=( $(find_str ${file}) )
	if [ ${res[0]} != "0" ]; then
	    echo "$file : ${res[0]} matches / ${res[1]} lines"
	    if [ ! -z ${res[2]} ]; then
	        echo "     +--- @lines ${res[@]:2:15}"
	        echo ""
	    fi
	    if [[ ${nopen} != no* ]]; then
	        xdg-open ${file} &
        fi
    fi
done
