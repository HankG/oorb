cmake_minimum_required(VERSION 3.14)
project(oorb_dev)

enable_language(Fortran)

add_library( oorblib STATIC
        modules/parameters.f90
        modules/utilities.f90
        modules/random.f90
        modules/sort.f90
        modules/statistics.f90
        modules/functions.f90
        modules/linal.f90
        modules/estimators.f90
        modules/planetary_data.f90
        modules/cl_options.f90
        modules/integrators.f90
        modules/data_structures.f90
        classes/Base_class.f90
        classes/Unit_class.f90
        classes/File_class.f90
        classes/Time_class.f90
        classes/Observatory_class.f90
        classes/SphericalCoordinates_class.f90
        classes/CartesianCoordinates_class.f90
        classes/Observation_class.f90
        classes/Observatories_class.f90
        classes/Orbit_class.f90
        classes/Observations_class.f90
        classes/StochasticOrbit_class.f90
        classes/PhysicalParameters_class.f90
        main/io.f90
        python/pyoorb.f90
        )

add_executable(oorb
        main/oorb.f90
        )

add_executable(ephemeris_linking
        main/ephemeris_linking.f90
        )

add_executable(orbit_linking
        main/orbit_linking.f90
        )

add_dependencies(oorb oorblib)
add_dependencies(ephemeris_linking oorblib)
add_dependencies(orbit_linking oorblib)

target_link_libraries(oorb oorblib)
target_link_libraries(ephemeris_linking oorblib)
target_link_libraries(orbit_linking oorblib)

