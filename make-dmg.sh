#! /bin/sh

NAME=cura-mb-master-`date +%Y%m%d`

rm -rf cura-mb-master.app
mv build/Ultimaker\ Cura.app cura-mb-master.app

hdiutil create -fs HFS+ -srcfolder cura-mb-master.app $NAME.dmg
