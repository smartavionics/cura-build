
if(APPLE)
    set(BUILD_OS_OSX ON)
elseif(WIN32)
    set(BUILD_OS_WINDOWS ON)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(BUILD_OS_WIN64 ON)
    else()
        set(BUILD_OS_WIN32 ON)
    endif()
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(BUILD_OS_LINUX ON)
endif()
