; Auto-generated. Do not edit!


(cl:in-package info_test-msg)


;//! \htmlinclude Info.msg.html

(cl:defclass <Info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0)
   (gear
    :reader gear
    :initarg :gear
    :type cl:fixnum
    :initform 0)
   (lb
    :reader lb
    :initarg :lb
    :type cl:fixnum
    :initform 0)
   (hb
    :reader hb
    :initarg :hb
    :type cl:fixnum
    :initform 0)
   (hnk
    :reader hnk
    :initarg :hnk
    :type cl:fixnum
    :initform 0)
   (rotate
    :reader rotate
    :initarg :rotate
    :type cl:fixnum
    :initform 0)
   (rearview
    :reader rearview
    :initarg :rearview
    :type cl:fixnum
    :initform 0)
   (acc_p
    :reader acc_p
    :initarg :acc_p
    :type cl:fixnum
    :initform 0)
   (clu_p
    :reader clu_p
    :initarg :clu_p
    :type cl:fixnum
    :initform 0)
   (brk_p
    :reader brk_p
    :initarg :brk_p
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Info (<Info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name info_test-msg:<Info> is deprecated: use info_test-msg:Info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:header-val is deprecated.  Use info_test-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:mode-val is deprecated.  Use info_test-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:speed-val is deprecated.  Use info_test-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'gear-val :lambda-list '(m))
(cl:defmethod gear-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:gear-val is deprecated.  Use info_test-msg:gear instead.")
  (gear m))

(cl:ensure-generic-function 'lb-val :lambda-list '(m))
(cl:defmethod lb-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:lb-val is deprecated.  Use info_test-msg:lb instead.")
  (lb m))

(cl:ensure-generic-function 'hb-val :lambda-list '(m))
(cl:defmethod hb-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:hb-val is deprecated.  Use info_test-msg:hb instead.")
  (hb m))

(cl:ensure-generic-function 'hnk-val :lambda-list '(m))
(cl:defmethod hnk-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:hnk-val is deprecated.  Use info_test-msg:hnk instead.")
  (hnk m))

(cl:ensure-generic-function 'rotate-val :lambda-list '(m))
(cl:defmethod rotate-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:rotate-val is deprecated.  Use info_test-msg:rotate instead.")
  (rotate m))

(cl:ensure-generic-function 'rearview-val :lambda-list '(m))
(cl:defmethod rearview-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:rearview-val is deprecated.  Use info_test-msg:rearview instead.")
  (rearview m))

(cl:ensure-generic-function 'acc_p-val :lambda-list '(m))
(cl:defmethod acc_p-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:acc_p-val is deprecated.  Use info_test-msg:acc_p instead.")
  (acc_p m))

(cl:ensure-generic-function 'clu_p-val :lambda-list '(m))
(cl:defmethod clu_p-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:clu_p-val is deprecated.  Use info_test-msg:clu_p instead.")
  (clu_p m))

(cl:ensure-generic-function 'brk_p-val :lambda-list '(m))
(cl:defmethod brk_p-val ((m <Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader info_test-msg:brk_p-val is deprecated.  Use info_test-msg:brk_p instead.")
  (brk_p m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Info>) ostream)
  "Serializes a message object of type '<Info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gear)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lb)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'hb)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'hnk)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rotate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rearview)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acc_p)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'clu_p)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'brk_p)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Info>) istream)
  "Deserializes a message object of type '<Info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gear) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lb) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hb) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hnk) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rotate) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rearview) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_p) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'clu_p) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'brk_p) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Info>)))
  "Returns string type for a message object of type '<Info>"
  "info_test/Info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Info)))
  "Returns string type for a message object of type 'Info"
  "info_test/Info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Info>)))
  "Returns md5sum for a message object of type '<Info>"
  "2ae84e5fb4747e05b67e7c377e5c6576")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Info)))
  "Returns md5sum for a message object of type 'Info"
  "2ae84e5fb4747e05b67e7c377e5c6576")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Info>)))
  "Returns full string definition for message of type '<Info>"
  (cl:format cl:nil "Header header~%int16 mode~%int16 speed~%int16 gear~%int16 lb~%int16 hb~%int16 hnk~%int16 rotate~%int16 rearview~%int16 acc_p~%int16 clu_p~%int16 brk_p~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Info)))
  "Returns full string definition for message of type 'Info"
  (cl:format cl:nil "Header header~%int16 mode~%int16 speed~%int16 gear~%int16 lb~%int16 hb~%int16 hnk~%int16 rotate~%int16 rearview~%int16 acc_p~%int16 clu_p~%int16 brk_p~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
     2
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Info>))
  "Converts a ROS message object to a list"
  (cl:list 'Info
    (cl:cons ':header (header msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':gear (gear msg))
    (cl:cons ':lb (lb msg))
    (cl:cons ':hb (hb msg))
    (cl:cons ':hnk (hnk msg))
    (cl:cons ':rotate (rotate msg))
    (cl:cons ':rearview (rearview msg))
    (cl:cons ':acc_p (acc_p msg))
    (cl:cons ':clu_p (clu_p msg))
    (cl:cons ':brk_p (brk_p msg))
))
