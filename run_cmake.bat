
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

set INSTALL_DIR=%HOMEDRIVE%%HOMEPATH%\cura\inst

set PATH=%INSTALL_DIR%\bin;%PATH%
set PATH=%INSTALL_DIR%\scripts;%PATH%
set PATH=%INSTALL_DIR%;%PATH%

set PYTHONPATH=%cd%\inst\lib\python3.5\site-packages
set PATH=%cd%\inst\bin;%PATH%

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR% -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DBUILD_OS_WIN64=ON -G "NMake Makefiles" -DCURA_VERSION=mb-master ..
