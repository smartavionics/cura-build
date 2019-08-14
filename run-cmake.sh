#!/bin/sh

#PATH=/opt/cura/bin/:$PATH cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/cura ..

PATH=/opt/cura/bin:$PATH \
PYTHONPATH=/opt/cura/lib/python3/dist-packages \
CURA_BRANCH_OR_TAG=mb-master \
CURAENGINE_BRANCH_OR_TAG=mb-master \
URANIUM_BRANCH_OR_TAG=mb-master \
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/cura -DCMAKE_PREFIX_PATH=/opt/cura ..
