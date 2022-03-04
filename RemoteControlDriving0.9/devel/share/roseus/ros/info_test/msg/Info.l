;; Auto-generated. Do not edit!


(when (boundp 'info_test::Info)
  (if (not (find-package "INFO_TEST"))
    (make-package "INFO_TEST"))
  (shadow 'Info (find-package "INFO_TEST")))
(unless (find-package "INFO_TEST::INFO")
  (make-package "INFO_TEST::INFO"))

(in-package "ROS")
;;//! \htmlinclude Info.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass info_test::Info
  :super ros::object
  :slots (_header _mode _speed _gear _lb _hb _hnk _rotate _rearview _acc_p _clu_p _brk_p ))

(defmethod info_test::Info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mode __mode) 0)
    ((:speed __speed) 0)
    ((:gear __gear) 0)
    ((:lb __lb) 0)
    ((:hb __hb) 0)
    ((:hnk __hnk) 0)
    ((:rotate __rotate) 0)
    ((:rearview __rearview) 0)
    ((:acc_p __acc_p) 0)
    ((:clu_p __clu_p) 0)
    ((:brk_p __brk_p) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _mode (round __mode))
   (setq _speed (round __speed))
   (setq _gear (round __gear))
   (setq _lb (round __lb))
   (setq _hb (round __hb))
   (setq _hnk (round __hnk))
   (setq _rotate (round __rotate))
   (setq _rearview (round __rearview))
   (setq _acc_p (round __acc_p))
   (setq _clu_p (round __clu_p))
   (setq _brk_p (round __brk_p))
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
  (:gear
   (&optional __gear)
   (if __gear (setq _gear __gear)) _gear)
  (:lb
   (&optional __lb)
   (if __lb (setq _lb __lb)) _lb)
  (:hb
   (&optional __hb)
   (if __hb (setq _hb __hb)) _hb)
  (:hnk
   (&optional __hnk)
   (if __hnk (setq _hnk __hnk)) _hnk)
  (:rotate
   (&optional __rotate)
   (if __rotate (setq _rotate __rotate)) _rotate)
  (:rearview
   (&optional __rearview)
   (if __rearview (setq _rearview __rearview)) _rearview)
  (:acc_p
   (&optional __acc_p)
   (if __acc_p (setq _acc_p __acc_p)) _acc_p)
  (:clu_p
   (&optional __clu_p)
   (if __clu_p (setq _clu_p __clu_p)) _clu_p)
  (:brk_p
   (&optional __brk_p)
   (if __brk_p (setq _brk_p __brk_p)) _brk_p)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16 _mode
    2
    ;; int16 _speed
    2
    ;; int16 _gear
    2
    ;; int16 _lb
    2
    ;; int16 _hb
    2
    ;; int16 _hnk
    2
    ;; int16 _rotate
    2
    ;; int16 _rearview
    2
    ;; int16 _acc_p
    2
    ;; int16 _clu_p
    2
    ;; int16 _brk_p
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
     ;; int16 _gear
       (write-word _gear s)
     ;; int16 _lb
       (write-word _lb s)
     ;; int16 _hb
       (write-word _hb s)
     ;; int16 _hnk
       (write-word _hnk s)
     ;; int16 _rotate
       (write-word _rotate s)
     ;; int16 _rearview
       (write-word _rearview s)
     ;; int16 _acc_p
       (write-word _acc_p s)
     ;; int16 _clu_p
       (write-word _clu_p s)
     ;; int16 _brk_p
       (write-word _brk_p s)
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
   ;; int16 _gear
     (setq _gear (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _lb
     (setq _lb (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _hb
     (setq _hb (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _hnk
     (setq _hnk (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _rotate
     (setq _rotate (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _rearview
     (setq _rearview (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _acc_p
     (setq _acc_p (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _clu_p
     (setq _clu_p (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _brk_p
     (setq _brk_p (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get info_test::Info :md5sum-) "2ae84e5fb4747e05b67e7c377e5c6576")
(setf (get info_test::Info :datatype-) "info_test/Info")
(setf (get info_test::Info :definition-)
      "Header header
int16 mode
int16 speed
int16 gear
int16 lb
int16 hb
int16 hnk
int16 rotate
int16 rearview
int16 acc_p
int16 clu_p
int16 brk_p

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



(provide :info_test/Info "2ae84e5fb4747e05b67e7c377e5c6576")


