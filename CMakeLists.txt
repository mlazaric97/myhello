cmake_minimum_required(VERSION 3.17)

if (DEFINED PROJECT_NAME)
	set(SUBPROJECT ON)
else() 
	set(SUBPROJECT OFF)
endif()


project(WMP LANGUAGES CXX C Fortran)
set(CMAKE_CXX_STANDARD 14)

#c++ and Fortran lib
add_library(WMPlib STATIC "")

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/interface)

target_include_directories(WMPlib PUBLIC 
	$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/src>
	$<INSTALL_INTERFACE:src/WMP>
	${CMAKE_CURRENT_LIST_DIR}/interface/ 
	)


target_sources(WMPlib 
	PUBLIC 
	${CMAKE_CURRENT_LIST_DIR}/src/WMP.hpp
	${CMAKE_CURRENT_LIST_DIR}/interface/WMP_interface.F90
	)

### Includes 
add_subdirectory(include)

		     
add_subdirectory(bin)

