#!/bin/bash

export PATHFILE="$HOME/.cddpaths"

cdd() {
   local dest_dir=$(cat $PATHFILE | fzf )
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
export -f cdd > /dev/null

cda() {
    if grep -Fxq `pwd` $PATHFILE
    then
        echo '  ==== cdd - path exists.'
    else
        echo `pwd` >> $PATHFILE

        echo '  ==== cdd - path added: ' `pwd` 
    fi
}
export -f cda > /dev/null

cdrm() {
    echo '  ==== cdd - deleting: ' `pwd`
    sed -i -e "s|^$(pwd)$||" -e "/^$/ d" $PATHFILE

}
export -f cdrm > /dev/null
