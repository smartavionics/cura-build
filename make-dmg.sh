#! /bin/sh

NAME=Cura-mb-master-macos-`date +%Y%m%d`

rm -rf $NAME.dmg cura-mb-master.app

mv build/Ultimaker\ Cura.app cura-mb-master.app

hdiutil create -fs HFS+ -srcfolder cura-mb-master.app $NAME.dmg
