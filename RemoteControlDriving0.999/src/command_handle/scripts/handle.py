#! /usr/bin/env python
from __future__ import print_function 
import rospy 
from command_handle.msg import line
from command_handle.msg import Info
import numpy as np 
from scipy.interpolate import make_interp_spline
from ping3 import ping

print("finish", end=' ')

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
        self.speed = msg.speed*0.25
        if msg.rotate > 0:
            self.type = 1
            self.steering = msg.rotate*0.4
        elif msg.rotate <0:
            self.type = 2
            self.steering = msg.rotate*(-0.4)
        else:
            self.type = 0
            self.steering = 0.1
        
        
        
        self.x = np.array([0*self.steering,1.0*self.steering,2.0*self.steering,3.0*self.steering])
        self.y = np.array([0*self.speed,2.85*self.speed,3.75*self.speed,3.85*self.speed])
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
