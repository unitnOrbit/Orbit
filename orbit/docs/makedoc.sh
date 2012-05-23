#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir $DIR/api
javadoc -sourcepath $DIR/../app -d $DIR/api `ls --indicator-style=none $DIR/../app`
