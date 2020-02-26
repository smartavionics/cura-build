
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86 8.1

set INSTALL_DIR=%HOMEDRIVE%%HOMEPATH%\cura\inst-32
set INSTALL_DIR_UNIX=%HOMEDRIVE%/Users/%USERNAME%/cura/inst-32

set PATH=c:\Program Files (x86)\mingw-w64\i686-8.1.0-posix-dwarf-rt_v6-rev0\mingw32\bin;%PATH%

set PATH=%INSTALL_DIR%\bin;%PATH%
set PATH=%INSTALL_DIR%\scripts;%PATH%
set PATH=%INSTALL_DIR%;%PATH%

set PYTHONPATH=%cd%\inst\lib\python3.5\site-packages
set PATH=%cd%\inst\bin;%PATH%

set CURA_BRANCH_OR_TAG=mb-master
set CURAENGINE_BRANCH_OR_TAG=mb-master
set URANIUM_BRANCH_OR_TAG=mb-master

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR_UNIX% -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR_UNIX% -DBUILD_OS_WIN32=ON -DCPACK_GENERATOR=NSIS -G "NMake Makefiles" -DCURA_VERSION=mb-master ..
