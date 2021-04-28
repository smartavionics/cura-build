
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64 8.1

set INSTALL_DIR=%HOMEDRIVE%%HOMEPATH%\cura\inst
set INSTALL_DIR_UNIX=%HOMEDRIVE%/Users/%USERNAME%/cura/inst

set PATH=%INSTALL_DIR%\bin;%PATH%
set PATH=%INSTALL_DIR%\scripts;%PATH%
set PATH=%INSTALL_DIR%;%PATH%

set PYTHONPATH=%cd%\inst\lib\python3.8\site-packages
set PATH=%cd%\inst\bin;%PATH%

set CURA_BRANCH_OR_TAG=mb-master
set CURAENGINE_BRANCH_OR_TAG=mb-master
set URANIUM_BRANCH_OR_TAG=mb-master

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR_UNIX% -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR_UNIX% -DBUILD_OS_WIN64=ON -DCPACK_GENERATOR=NSIS -G "NMake Makefiles" -DCURA_VERSION=mb-master ..
