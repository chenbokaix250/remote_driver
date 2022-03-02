;; Auto-generated. Do not edit!


(when (boundp 'remote_truck::line)
  (if (not (find-package "REMOTE_TRUCK"))
    (make-package "REMOTE_TRUCK"))
  (shadow 'line (find-package "REMOTE_TRUCK")))
(unless (find-package "REMOTE_TRUCK::LINE")
  (make-package "REMOTE_TRUCK::LINE"))

(in-package "ROS")
;;//! \htmlinclude line.msg.html


(defclass remote_truck::line
  :super ros::object
  :slots (_xpoint _ypoint _type ))

(defmethod remote_truck::line
  (:init
   (&key
    ((:xpoint __xpoint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ypoint __ypoint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _xpoint __xpoint)
   (setq _ypoint __ypoint)
   (setq _type (round __type))
   self)
  (:xpoint
   (&optional __xpoint)
   (if __xpoint (setq _xpoint __xpoint)) _xpoint)
  (:ypoint
   (&optional __ypoint)
   (if __ypoint (setq _ypoint __ypoint)) _ypoint)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; float32[] _xpoint
    (* 4    (length _xpoint)) 4
    ;; float32[] _ypoint
    (* 4    (length _ypoint)) 4
    ;; int32 _type
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _xpoint
     (write-long (length _xpoint) s)
     (dotimes (i (length _xpoint))
       (sys::poke (elt _xpoint i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _ypoint
     (write-long (length _ypoint) s)
     (dotimes (i (length _ypoint))
       (sys::poke (elt _ypoint i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _type
       (write-long _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _xpoint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xpoint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _xpoint i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _ypoint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ypoint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ypoint i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get remote_truck::line :md5sum-) "19e372dcd9e76db80532a2b8e7a27932")
(setf (get remote_truck::line :datatype-) "remote_truck/line")
(setf (get remote_truck::line :definition-)
      "float32[] xpoint
float32[] ypoint
int32 type

")



(provide :remote_truck/line "19e372dcd9e76db80532a2b8e7a27932")


