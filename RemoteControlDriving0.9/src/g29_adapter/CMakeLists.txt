cmake_minimum_required(VERSION 3.0.2)
project(g29_adapter)

add_compile_options(-std=c++11)
find_package(catkin REQUIRED COMPONENTS
     roscpp
     rospy
     sensor_msgs
     genmsg
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

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(g29_adapter g29_adapter.cpp)
target_link_libraries(g29_adapter ${catkin_LIBRARIES})
