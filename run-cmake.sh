#! /bin/sh

PATH=~/cura/local/bin:$PATH \
PYTHONPATH=~/cura/local/lib/python3/dist-packages \
CURA_BRANCH_OR_TAG=mb-master \
CURAENGINE_BRANCH_OR_TAG=mb-master \
URANIUM_BRANCH_OR_TAG=mb-master \
cmake -DCMAKE_INSTALL_PREFIX:PATH=~/cura/local -DCMAKE_PREFIX_PATH=~/cura/local -DCURA_VERSION=mb-master ..
