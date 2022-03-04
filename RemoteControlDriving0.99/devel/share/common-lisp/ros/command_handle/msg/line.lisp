; Auto-generated. Do not edit!


(cl:in-package command_handle-msg)


;//! \htmlinclude line.msg.html

(cl:defclass <line> (roslisp-msg-protocol:ros-message)
  ((xpoint
    :reader xpoint
    :initarg :xpoint
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (ypoint
    :reader ypoint
    :initarg :ypoint
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0))
)

(cl:defclass line (<line>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <line>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'line)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name command_handle-msg:<line> is deprecated: use command_handle-msg:line instead.")))

(cl:ensure-generic-function 'xpoint-val :lambda-list '(m))
(cl:defmethod xpoint-val ((m <line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader command_handle-msg:xpoint-val is deprecated.  Use command_handle-msg:xpoint instead.")
  (xpoint m))

(cl:ensure-generic-function 'ypoint-val :lambda-list '(m))
(cl:defmethod ypoint-val ((m <line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader command_handle-msg:ypoint-val is deprecated.  Use command_handle-msg:ypoint instead.")
  (ypoint m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader command_handle-msg:type-val is deprecated.  Use command_handle-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <line>) ostream)
  "Serializes a message object of type '<line>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'xpoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'xpoint))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ypoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'ypoint))
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <line>) istream)
  "Deserializes a message object of type '<line>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'xpoint) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'xpoint)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ypoint) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ypoint)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<line>)))
  "Returns string type for a message object of type '<line>"
  "command_handle/line")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'line)))
  "Returns string type for a message object of type 'line"
  "command_handle/line")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<line>)))
  "Returns md5sum for a message object of type '<line>"
  "19e372dcd9e76db80532a2b8e7a27932")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'line)))
  "Returns md5sum for a message object of type 'line"
  "19e372dcd9e76db80532a2b8e7a27932")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<line>)))
  "Returns full string definition for message of type '<line>"
  (cl:format cl:nil "float32[] xpoint~%float32[] ypoint~%int32 type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'line)))
  "Returns full string definition for message of type 'line"
  (cl:format cl:nil "float32[] xpoint~%float32[] ypoint~%int32 type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <line>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'xpoint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ypoint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <line>))
  "Converts a ROS message object to a list"
  (cl:list 'line
    (cl:cons ':xpoint (xpoint msg))
    (cl:cons ':ypoint (ypoint msg))
    (cl:cons ':type (type msg))
))
