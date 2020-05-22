#!/bin/sh

scriptdir=$(dirname $0)

if [ -f /usr/lib/arm-linux-gnueabihf/libGLESv2.so ]; then
  export QT_XCB_GL_INTEGRATION=xcb_egl
fi

export PYTHONPATH="$scriptdir/lib/python3.5"
export QT_PLUGIN_PATH="$scriptdir/qt/plugins"
export QML2_IMPORT_PATH="$scriptdir/qt/qml"
export QT_QPA_FONTDIR=/usr/share/fonts
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Use the openssl.cnf packaged in the AppImage
export OPENSSL_CONF="$scriptdir/openssl.cnf"

MESA_LIB_DIR="/opt/mesa-20.1/lib/arm-linux-gnueabihf"

if [ -d "$MESA_LIB_DIR" ]; then
  echo "Found $MESA_LIB_DIR"
  export LD_LIBRARY_PATH="$MESA_LIB_DIR"
  export MESA_GLES_VERSION_OVERRIDE="3.2"
fi

cura "$@"
