#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -z "$PLAY_HOME" ]; then
    PLAY_HOME=/opt/play-framework/framework
fi

mkdir $DIR/api
javadoc -sourcepath $DIR/../app:$PLAY_HOME/src -d $DIR/api \
    -subpackages play `ls --indicator-style=none $DIR/../app`  \
    models.global models.statistics \
    -link http://www.playframework.org/documentation/api/2.0/java/package-list \
    2>/dev/null

# error output is ignored in order to keep the console clean.
