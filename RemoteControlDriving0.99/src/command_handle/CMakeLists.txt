cmake_minimum_required(VERSION 3.0.2)
project(command_handle)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
   rospy
   std_msgs
   message_generation
)

add_message_files(
  FILES
  Info.msg
  line.msg
    )

generate_messages(
  DEPENDENCIES
  std_msgs
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


catkin_package(
    CATKIN_DEPENDS  rospy std_msgs message_runtime
)

include_directories(
#include
${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS scripts/handle.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)


