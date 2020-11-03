#!/bin/bash

scriptdir=$(dirname $0)

if [ "$HOSTTYPE" == "arm" -o "$HOSTTYPE" == "aarch64" ]; then
  export QT_XCB_GL_INTEGRATION=xcb_egl
  if test -x /sbin/ldconfig; then
    if /sbin/ldconfig -p | grep -q libGLESv2; then
      echo "Found libGLESv2"
    else
      mesage="Can't find libGLESv2, you need to do: sudo apt-get install libgles-dev"
      echo "$message"
      xmessage "$message"
      exit 1
    fi
  fi
fi

export PYTHONPATH="$scriptdir/lib/python3.5"
export QT_PLUGIN_PATH="$scriptdir/qt/plugins"
export QML2_IMPORT_PATH="$scriptdir/qt/qml"
export QT_QPA_FONTDIR=/usr/share/fonts
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Use the openssl.cnf packaged in the AppImage
export OPENSSL_CONF="$scriptdir/openssl.cnf"

if [ "$HOSTTYPE" == "arm" ]; then
	MESA_LIB_DIR="/opt/mesa/lib/arm-linux-gnueabihf"
else
	MESA_LIB_DIR="/opt/mesa/lib/$HOSTTYPE-linux-gnu"
fi

if [ -d "$MESA_LIB_DIR" ]; then
  echo "Found $MESA_LIB_DIR"
  export LD_LIBRARY_PATH="$MESA_LIB_DIR"
  export MESA_GLES_VERSION_OVERRIDE="3.2"
fi

cura "$@"
