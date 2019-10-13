option(CURA_ENABLE_DEBUGMODE "Enable crash handler and other debug options in Cura" OFF)

ExternalProject_Add(Cura
    GIT_REPOSITORY https://github.com/smartavionics/Cura
    GIT_TAG origin/${CURA_BRANCH_OR_TAG}
    STEP_TARGETS update
    #GIT_SHALLOW 1
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNALPROJECT_INSTALL_PREFIX}
               -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
               -DURANIUM_SCRIPTS_DIR=
               -DCURA_VERSION=${CURA_VERSION}
               -DCURA_DEBUGMODE=${CURA_ENABLE_DEBUGMODE}
               -DCURA_CLOUD_API_ROOT=${CURA_CLOUD_API_ROOT}
               -DCURA_CLOUD_API_VERSION=${CURA_CLOUD_API_VERSION}
               -DCURA_CLOUD_ACCOUNT_API_ROOT=${CURA_CLOUD_ACCOUNT_API_ROOT}
)

SetProjectDependencies(TARGET Cura DEPENDS Uranium CuraEngine)

add_dependencies(update Cura-update)
