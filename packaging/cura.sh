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

  if [ "$HOSTTYPE" == "arm" ]; then
    MESA_LIB_DIR="/opt/mesa/lib/arm-linux-gnueabihf"
  else
    MESA_LIB_DIR="/opt/mesa/lib/$HOSTTYPE-linux-gnu"
  fi

  if [ -d "$MESA_LIB_DIR" ]; then
    echo "Found $MESA_LIB_DIR"
    export LD_LIBRARY_PATH="$MESA_LIB_DIR"
    echo "Forcing GLES version to 3.2"
    export MESA_GLES_VERSION_OVERRIDE="3.2"
  elif test -x /usr/bin/glxinfo; then
    if /usr/bin/glxinfo -B | grep -q -E "    Version: ([2-9][0-9])"; then
      echo "Found Mesa version 20 or higher"
      echo "Forcing GLES version to 3.2"
      export MESA_GLES_VERSION_OVERRIDE="3.2"
    fi
  else
    message="Can't find glxinfo to test installed Mesa version, please do: sudo apt-get install mesa-utils"
    echo "$message"
  fi
fi

export PYTHONPATH="$scriptdir/lib/python3.8"
export QT_PLUGIN_PATH="$scriptdir/qt/plugins"
export QML2_IMPORT_PATH="$scriptdir/qt/qml"
export QT_QPA_FONTDIR=/usr/share/fonts
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Use the openssl.cnf packaged in the AppImage
export OPENSSL_CONF="$scriptdir/openssl.cnf"

if [ -n "$CURA_GDB" ]; then
  PP="$PYTHONPATH"
  unset PYTHONPATH
  unset PYTHONHOME
  $CURA_GDB -ex "set env PYTHONPATH = \"$PP\"" "$scriptdir/cura"
else
  cura "$@"
  if (($? != 0)); then
    # did cura bomb due to missing libraries?
    echo "Cura crashed, was that because a required library couldn't be found?"
    LD_LIBRARY_PATH="$scriptdir:$LD_LIBRARY_PATH" ldd "${QT_PLUGIN_PATH}/platforms/libqxcb.so" | grep "not found"
  fi
fi
