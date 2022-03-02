cmake_minimum_required(VERSION 3.0.2)
project(tele_operator)

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

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5 COMPONENTS Core Gui Widgets Charts REQUIRED)

set(RESOURCE
    Resources/image.qrc
)

catkin_package(
    CATKIN_DEPENDS message_runtime
)

include_directories(
#include
${catkin_INCLUDE_DIRS}
)

qt5_add_resources(RESOURCES ${RESOURCE})

add_executable(tele_operator src/main.cpp src/mainwindow.cpp src/mainwindow.ui ${RESOURCES})
target_link_libraries(tele_operator ${catkin_LIBRARIES} Qt5::Core Qt5::Gui Qt5::Widgets Qt5::Charts)


