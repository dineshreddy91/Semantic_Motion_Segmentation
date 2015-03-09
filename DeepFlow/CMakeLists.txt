CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
LINK_DIRECTORIES(${CMAKE_BINARY_DIR}/imageLib)

SET (LIB_NAMES m jpeg png)

FOREACH(lib ${LIB_NAMES})
  FIND_LIBRARY(LIB_${lib} ${lib})
  IF (LIB_${lib})
    MESSAGE(STATUS "found library '${lib}': ${LIB_${lib}}")
  ELSE (LIB_${lib})
    MESSAGE(FATAL_ERROR "cannot find library '${lib}' - this will not work ...")
  ENDIF (LIB_${lib})
  LIST(APPEND LIBS ${LIB_${lib}})
ENDFOREACH(lib)



SET (CLASSES image io opticalflow_aux opticalflow solver)

FOREACH(class ${CLASSES})
  LIST(APPEND SOURCES ${class}.c ${class}.h)
ENDFOREACH(class)

SET (CLASSES Convolve Convert flowIO ImageIO ImageIOpng RefCntMem Image)

FOREACH(class ${CLASSES})
  LIST(APPEND SOURCES ${class}.cpp ${class}.h)
ENDFOREACH(class)

LINK_DIRECTORIES(${LINK_DIRS})
LINK_LIBRARIES (deepflow_1 ${LIBS} )
ADD_LIBRARY(deepflow_1 SHARED ${SOURCES})

ADD_EXECUTABLE(deepflow deepflow.c)
LINK_LIBRARIES (deepflow_1 ${LIBS} )
