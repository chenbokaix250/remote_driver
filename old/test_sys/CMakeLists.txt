cmake_minimum_required(VERSION 3.0.2)
project(test_sys)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
)


add_message_files(
  FILES
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

add_executable(test_sys src/main.cpp)
target_link_libraries(test_sys ${catkin_LIBRARIES} )
