#! /bin/sh

if test "$(uname)" = "Darwin"; then
  export CURA_TARGET_OSX_VERSION=10.13
  . ../env_osx.sh
  unset CC
  unset CXX
  export CURA_HOME=~/cura/local
else
  export CURA_HOME=/opt/cura
fi

echo "CURA_HOME is $CURA_HOME"

PATH=$CURA_HOME/bin:$PATH \
PYTHONPATH=$CURA_HOME/lib/python3.8 \
CURA_BRANCH_OR_TAG=mb-master \
CURAENGINE_BRANCH_OR_TAG=mb-master \
URANIUM_BRANCH_OR_TAG=mb-master \
cmake -DCMAKE_INSTALL_PREFIX:PATH=$CURA_HOME -DCMAKE_PREFIX_PATH=$CURA_HOME -DCURA_VERSION=mb-master ..
