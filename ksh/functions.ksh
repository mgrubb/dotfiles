
function add_to_path {
	echo $PATH | tr ':' '\n' | grep -x -q "$1"
	if [ "$?" != "0" ]
	then
		PATH="$1:$PATH"
	fi
}

function cleanup_functions {
	unset -f add_to_path
	unset -f cleanup_functions
}
