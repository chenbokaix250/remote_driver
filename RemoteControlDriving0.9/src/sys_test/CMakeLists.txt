cmake_minimum_required(VERSION 3.0.2)
project(sys_test)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
)


add_message_files(
  FILES
  speed.msg
  Info.msg
    )

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
    CATKIN_DEPENDS message_runtime
)


include_directories(
#include
${catkin_INCLUDE_DIRS}
)

add_executable(sys_test main.cpp)
target_link_libraries(sys_test ${catkin_LIBRARIES} )
