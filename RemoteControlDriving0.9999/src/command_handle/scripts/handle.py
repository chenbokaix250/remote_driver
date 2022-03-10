#! /usr/bin/env python
# encoding:utf-8
from __future__ import print_function 
import rospy 
from command_handle.msg import line
from command_handle.msg import Info
import numpy as np 
from scipy.interpolate import make_interp_spline


#-------标定区域-----------
SPEED_SCALE = 0.25
ROTATE_SCALE =0.4
X_0STEP = 0.0
X_1STEP = 1.0
X_2STEP = 2.0
X_3STEP = 3.0
Y_0STEP = 0.0
Y_1STEP = 2.85
Y_2STEP = 3.75
Y_3STEP = 3.85

#-------标定区域-----------

class Handle(object):
    def __init__(self):
        self.speed = 0
        self.steering = 0
        self.type = 0
        self.x = []
        self.y = []
        self.x_smooth = []
        self.y_smooth = []
        self.delay = 0

        self.msg_line = line()

        rospy.init_node("Handle_line")

        self.pub = rospy.Publisher("line_point",line,queue_size=10)
        rospy.Subscriber("/operator/pub_info", Info, self.update_value)

    def update_value(self,msg):
        self.delay = 1
        self.speed = msg.speed*SPEED_SCALE
        if msg.rotate > 0:
            self.type = 1
            self.steering = msg.rotate*ROTATE_SCALE
        elif msg.rotate <0:
            self.type = 2
            self.steering = msg.rotate*(-1)*ROTATE_SCALE
        else:
            self.type = 0
            self.steering = 0.1
        
        
        
        self.x = np.array([X_0STEP*self.steering,X_1STEP*self.steering,X_2STEP*self.steering,X_3STEP*self.steering])
        self.y = np.array([Y_0STEP*self.speed,Y_1STEP*self.speed,Y_2STEP*self.speed,Y_3STEP*self.speed])
        self.x_smooth = np.linspace( self.x.max(), self.x.min(),30)
        self.y_smooth = make_interp_spline( self.x, self.y)( self.x_smooth)
    
        self.msg_line.xpoint = self.x_smooth
        self.msg_line.ypoint = self.y_smooth
        self.msg_line.type = self.type
        self.msg_line.delay = self.delay
        print(self.msg_line)
    def run(self):
        r = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.pub.publish(self.msg_line)
            r.sleep()
    


if __name__ == '__main__':

    handle = Handle()
    handle.run()
    rospy.spin()
