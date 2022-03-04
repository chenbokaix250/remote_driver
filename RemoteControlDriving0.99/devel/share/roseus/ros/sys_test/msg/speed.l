;; Auto-generated. Do not edit!


(when (boundp 'sys_test::speed)
  (if (not (find-package "SYS_TEST"))
    (make-package "SYS_TEST"))
  (shadow 'speed (find-package "SYS_TEST")))
(unless (find-package "SYS_TEST::SPEED")
  (make-package "SYS_TEST::SPEED"))

(in-package "ROS")
;;//! \htmlinclude speed.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sys_test::speed
  :super ros::object
  :slots (_header _mode _speed ))

(defmethod sys_test::speed
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mode __mode) 0)
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _mode (round __mode))
   (setq _speed (round __speed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16 _mode
    2
    ;; int16 _speed
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16 _mode
       (write-word _mode s)
     ;; int16 _speed
       (write-word _speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16 _mode
     (setq _mode (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _speed
     (setq _speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sys_test::speed :md5sum-) "69015ee51544e9edc0fbdcc4576063cb")
(setf (get sys_test::speed :datatype-) "sys_test/speed")
(setf (get sys_test::speed :definition-)
      "Header header
int16 mode
int16 speed


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :sys_test/speed "69015ee51544e9edc0fbdcc4576063cb")


