#!/bin/sh

scriptdir=$(dirname $0)

if [ -f /usr/lib/arm-linux-gnueabihf/libGLESv2.so ]; then
  export QT_XCB_GL_INTEGRATION=xcb_egl
fi

export PYTHONPATH=$scriptdir/lib/python3.5
export QT_PLUGIN_PATH=$scriptdir/qt/plugins
export QML2_IMPORT_PATH=$scriptdir/qt/qml
export QT_QPA_FONTDIR=/usr/share/fonts
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Use the openssl.cnf packaged in the AppImage
export OPENSSL_CONF=$scriptdir/openssl.cnf

cura "$@"
