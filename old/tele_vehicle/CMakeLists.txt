cmake_minimum_required(VERSION 3.0.2)
project(tele_vehicle)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
    message_generation
    )
find_package(OpenCV REQUIRED)

add_message_files(
  FILES
  Info.msg
    )

generate_messages(
  DEPENDENCIES
  std_msgs
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5 COMPONENTS Core Gui Widgets Charts REQUIRED)

catkin_package(
    CATKIN_DEPENDS message_runtime
)

include_directories(
#include
${catkin_INCLUDE_DIRS}
${OpenCV_INCLUDE_DIRS}
)


link_directories(${OpenCV_INCLUDE_DIRS})

add_executable(tele_vehicle src/main.cpp src/mainwindow.cpp src/mainwindow.ui)
target_link_libraries(tele_vehicle ${catkin_LIBRARIES} ${OpenCV_LIBS} Qt5::Core Qt5::Gui Qt5::Widgets Qt5::Charts)


